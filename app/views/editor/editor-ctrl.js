'use strict';

/**
@ngdoc function
@name ngScaffoldApp.controller:MainCtrl
@description
 * MainCtrl
Controller of the ngScaffoldApp
 */
angular.module('ngScaffoldApp').controller('EditorCtrl', [
  '$scope', 'DataFactory', function($scope, DataFactory) {
    DataFactory.getJSON().then(function(json) {
      return $scope.node = json.data;
    });
    $scope.$on('html-open', function(event, args) {
      return $scope.activeNode = args.path;
    });
    return $scope.$on('html-closed', function(event, args) {
      return $scope.activeNode = '';
    });
  }
]);

//# sourceMappingURL=editor-ctrl.js.map
