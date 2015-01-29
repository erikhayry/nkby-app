'use strict'
angular.module('ngScaffoldApp').directive 'map', ($log, $q, DB, MapService, UrlFactory) ->
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
    
            # helper functions
            _getItem = () ->
                DB.getById 'items', '54c9fe94628f8b07936ece97'
                .then (item) -> 
                    console.log item


            _updateMap = () ->
                DB.get 'map'
                .then (markers) ->
                    scope.newPlace = ''
                    scope.markers = markers.data      
                    scope.$emit('alert', {
                            type: 'success'
                            message: 'Map Updated'
                        })
               
            _getPlaceItems = (marker, eventName, args) ->  
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

            _setNewMarker = (map, eventName, args) ->                         
                scope.$apply () ->
                    scope.newPlace =
                        coords: 
                            latitude: args[0].latLng.k 
                            longitude: args[0].latLng.C

                    scope.activeMarker = ''   


            # setup for map
            scope.marker =
                events: 
                    click: _getPlaceItems

            scope.map =
                center:
                    latitude: 63.522180 
                    longitude: 22.530485
                zoom: 14
                options:
                    scrollwheel: false
                events: 
                    click: _setNewMarker


            # scope functions
            scope.addNew = (item, newPlace) ->
                MapService.addItem item, scope.selectedPeople, scope.selectedYears
                .then (newItem) ->
                    arr = [
                        DB.updateNode(UrlFactory.decode('/apple-touch-icon.png'), 'itemId': newItem.data[0]._id),                        
                        DB.post('map', 
                                {
                                    name: newPlace.name, 
                                    latitude: newPlace.coords.latitude 
                                    longitude: newPlace.coords.longitude
                                    newItems: [
                                       newItem.data[0]._id 
                                    ]
                                })
                    ]

                    $q.all arr
                .then () ->
                    _updateMap()
                ,(e) ->
                    _updateMap()                 

            scope.updatePlace = (item, activeMarkerId) ->
                MapService.addItem item, scope.selectedPeople, scope.selectedYears
                .then (item) ->
                    DB.put 'map', activeMarkerId,
                            { 
                                $addToSet: {items: item.data[0]._id}
                            } 
                .then (place) ->
                    _updateMap() 

            scope.cancel = () ->
                scope.$emit('addItem', '')

            # init
            _updateMap()
            _getItem()

angular.module('ngScaffoldApp').directive 'mapItem', ($log, $q, DB) ->
        restrict: 'E'
        replace: true
        transclude: true
        templateUrl: '/modules/map/map-item-tmplt.html'

angular.module('ngScaffoldApp').directive 'mapItems', ($log, $q, DB) ->
        restrict: 'E'
        replace: true
        transclude: true
        templateUrl: '/modules/map/map-items-tmplt.html'        

angular.module('ngScaffoldApp').directive 'mapPlace', ($log, $q, DB) ->
        restrict: 'E'
        replace: true
        transclude: true
        templateUrl: '/modules/map/map-place-tmplt.html'