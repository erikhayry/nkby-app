'use strict';

angular.module('ngScaffoldApp').directive('node', function () {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      nodes: '='
    },
    templateUrl: '/modules/node/node-tmplt.html',
    link: function (scope, element, attrs) {
      //console.log(scope.node)
    }
  }
})

angular.module('ngScaffoldApp').directive('nodeChild', function ($compile) {
  return {
    restrict: 'E',
    replace: true,
    scope: {
      child: '='
    },
    controller: 'NodeCtrl',
    templateUrl: '/modules/node/node-child-tmplt.html',
    link: function (scope, element, attrs) {
      
      scope.toggle = function(node){
        console.log()
        var _ulEl = element.find('ul');

        if(_ulEl.length > 0){
          _ulEl.toggleClass('hidden');
        }
        
        else if (node && angular.isArray(node.children)) {
            $compile('<node nodes="child.children"></node>')(scope, function(cloned, scope) {
                element.append(cloned);
            });
        }
      }

      scope.open = function(node){
        scope.html = 'some data';
      }



    }
  }
})