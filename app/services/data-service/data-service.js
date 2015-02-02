angular.module('ngScaffoldApp').factory('DataFactory', [
  '$http', function($http) {
    var _buildJSON, _getHTML, _getJSON;
    _buildJSON = function(data) {
      return $http.post('http://localhost:3000/static/json/', data);
    };
    _getJSON = function(path) {
      return $http.get('http://localhost:3000/static/json/' + path);
    };
    _getHTML = function(path) {
      return $http.get('http://localhost:3000/static/html/' + path);
    };
    return {
      getJSON: _getJSON,
      buildJSON: _buildJSON,
      getHTML: _getHTML
    };
  }
]);

//# sourceMappingURL=data-service.js.map
