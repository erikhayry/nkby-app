'use strict';
angular.module('ngScaffoldApp').directive('map', function($log, DB) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-tmplt.html',
    link: function(scope, element, attrs) {
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
              scope.newPlace.coords = {
                latitude: args[0].latLng.k,
                longitude: args[0].latLng.C
              };
              return scope.activeMarker = {};
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
              return scope.newPlace = {};
            });
          }
        }
      };
      DB.get('map').then(function(markers) {
        return scope.markers = markers.data;
      });
      scope.addNew = function(item, newPlace) {
        var person, selectedPeople, selectedYears, year;
        selectedPeople = [];
        for (person in scope.selectedPeople) {
          if (scope.selectedPeople[person]) {
            selectedPeople.push(person);
          }
        }
        selectedYears = [];
        for (year in scope.selectedYears) {
          if (scope.selectedYears[year]) {
            selectedYears.push(year);
          }
        }
        return DB.post('items', {
          parent: item.parent,
          src: item.url,
          type: item.type,
          people: selectedPeople,
          years: selectedYears
        }).then(function(item) {
          return DB.post('map', {
            name: newPlace.name,
            latitude: newPlace.coords.latitude,
            longitude: newPlace.coords.longitude,
            items: [item.data[0]._id]
          });
        }).then(function(place) {
          return DB.get('map');
        }).then(function(markers) {
          return scope.markers = markers.data;
        });
      };
      return scope.updatePlace = function(itemId, activeMarker) {
        return console.log('Updating ' + activeMarker + ' with ' + itemId);
      };
    }
  };
});

//# sourceMappingURL=map-directive.js.map
