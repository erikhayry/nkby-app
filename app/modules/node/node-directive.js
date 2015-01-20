'use strict';

/**
 * @ngdoc directive
 * @name ngScaffoldApp.directive:box
 * @description
 * # box
 */
/*angular.module('ngScaffoldApp')
    .directive('node', function($compile) {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                data: '='
            },
            link: function postLink(scope, element, attrs) {



                if (scope.data) {
                    console.log(scope.data.name)
                    scope.name = scope.data.name;
                }

            },
            controller: 'NodeCtrl',
            templateUrl: '/modules/node/node-tmplt.html'
        };
    });*/

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
        console.log(node)
      }



    }
  }
})