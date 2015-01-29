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
      openfolders: '=',
      openitem: '=',
      toggledone: '='
    },
    templateUrl: '/modules/node/node-tmplt.html'
  };
});

angular.module('ngScaffoldApp').directive('nodeChild', function($compile, $rootScope, UrlFactory, DB, Utils) {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      child: '=',
      addtotrash: '=',
      openfile: '=',
      closefile: '=',
      openfolders: '=',
      openitem: '=',
      toggledone: '='
    },
    templateUrl: '/modules/node/node-child-tmplt.html',
    link: function(scope, element, attrs) {
      var insertNode, toggleFolder;
      insertNode = function() {
        return DB.getTree(UrlFactory.decode(scope.child._id)).then(function(tree) {
          scope.children = tree;
          return $compile('<node nodes="children" addtotrash="addtotrash" openfile="openfile" closefile="closefile" openfolders="openfolders" openitem="openitem" toggledone="toggledone" > </node>')(scope, function(cloned, scope) {
            return element.append(cloned);
          });
        });
      };
      scope.decode = UrlFactory.decode;
      scope.isFolder = Utils.isFolder;
      toggleFolder = scope.toggleFolder = function() {
        var ulEl;
        ulEl = element.find('ul');
        if (ulEl.length > 0) {
          if (ulEl.hasClass("hidden") && !Utils.arrHas(scope.openfolders, scope.child._id)) {
            Utils.addToArr(scope.openfolders, scope.child._id);
          } else {
            Utils.removeFromArr(scope.openfolders, scope.child._id);
          }
          ulEl.toggleClass('hidden');
        } else {
          if (!Utils.arrHas(scope.openfolders, scope.child._id)) {
            Utils.addToArr(scope.openfolders, scope.child._id);
          }
          insertNode();
        }
      };
      if (Utils.arrHas(scope.openfolders, scope.child._id)) {
        toggleFolder();
      }
    }
  };
});

//# sourceMappingURL=node-directive.js.map
