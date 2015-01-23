'use strict'
angular.module('ngScaffoldApp').directive 'htmlTool', ->
        restrict: 'E'
        replace: true
        scope:
            html: '='

        templateUrl: '/modules/htmlTool/html-tool-tmplt.html'
        link: (scope, element, attrs) ->
            console.log scope
