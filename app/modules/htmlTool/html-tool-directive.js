'use strict';
angular.module('ngScaffoldApp').directive('htmlTool', function(UrlFactory, Utils) {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      html: '=',
      url: '=',
      item: '='
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
      scope.addText = function(url) {
        var item;
        item = {
          type: 'text',
          url: url,
          years: Utils.flattenObj(scope.html.years),
          people: Utils.flattenObj(scope.html.people),
          parent: scope.encode(scope.url)
        };
        return scope.$emit('addItem', item);
      };
      scope.addImage = function(node) {
        var item;
        item = {
          type: 'image',
          node: node,
          years: Utils.flattenObj(scope.html.years),
          people: Utils.flattenObj(scope.html.people),
          parent: scope.encode(scope.url)
        };
        scope.$emit('addItem', item);
      };
    }
  };
});

//# sourceMappingURL=html-tool-directive.js.map
