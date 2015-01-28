'use strict';
angular.module('ngScaffoldApp').directive('map', function($log, UrlFactory, uiGmapGoogleMapApi) {
  return {
    restrict: 'E',
    replace: true,
    transclude: true,
    templateUrl: '/modules/map/map-tmplt.html',
    link: function(scope, element, attrs) {
      scope.coords = '';
      scope.activeMarkerId = '';
      scope.item = {
        id: '/texter/1808',
        type: 'text'
      };
      scope.map = {
        center: {
          latitude: 63.522180,
          longitude: 22.530485
        },
        zoom: 14,
        events: {
          click: function(map, eventName, args) {
            return scope.$apply(function() {
              scope.coords = args[0].latLng;
              return scope.activeMarkerId = '';
            });
          }
        }
      };
      scope.marker = {
        id: 1,
        coords: {
          latitude: 63.522180,
          longitude: 22.530485
        },
        events: {
          click: function(marker, eventName, args) {
            return scope.$apply(function() {
              return scope.activeMarkerId = marker.key;
            });
          }
        }
      };
      scope.addNew = function(itemId, coords) {
        return console.log('Adding ' + itemId + ' to ' + coords.toString());
      };
      return scope.updatePlace = function(itemId, activeMarkerId) {
        return console.log('Updating ' + activeMarkerId + ' with ' + itemId);
      };
    }
  };
});

//# sourceMappingURL=map-directive.js.map
