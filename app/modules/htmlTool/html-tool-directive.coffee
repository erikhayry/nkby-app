'use strict'
angular.module('ngScaffoldApp').directive 'htmlTool', (UrlFactory) ->
        restrict: 'E'
        replace: true
        scope:
            html: '='
            url: '='

        templateUrl: '/modules/htmlTool/html-tool-tmplt.html'
        link: (scope, element, attrs) ->

            console.log scope.html

            scope.types = 
                'people': scope.html.people
                'years': scope.html.years
                'streets': scope.html.streets

            scope.goTo = (index, type) ->
                elInCopy = document.querySelectorAll('.' + type + '-'+index)[0]
                elInCopy.scrollIntoView({block: "end", behavior: "smooth"})

                elInCopy.classList.add 'in-view'

                window.setTimeout(() -> 
                    elInCopy.classList.remove('in-view')
                , 2000)

                return

            scope.encode = UrlFactory.encode
