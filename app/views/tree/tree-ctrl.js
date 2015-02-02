'use strict';
angular.module('ngScaffoldApp').controller('TreeCtrl', [
  '$scope', '$sce', '$stateParams', 'DB', 'UrlFactory', function($scope, $sce, $stateParams, DB, UrlFactory) {
    var _getTree;
    $scope.openfolders = [];
    _getTree = function() {
      return DB.getTree(UrlFactory.decode($stateParams.path)).then(function(tree) {
        return $scope.node = tree;
      });
    };
    $scope.buildJSON = function() {
      return DB.buildJSON().then(function(data) {
        return $scope.$emit('alert', {
          type: 'success',
          message: 'JSON created at ' + data.data
        });
      });
    };
    $scope.openitem = function(id) {
      return DB.getById('items', id).then(function(item) {
        return console.log(item);
      });
    };
    $scope.openfile = function(url) {
      return $scope.htmlurl = '#/html/' + $sce.trustAsResourceUrl(UrlFactory.decode(url));
    };
    $scope.closefile = function() {
      return $scope.htmlurl = '';
    };
    $scope.toggledone = function(path, bool) {
      return DB.updateNode(UrlFactory.decode(path), {
        'done': bool
      }).then(function(json) {
        return _getTree();
      }, function(e) {
        return _getTree();
      });
    };
    $scope.addtotrash = function(path) {
      return DB.updateNode(UrlFactory.decode(path), {
        'trashed': true
      }).then(function(json) {
        return _getTree();
      }, function(e) {
        return _getTree();
      });
    };
    return _getTree();
  }
]);

//# sourceMappingURL=tree-ctrl.js.map
