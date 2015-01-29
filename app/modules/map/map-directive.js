'use strict';
angular.module('ngScaffoldApp').directive('map', function($log, $q, DB, MapService, UrlFactory) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-tmplt.html',
    link: function(scope, element, attrs) {
      var _getItem, _getPlaceItems, _setNewMarker, _updateMap;
      scope.activeMarker = '';
      scope.newPlace = {};
      scope.selectedPeople = {};
      scope.selectedYears = {};
      scope.markers = [];
      _getItem = function() {
        var oldItemPeople, oldItemYears;
        oldItemPeople = scope.item.people;
        oldItemYears = scope.item.years;
        return DB.getById('items', '54c9fe94628f8b07936ece97').then(function(item) {
          var people, year;
          for (year in item.data.years) {
            scope.selectedYears[item.data.years[year]] = true;
          }
          for (people in item.data.people) {
            scope.selectedPeople[item.data.people[people]] = true;
          }
          item.data.years = _.union(item.data.years, oldItemYears);
          item.data.people = _.union(item.data.people, oldItemPeople);
          return scope.item = item.data;
        });
      };
      _updateMap = function() {
        return DB.get('map').then(function(markers) {
          scope.newPlace = '';
          scope.markers = markers.data;
          return scope.$emit('alert', {
            type: 'success',
            message: 'Map Updated'
          });
        });
      };
      _getPlaceItems = function(marker, eventName, args) {
        var item, items, place;
        place = _.find(scope.markers, {
          '_id': marker.key
        });
        items = [];
        for (item in place.items) {
          items.push(DB.getById('items', place.items[item]));
        }
        $q.all(items).then(function(data) {
          return scope.activeMarker.items = data;
        });
        return scope.$apply(function() {
          scope.activeMarker = {
            id: marker.key,
            name: place.name,
            coords: place.longitude + ',' + place.latitude
          };
          return scope.newPlace = '';
        });
      };
      _setNewMarker = function(map, eventName, args) {
        return scope.$apply(function() {
          scope.newPlace = {
            coords: {
              latitude: args[0].latLng.k,
              longitude: args[0].latLng.C
            }
          };
          return scope.activeMarker = '';
        });
      };
      scope.marker = {
        events: {
          click: _getPlaceItems
        }
      };
      scope.map = {
        center: {
          latitude: 63.522180,
          longitude: 22.530485
        },
        zoom: 14,
        options: {
          scrollwheel: false
        },
        events: {
          click: _setNewMarker
        }
      };
      scope.addPerson = function(person) {
        scope.selectedPeople[person] = true;
        return scope.item.people.push(person);
      };
      scope.addYear = function(year) {
        scope.selectedYears[year] = true;
        return scope.item.years.push(year);
      };
      scope.updateItem = function(item) {
        return MapService.updateItem(item, scope.selectedPeople, scope.selectedYears).then(function() {
          return scope.$emit('alert', {
            type: 'success',
            message: 'Item Updated'
          });
        });
      };
      scope.addNew = function(item, newPlace) {
        return MapService.addItem(item, scope.selectedPeople, scope.selectedYears).then(function(newItem) {
          var arr;
          arr = [
            DB.updateNode(UrlFactory.decode('/apple-touch-icon.png'), {
              'itemId': newItem.data[0]._id
            }), DB.post('map', {
              name: newPlace.name,
              latitude: newPlace.coords.latitude,
              longitude: newPlace.coords.longitude,
              items: [newItem.data[0]._id]
            })
          ];
          return $q.all(arr);
        }).then(function() {
          return _updateMap();
        });
      };
      scope.removeItemFromPlace = function(item, activeMarkerId) {
        return DB.put('map', activeMarkerId, {
          $pull: {
            items: item._id
          }
        }).then(function() {
          return _updateMap();
        });
      };
      scope.updateItemToNewPlace = function(item, newPlace) {
        return MapService.updateItem(item, scope.selectedPeople, scope.selectedYears).then(function() {
          return DB.post('map', {
            name: newPlace.name,
            latitude: newPlace.coords.latitude,
            longitude: newPlace.coords.longitude,
            items: [item._id]
          });
        }).then(function() {
          return _updateMap();
        }, function(e) {
          return console.log(e);
        });
      };
      scope.updatePlace = function(item, activeMarkerId) {
        return MapService.addItem(item, scope.selectedPeople, scope.selectedYears).then(function(item) {
          return DB.put('map', activeMarkerId, {
            $addToSet: {
              items: item.data[0]._id
            }
          });
        }).then(function() {
          return _updateMap();
        });
      };
      scope.updateItemToMarker = function(item, activeMarkerId) {
        return MapService.updateItem(item, scope.selectedPeople, scope.selectedYears).then(function() {
          return DB.put('map', activeMarkerId, {
            $addToSet: {
              items: item._id
            }
          });
        }).then(function() {
          return _updateMap();
        });
      };
      scope.cancel = function() {
        return scope.$emit('addItem', '');
      };
      scope.deletePlace = function(marker) {
        return DB["delete"]('map', marker.id).then(function() {
          return _updateMap();
        });
      };
      _updateMap();
      return _getItem();
    }
  };
});

angular.module('ngScaffoldApp').directive('mapItem', function($log, $q, DB) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-item-tmplt.html'
  };
});

angular.module('ngScaffoldApp').directive('mapItems', function($log, $q, DB) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-items-tmplt.html'
  };
});

angular.module('ngScaffoldApp').directive('mapPlace', function($log, $q, DB) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-place-tmplt.html'
  };
});

//# sourceMappingURL=map-directive.js.map
