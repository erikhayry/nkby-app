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
      scope.goTo = function(index) {
        $('body').scrollTo('.person-' + index);
      };
    }
  };
});

//# sourceMappingURL=html-tool-directive.js.map
