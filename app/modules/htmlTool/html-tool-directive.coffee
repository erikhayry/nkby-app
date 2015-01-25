'use strict'
angular.module('ngScaffoldApp').directive 'htmlTool', (UrlFactory) ->
        restrict: 'E'
        replace: true
        scope:
            html: '='
            url: '='

        templateUrl: '/modules/htmlTool/html-tool-tmplt.html'
        link: (scope, element, attrs) ->
            scope.goTo = (index) ->
            	$ 'body'
            	.scrollTo '.person-'+index


            scope.encode = UrlFactory.encode
