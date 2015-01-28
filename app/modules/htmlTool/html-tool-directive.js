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
      scope.types = {
        'people': scope.html.people,
        'years': scope.html.years,
        'streets': scope.html.streets
      };
      scope.goTo = function(index, type) {
        var elInCopy;
        elInCopy = document.querySelectorAll('.' + type + '-' + index)[0];
        elInCopy.scrollIntoView({
          block: "end",
          behavior: "smooth"
        });
        elInCopy.classList.add('in-view');
        window.setTimeout(function() {
          return elInCopy.classList.remove('in-view');
        }, 2000);
      };
      scope.encode = UrlFactory.encode;
      scope.addImage = function(node) {
        var item;
        item = {
          type: 'image',
          node: node,
          years: scope.html.years,
          people: scope.html.people,
          parent: scope.encode(scope.url)
        };
        scope.$emit('addItem', item);
      };
    }
  };
});

//# sourceMappingURL=html-tool-directive.js.map
