angular.module('ngScaffoldApp').factory('DB', [
  '$http', 'UrlFactory', function($http, UrlFactory) {
    var _get, _getTree, _trash;
    _trash = function(path) {
      return $http.put('http://localhost:3000/collections/tree/' + path, {
        'trashed': true
      });
    };
    _get = function(collection) {
      return $http.get('http://localhost:3000/collections/' + collection);
    };
    _getTree = function(parent) {
      return $http.get('http://localhost:3000/collections/tree/' + parent);
    };
    return {
      trash: _trash,
      get: _get,
      getTree: _getTree
    };
  }
]);

//# sourceMappingURL=db-service.js.map
