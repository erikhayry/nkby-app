'use strict';

/**
@ngdoc function
@name ngScaffoldApp.controller:MainCtrl
@description
 * MainCtrl
Controller of the ngScaffoldApp
 */
angular.module('ngScaffoldApp').controller('TreeCtrl', [
  '$scope', '$stateParams', 'DataFactory', 'UrlFactory', function($scope, $stateParams, DataFactory, UrlFactory) {
    return DataFactory.getJSON($stateParams.path).then(function(json) {
      return $scope.node = json.data;
    });
  }
]);

//# sourceMappingURL=tree-ctrl.js.map
