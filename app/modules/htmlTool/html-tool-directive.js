'use strict';
angular.module('ngScaffoldApp').directive('htmlTool', function() {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      html: '=',
      url: '='
    },
    templateUrl: '/modules/htmlTool/html-tool-tmplt.html',
    link: function(scope, element, attrs) {
      return console.log(scope);
    }
  };
});

//# sourceMappingURL=html-tool-directive.js.map
