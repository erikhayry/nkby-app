'use strict'
angular.module('ngScaffoldApp').directive 'map', ($log, $q, DB) ->
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
                            scope.newPlace =
                                coords: 
                                    latitude: args[0].latLng.k 
                                    longitude: args[0].latLng.C

                            scope.activeMarker = ''
        
            scope.marker =
                events: 
                    click: (marker, eventName, args) ->  
                        place = _.find(scope.markers, {'_id': marker.key})

                        items = []
                        for item of place.items
                          items.push DB.getById 'items', place.items[item]

                        $q.all items
                        .then (data) ->
                            scope.activeMarker.items = data

                        scope.$apply () ->
                            scope.activeMarker = 
                                id: marker.key   
                                name: place.name
                                coords: place.longitude + ',' + place.latitude

                            scope.newPlace = ''

            addNewItem = (item, people, years) ->
                selectedPeople = []
                for person of people
                  selectedPeople.push person if people[person]

                selectedYears = []
                for year of years
                  selectedYears.push year if years[year]

                itemSrc = item.node.src.www if item.node

                DB.post 'items', 
                        {
                            parent: item.parent
                            url: item.url
                            name: item.name
                            src: itemSrc 
                            type: item.type
                            people: selectedPeople
                            years: selectedYears

                        } 

            updateMap = () ->
                DB.get 'map'
                .then (markers) ->
                    console.log markers
                    scope.newPlace = ''
                    scope.markers = markers.data      
                    scope.$emit('alert', {
                            type: 'success'
                            message: 'Map Updated'
                        })
                                     

            scope.addNew = (item, newPlace) ->
                addNewItem item, scope.selectedPeople, scope.selectedYears
                .then (item) ->
                    console.log 'item added'
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
                    console.log place
                    updateMap()                   

            scope.updatePlace = (item, activeMarkerId) ->
                addNewItem item, scope.selectedPeople, scope.selectedYears
                .then (item) ->
                    DB.put 'map', activeMarkerId,
                            { 
                                $addToSet: {items: item.data[0]._id}
                            } 
                .then (place) ->
                    updateMap() 

            scope.cancel = () ->
                scope.$emit('addItem', '')

            updateMap()







