angular.module('ngScaffoldApp').factory('DB', [
  '$http', 'UrlFactory', function($http, UrlFactory) {
    var _get, _trash;
    _trash = function(path) {
      return $http.post('http://localhost:3000/collections/trash', {
        'path': path
      });
    };
    _get = function(collection) {
      return $http.get('http://localhost:3000/collections/' + collection);
    };
    return {
      trash: _trash,
      get: _get
    };
  }
]);

//# sourceMappingURL=db-service.js.map
