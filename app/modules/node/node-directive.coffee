'use strict'

angular.module('ngScaffoldApp').directive 'node', ->
    restrict: 'E'
    replace: true
    scope:
      nodes: '='
      addtotrash: '='
      openfile: '='
      closefile: '='
      openfolders: '='

    templateUrl: '/modules/node/node-tmplt.html'
    link: (scope, element, attrs) ->
      #console.log scope

angular.module('ngScaffoldApp').directive 'nodeChild', ($compile, $rootScope, UrlFactory, DB) ->
    restrict: 'E'
    replace: true
    scope:
      child: '='
      addtotrash: '='
      openfile: '='
      closefile: '='
      openfolders: '='

    controller: 'NodeCtrl'
    templateUrl: '/modules/node/node-child-tmplt.html'
    link: (scope, element, attrs) ->


      insertNode = () ->
          DB.getTree(UrlFactory.decode scope.child._id)
            .then (tree) ->
              scope.children = tree
              $compile('<node nodes="children" addtotrash="addtotrash" openfile="openfile" closefile="closefile" openfolders="openfolders"></node>') scope, (cloned, scope) ->
                element.append cloned


      scope.decode = UrlFactory.decode

      scope.isFolder = (node) ->
        return node.base.indexOf('.') < 0

      toggleFolder = scope.toggleFolder = () ->
          ulEl = element.find('ul')

          if ulEl.length > 0
            if ulEl.hasClass( "hidden" ) and scope.openfolders.indexOf(scope.child._id) < 0
              scope.openfolders.push(scope.child._id) 
            else
              scope.openfolders.splice(scope.openfolders.indexOf(scope.child._id),1)

            ulEl.toggleClass('hidden') 

          else
            scope.openfolders.push(scope.child._id) if scope.openfolders.indexOf(scope.child._id) < 0
            insertNode()

          return

      toggleFolder() if scope.openfolders.indexOf(scope.child._id) > -1

      return
    