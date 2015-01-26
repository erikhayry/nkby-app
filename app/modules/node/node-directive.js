'use strict';
angular.module('ngScaffoldApp').directive('node', function() {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      nodes: '=',
      trash: '='
    },
    templateUrl: '/modules/node/node-tmplt.html',
    link: function(scope, element, attrs) {}
  };
});

angular.module('ngScaffoldApp').directive('nodeChild', function($compile, $rootScope, UrlFactory, DB) {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      child: '=',
      trash: '='
    },
    controller: 'NodeCtrl',
    templateUrl: '/modules/node/node-child-tmplt.html',
    link: function(scope, element, attrs) {
      scope.decode = UrlFactory.decode;
      scope.isFolder = function(node) {
        return node.base.indexOf('.') < 0;
      };
      scope.toggle = function() {
        var ulEl;
        ulEl = element.find('ul');
        if (ulEl.length > 0) {
          ulEl.toggleClass('hidden');
        } else {
          DB.getTree(UrlFactory.decode(scope.child._id)).then(function(tree) {
            $scope.children = tree;
            return $compile('<node nodes="children" trash="trash"></node>')(scope, function(cloned, scope) {
              return element.append(cloned);
            });
          });
        }
      };
      return scope.open = function(node) {
        $rootScope.$broadcast('html-open', node);
        return scope.html = 'some data';
      };
    }
  };
});

//# sourceMappingURL=node-directive.js.map
