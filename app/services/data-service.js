angular.module('ngScaffoldApp').factory('DataFactory', [
  '$http', function($http) {
    var _getJSON;
    _getJSON = function() {
      return $http.get('http://localhost:3000/static/json/data-tree-sidor');
    };
    return {
      getJSON: _getJSON
    };
  }
]);

//# sourceMappingURL=data-service.js.map
