angular.module('ngScaffoldApp').factory('DataFactory', [
  '$http', function($http) {
    var _getHTML, _getJSON;
    _getJSON = function(path) {
      return $http.get('http://localhost:3000/static/json/' + path);
    };
    _getHTML = function(path) {
      return $http.get('http://localhost:3000/static/html/' + path);
    };
    return {
      getJSON: _getJSON,
      getHTML: _getHTML
    };
  }
]);

//# sourceMappingURL=data-service.js.map
