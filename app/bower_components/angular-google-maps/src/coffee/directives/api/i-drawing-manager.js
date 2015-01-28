angular.module('uiGmapgoogle-maps.directives.api').service('uiGmapIDrawingManager', [
  function() {
    return {
      restrict: 'EA',
      replace: true,
      require: '^' + 'uiGmapGoogleMap',
      scope: {
        "static": '@',
        control: '=',
        options: '='
      }
    };
  }
]);

//# sourceMappingURL=i-drawing-manager.js.map
