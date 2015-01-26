'use strict';
angular.module('ngScaffoldApp').controller('TreeCtrl', [
  '$scope', '$stateParams', 'DataFactory', 'DB', 'FilterFactory', function($scope, $stateParams, DataFactory, DB, FilterFactory) {
    DataFactory.getJSON($stateParams.path).then(function(json) {
      return FilterFactory.tree(json.data);
    }).then(function(tree) {
      return $scope.node = tree;
    });
    $scope.trash = function(path) {
      return DB.trash(path).then(function(json) {
        return console.log(json);
      });
    };
  }
]);

//# sourceMappingURL=tree-ctrl.js.map
