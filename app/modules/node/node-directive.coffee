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
      openitem: '='
      toggledone: '='

    templateUrl: '/modules/node/node-tmplt.html'

angular.module('ngScaffoldApp').directive 'nodeChild', ($compile, $rootScope, UrlFactory, DB, Utils) ->
    restrict: 'E'
    replace: true
    scope:
      child: '='
      addtotrash: '='
      openfile: '='
      closefile: '='
      openfolders: '='
      openitem: '='
      toggledone: '='

    templateUrl: '/modules/node/node-child-tmplt.html'
    link: (scope, element, attrs) ->


      insertNode = () ->
          DB.getTree(UrlFactory.decode scope.child._id)
            .then (tree) ->
              scope.children = tree
              $compile('<node 
                          nodes="children"
                          addtotrash="addtotrash"
                          openfile="openfile"
                          closefile="closefile" 
                          openfolders="openfolders"
                          openitem="openitem"
                          toggledone="toggledone"
                        >  
                        </node>') scope, (cloned, scope) ->
                                      element.append cloned


      scope.decode = UrlFactory.decode
      scope.isFolder = Utils.isFolder

      toggleFolder = scope.toggleFolder = () ->
          ulEl = element.find('ul')

          if ulEl.length > 0
            if ulEl.hasClass( "hidden" ) and !Utils.arrHas scope.openfolders, scope.child._id
              Utils.addToArr scope.openfolders, scope.child._id
            else
              Utils.removeFromArr scope.openfolders, scope.child._id

            ulEl.toggleClass('hidden') 

          else
            Utils.addToArr scope.openfolders, scope.child._id if !Utils.arrHas scope.openfolders, scope.child._id
            insertNode()

          return

      toggleFolder() if Utils.arrHas scope.openfolders, scope.child._id

      return
    