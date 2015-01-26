'use strict'

angular.module('ngScaffoldApp').directive 'node', ->
    restrict: 'E'
    replace: true
    scope:
      nodes: '='
      trash: '='    

    templateUrl: '/modules/node/node-tmplt.html'
    link: (scope, element, attrs) ->
      #console.log scope

angular.module('ngScaffoldApp').directive 'nodeChild', ($compile, $rootScope, UrlFactory, DB) ->
    restrict: 'E'
    replace: true
    scope:
      child: '='
      trash: '='      

    controller: 'NodeCtrl'
    templateUrl: '/modules/node/node-child-tmplt.html'
    link: (scope, element, attrs) ->
      scope.decode = UrlFactory.decode

      scope.isFolder = (node) ->
        return node.base.indexOf('.') < 0

      scope.toggle = () ->
          ulEl = element.find('ul')

          if ulEl.length > 0
            ulEl.toggleClass('hidden') 

          else
            
            DB.getTree(UrlFactory.decode scope.child._id)
            .then (tree) ->
              $scope.children = tree
              $compile('<node nodes="children" trash="trash"></node>') scope, (cloned, scope) ->
                element.append cloned

          return            

      scope.open = (node) ->
        $rootScope.$broadcast 'html-open', node
        scope.html = 'some data'