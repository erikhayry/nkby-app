angular.module('ngScaffoldApp').factory 'DB', [
	'$http'
	'$q'
	'DataFactory'
	($http, $q, DataFactory) ->

		#_addItemDataToLocation = (items, location)

		_buildJSON = ->
			$q((resolve, reject) ->
				#get all map data form db
				_get 'map'
				.then (map) ->
					_locationCalls = []
					#for each location on map...
					for location in map.data
						do(location) ->
							#... get item data data for each item
							_itemCalls = location.items.map( (item) ->
								_getById 'items', item
							)							
							_locationCalls.push(
								# for each item append data and it's location
								$q.all _itemCalls
								.then (data) ->
									$q (resolve, reject) ->									
										resolve {
											location: location
											data: data
										}
							)

					#for each location...
					$q.all _locationCalls
					.then (data) ->
						#replace items id arr with item data arr
						locations = data.map (items) ->
							items.location.items = items.data.map (item) ->
								item.data

							items.location
						
						resolve locations
			)
			.then (data) ->
				DataFactory.buildJSON data

		_updateNode = (path, val)->
			$http.put 'http://localhost:3000/collections/tree/'+path, val

		_getPlace = (latitude, longitude) ->
			$http.get 'http://localhost:3000/collections/map/'+latitude+'/'+longitude 

		_get = (collection)->
			$http.get 'http://localhost:3000/collections/'+collection		

		_getById = (collection, id)->
			$http.get 'http://localhost:3000/collections/'+collection+'/'+id		

		_post = (collection, data)->
			$http.post 'http://localhost:3000/collections/'+collection, data

		_put = (collection, id, data)->
			$http.put 'http://localhost:3000/collections/'+collection+'/'+id, data

		_getTree = (parent)->
			$http.get 'http://localhost:3000/collections/tree/'+parent		

		_delete = (collection, id)->
			$http.delete 'http://localhost:3000/collections/'+collection+'/'+id					
			 
		buildJSON: _buildJSON			 
		updateNode: _updateNode
		getPlace: _getPlace
		get: _get
		getById: _getById
		post: _post
		put: _put
		getTree: _getTree
		delete: _delete
]