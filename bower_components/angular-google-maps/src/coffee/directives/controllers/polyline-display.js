angular.module('uiGmapgoogle-maps').controller('uiGmapPolylineDisplayController', [
  '$scope', function($scope) {
    return $scope.toggleStrokeColor = function() {
      return $scope.stroke.color = ($scope.stroke.color === '#6060FB' ? 'red' : '#6060FB');
    };
  }
]);

//# sourceMappingURL=polyline-display.js.map
