'use strict';
angular.module('ngScaffoldApp').controller('TreeCtrl', [
  '$scope', '$sce', '$stateParams', 'DataFactory', 'DB', 'FilterFactory', 'UrlFactory', function($scope, $sce, $stateParams, DataFactory, DB, FilterFactory, UrlFactory) {
    var getTree;
    $scope.openfolders = [];
    getTree = function() {
      return DB.getTree(UrlFactory.decode($stateParams.path)).then(function(tree) {
        return $scope.node = tree;
      });
    };
    $scope.openfile = function(url) {
      return $scope.htmlurl = '#/html/' + $sce.trustAsResourceUrl(UrlFactory.decode(url));
    };
    $scope.closefile = function() {
      return $scope.htmlurl = '';
    };
    $scope.addtotrash = function(path) {
      return DB.trash(UrlFactory.decode(path)).then(function(json) {
        return getTree();
      }, function(e) {
        return getTree();
      });
    };
    return getTree();
  }
]);

//# sourceMappingURL=tree-ctrl.js.map
