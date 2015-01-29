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
                oldItemPeople = scope.item.people
                oldItemYears = scope.item.years
                DB.getById 'items', '54c9fe94628f8b07936ece97'
                .then (item) -> 
                    for year of item.data.years
                      scope.selectedYears[item.data.years[year]] = true
                    for people of item.data.people
                      scope.selectedPeople[item.data.people[people]] = true

                    item.data.years = _.union item.data.years, oldItemYears
                    item.data.people = _.union item.data.people, oldItemPeople
                    scope.item = item.data


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

            scope.addPerson = (person) ->
                scope.selectedPeople[person] = true
                scope.item.people.push person               

            scope.addYear = (year) ->
                scope.selectedYears[year] = true
                scope.item.years.push year 

            scope.updateItem = (item) ->
                MapService.updateItem item, scope.selectedPeople, scope.selectedYears
                .then ->
                    scope.$emit('alert', {
                        type: 'success'
                        message: 'Item Updated'
                    })

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
                                    items: [
                                       newItem.data[0]._id 
                                    ]
                                })
                    ]

                    $q.all arr
                .then () ->
                    _updateMap()  

            scope.removeItemFromPlace = (item, activeMarkerId) ->
                DB.put 'map', activeMarkerId,
                            { 
                                $pull: {items: item._id}
                            } 
                .then () ->
                    _updateMap()                         

            scope.updateItemToNewPlace = (item, newPlace) ->
                MapService.updateItem item, scope.selectedPeople, scope.selectedYears
                .then () ->
                    DB.post('map', 
                            {
                                name: newPlace.name, 
                                latitude: newPlace.coords.latitude 
                                longitude: newPlace.coords.longitude
                                items: [
                                   item._id 
                                ]
                            })
                .then () ->
                    _updateMap()  
                , (e) ->
                    console.log e                 

            scope.updatePlace = (item, activeMarkerId) ->
                MapService.addItem item, scope.selectedPeople, scope.selectedYears
                .then (item) ->
                    DB.put 'map', activeMarkerId,
                            { 
                                $addToSet: {items: item.data[0]._id}
                            } 
                .then () ->
                    _updateMap()

            scope.updateItemToMarker = (item, activeMarkerId) ->
                MapService.updateItem item, scope.selectedPeople, scope.selectedYears
                .then () ->
                    DB.put 'map', activeMarkerId,
                            { 
                                $addToSet: {items: item._id}
                            } 
                .then () ->
                    _updateMap()


            scope.cancel = () ->
                scope.$emit('addItem', '')

            scope.deletePlace = (marker) ->
                DB.delete 'map', marker.id
                .then () ->
                   _updateMap()                    

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