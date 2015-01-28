'use strict'
angular.module('ngScaffoldApp').directive 'htmlTool', (UrlFactory) ->
        restrict: 'E'
        replace: true
        scope:
            html: '='
            url: '='
            item: '='

        templateUrl: '/modules/htmlTool/html-tool-tmplt.html'
        link: (scope, element, attrs) ->
            
            toArr = (obj) ->
                arr = []
                for o of obj
                  arr.push obj[o].text
                _.uniq(arr);

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

            scope.addText = (url) ->
                item =
                    type: 'text'
                    url: url
                    years: toArr scope.html.years
                    people: toArr scope.html.people
                    parent: scope.encode scope.url                    

                scope.$emit('addItem', item)

            scope.addImage = (node) ->
                item =
                    type: 'image'
                    node: node
                    years: toArr scope.html.years
                    people: toArr scope.html.people
                    parent: scope.encode scope.url

                scope.$emit('addItem', item)

                return

            return