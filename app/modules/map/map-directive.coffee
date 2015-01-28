'use strict'
angular.module('ngScaffoldApp').directive 'map', ($log, DB) ->
        restrict: 'E'
        replace: true
        transclude: true
        templateUrl: '/modules/map/map-tmplt.html'
        link: (scope, element, attrs) ->
            scope.activeMarker = ''
            scope.newPlace = {}
            scope.selectedPeople = {}
            scope.selectedYears = {}
            scope.markers = []
            scope.map =
                center:
                    latitude: 63.522180 
                    longitude: 22.530485
                zoom: 14
                options:
                    scrollwheel: false
                events: 
                    click: (map, eventName, args) ->                         
                        scope.$apply () ->
                            scope.newPlace.coords = 
                                latitude: args[0].latLng.k 
                                longitude: args[0].latLng.C

                            scope.activeMarker = {}
        
            scope.marker =
                events: 
                    click: (marker, eventName, args) ->  
                        place = _.find(scope.markers, {'_id': marker.key})
                        scope.$apply () ->
                            scope.activeMarker = 
                                id: marker.key   
                                name: place.name
                                coords: place.longitude + ',' + place.latitude

                            scope.newPlace = {}

            DB.get 'map' 
            .then (markers) ->
                scope.markers = markers.data

            scope.addNew = (item, newPlace) ->
                selectedPeople = []
                for person of scope.selectedPeople
                  selectedPeople.push person if scope.selectedPeople[person]

                selectedYears = []
                for year of scope.selectedYears
                  selectedYears.push year if scope.selectedYears[year]

                DB.post 'items', 
                        {
                            parent: item.parent, 
                            src: item.url, 
                            type: item.type
                            people: selectedPeople
                            years: selectedYears

                        }
                .then (item) ->
                    DB.post 'map', 
                            {
                                name: newPlace.name, 
                                latitude: newPlace.coords.latitude 
                                longitude: newPlace.coords.longitude
                                items: [
                                   item.data[0]._id 
                                ]
                            }
                .then (place) ->
                    DB.get 'map'
                .then (markers) ->
                    scope.markers = markers.data                    

            scope.updatePlace = (itemId, activeMarker) ->
                console.log 'Updating ' + activeMarker + ' with ' + itemId    