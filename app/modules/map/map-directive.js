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
        return DB.getById('items', '54c9fe94628f8b07936ece97').then(function(item) {
          return console.log(item);
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
              newItems: [newItem.data[0]._id]
            })
          ];
          return $q.all(arr);
        }).then(function() {
          return _updateMap();
        }, function(e) {
          return _updateMap();
        });
      };
      scope.updatePlace = function(item, activeMarkerId) {
        return MapService.addItem(item, scope.selectedPeople, scope.selectedYears).then(function(item) {
          return DB.put('map', activeMarkerId, {
            $addToSet: {
              items: item.data[0]._id
            }
          });
        }).then(function(place) {
          return _updateMap();
        });
      };
      scope.cancel = function() {
        return scope.$emit('addItem', '');
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
