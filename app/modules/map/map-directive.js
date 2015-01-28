'use strict';
angular.module('ngScaffoldApp').directive('map', function($log, DB) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-tmplt.html',
    link: function(scope, element, attrs) {
      var addNewItem, updateMap;
      scope.activeMarker = '';
      scope.newPlace = {};
      scope.selectedPeople = {};
      scope.selectedYears = {};
      scope.markers = [];
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
          click: function(map, eventName, args) {
            return scope.$apply(function() {
              scope.newPlace = {
                coords: {
                  latitude: args[0].latLng.k,
                  longitude: args[0].latLng.C
                }
              };
              return scope.activeMarker = '';
            });
          }
        }
      };
      scope.marker = {
        events: {
          click: function(marker, eventName, args) {
            var place;
            place = _.find(scope.markers, {
              '_id': marker.key
            });
            return scope.$apply(function() {
              scope.activeMarker = {
                id: marker.key,
                name: place.name,
                coords: place.longitude + ',' + place.latitude
              };
              return scope.newPlace = '';
            });
          }
        }
      };
      addNewItem = function(item, people, years) {
        var person, selectedPeople, selectedYears, year;
        selectedPeople = [];
        for (person in people) {
          if (people[person]) {
            selectedPeople.push(person);
          }
        }
        selectedYears = [];
        for (year in years) {
          if (years[year]) {
            selectedYears.push(year);
          }
        }
        return DB.post('items', {
          parent: item.parent,
          src: item.node.src.www,
          type: item.type,
          people: selectedPeople,
          years: selectedYears
        });
      };
      updateMap = function() {
        console.log('updateMap');
        return DB.get('map').then(function(markers) {
          console.log(markers);
          scope.newPlace = '';
          scope.markers = markers.data;
          return scope.$emit('alert', {
            type: 'success',
            message: 'Map Updated'
          });
        });
      };
      scope.addNew = function(item, newPlace) {
        return addNewItem(item, scope.selectedPeople, scope.selectedYears).then(function(item) {
          console.log('item added');
          return DB.post('map', {
            name: newPlace.name,
            latitude: newPlace.coords.latitude,
            longitude: newPlace.coords.longitude,
            items: [item.data[0]._id]
          });
        }).then(function(place) {
          console.log(place);
          return updateMap();
        });
      };
      scope.updatePlace = function(item, activeMarkerId) {
        return addNewItem(item, scope.selectedPeople, scope.selectedYears).then(function(item) {
          return DB.put('map', activeMarkerId, {
            $addToSet: {
              items: item.data[0]._id
            }
          });
        }).then(function(place) {
          return updateMap();
        });
      };
      return updateMap();
    }
  };
});

//# sourceMappingURL=map-directive.js.map
