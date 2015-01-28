'use strict'
angular.module('ngScaffoldApp').directive 'map', ($log, UrlFactory, uiGmapGoogleMapApi) ->
        restrict: 'E'
        replace: true
        transclude: true
        templateUrl: '/modules/map/map-tmplt.html'
        link: (scope, element, attrs) ->

            scope.coords  = ''
            scope.activeMarkerId = ''

            scope.item = 
                id: '/texter/1808'
                type: 'text'

            scope.map =
                center:
                    latitude: 63.522180 
                    longitude: 22.530485
                zoom: 14
                events: 
                    click: (map, eventName, args) ->                         
                        scope.$apply () ->
                            scope.coords = args[0].latLng
                            scope.activeMarkerId = ''
        
            scope.marker =
                id: 1
                coords:
                    latitude: 63.522180 
                    longitude: 22.530485
                events: 
                    click: (marker, eventName, args) ->                         
                        scope.$apply () ->
                            scope.activeMarkerId = marker.key             

            scope.addNew = (itemId, coords) ->
                #Add to DB as itemId AND add to map db
                console.log 'Adding ' + itemId + ' to ' + coords.toString()

            scope.updatePlace = (itemId, activeMarkerId) ->
                console.log 'Updating ' + activeMarkerId + ' with ' + itemId    