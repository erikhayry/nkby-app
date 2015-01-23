angular.module('ngScaffoldApp').factory('UrlFactory', [
  function() {
    var _toTitle, _urlToPath;
    _urlToPath = function(urlPath) {
      return urlPath.replace(/-/g, '/');
    };
    _toTitle = function(urlPath) {
      return urlPath.replace(/-/g, ' ');
    };
    return {
      urlToPath: _urlToPath,
      toTitle: _toTitle
    };
  }
]);

//# sourceMappingURL=url-service.js.map
