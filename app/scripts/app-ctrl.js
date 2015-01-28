'use strict';
angular.module('ngScaffoldApp').controller('AppCtrl', [
  '$scope', '$timeout', function($scope, $timeout) {
    return $scope.$on('alert', function(event, data) {
      $scope.alert = data;
      return $timeout((function() {
        $scope.alert = {};
      }), 2000);
    });
  }
]);

//# sourceMappingURL=app-ctrl.js.map
