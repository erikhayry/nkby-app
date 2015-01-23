'use strict'

angular.module('ngScaffoldApp').directive 'node', ->
    restrict: 'E'
    replace: true
    scope:
      nodes: '='

    templateUrl: '/modules/node/node-tmplt.html'
    link: (scope, element, attrs) ->
      #console.log scope

angular.module('ngScaffoldApp').directive 'nodeChild', ($compile, $rootScope) ->
    restrict: 'E'
    replace: true
    scope:
      child: '='

    controller: 'NodeCtrl'
    templateUrl: '/modules/node/node-child-tmplt.html'
    link: (scope, element, attrs) ->
      scope.toggle = () ->
          console.log element.parent()

          ulEl = element.find('ul')

          if ulEl.length > 0
            ulEl.toggleClass('hidden') 

          else
            scope.children = {
              data : scope.child.children
            }
              
            $compile('<node nodes="children"></node>') scope, (cloned, scope) ->
              element.append cloned
          return            

      scope.open = (node) ->
        $rootScope.$broadcast 'html-open', node
        scope.html = 'some data'