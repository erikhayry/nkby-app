'use strict';
angular.module('ngScaffoldApp').directive('node', function() {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      nodes: '=',
      addtotrash: '=',
      openfile: '=',
      closefile: '=',
      openfolders: '='
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
      addtotrash: '=',
      openfile: '=',
      closefile: '=',
      openfolders: '='
    },
    controller: 'NodeCtrl',
    templateUrl: '/modules/node/node-child-tmplt.html',
    link: function(scope, element, attrs) {
      var insertNode, toggleFolder;
      insertNode = function() {
        return DB.getTree(UrlFactory.decode(scope.child._id)).then(function(tree) {
          scope.children = tree;
          return $compile('<node nodes="children" addtotrash="addtotrash" openfile="openfile" closefile="closefile" openfolders="openfolders"></node>')(scope, function(cloned, scope) {
            return element.append(cloned);
          });
        });
      };
      scope.decode = UrlFactory.decode;
      scope.isFolder = function(node) {
        return node.base.indexOf('.') < 0;
      };
      toggleFolder = scope.toggleFolder = function() {
        var ulEl;
        ulEl = element.find('ul');
        if (ulEl.length > 0) {
          if (ulEl.hasClass("hidden") && scope.openfolders.indexOf(scope.child._id) < 0) {
            scope.openfolders.push(scope.child._id);
          } else {
            scope.openfolders.splice(scope.openfolders.indexOf(scope.child._id), 1);
          }
          ulEl.toggleClass('hidden');
        } else {
          if (scope.openfolders.indexOf(scope.child._id) < 0) {
            scope.openfolders.push(scope.child._id);
          }
          insertNode();
        }
      };
      if (scope.openfolders.indexOf(scope.child._id) > -1) {
        toggleFolder();
      }
    }
  };
});

//# sourceMappingURL=node-directive.js.map
