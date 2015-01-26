angular.module('ngScaffoldApp').factory('FilterFactory', [
  '$q', 'DB', function($q, DB) {
    var _check, _compare, _mark, _tree;
    _compare = function(node, trashItem, status) {
      if (node.path === trashItem.path) {
        return node.status = status;
      }
    };
    _check = function(node, trashData, status) {
      var trashItem, _i, _len, _results;
      if (node.children) {
        _mark(node.children, trashData, status);
      }
      _results = [];
      for (_i = 0, _len = trashData.length; _i < _len; _i++) {
        trashItem = trashData[_i];
        _results.push(_compare(node, trashItem, status));
      }
      return _results;
    };
    _mark = function(treeData, trashData, status) {
      var node, _i, _len;
      for (_i = 0, _len = treeData.length; _i < _len; _i++) {
        node = treeData[_i];
        _check(node, trashData, status);
      }
      return treeData;
    };
    _tree = function(treeData) {
      return $q(function(resolve, reject) {
        return DB.get('trash').then(function(trashData) {
          console.log(_mark(treeData.data, trashData.data, 'trash'));
          return resolve(treeData);
        });
      });
    };
    return {
      tree: _tree
    };
  }
]);

//# sourceMappingURL=filter-service.js.map
