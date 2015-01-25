'use strict';
angular.module('ngScaffoldApp').directive('htmlTool', function(UrlFactory) {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      html: '=',
      url: '='
    },
    templateUrl: '/modules/htmlTool/html-tool-tmplt.html',
    link: function(scope, element, attrs) {
      scope.goTo = function(index) {
        return $('body').scrollTo('.person-' + index);
      };
      return scope.encode = UrlFactory.encode;
    }
  };
});

//# sourceMappingURL=html-tool-directive.js.map
