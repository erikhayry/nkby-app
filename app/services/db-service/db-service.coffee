angular.module('ngScaffoldApp').factory 'DB', [
	'$http'
	'$q'
	'DataFactory'
	($http, $q, DataFactory) ->


		_addItemData = (data) ->
			#replace items id arr with item data arr
			data.map (items) ->
				items.location.items = items.data.map (item) ->
					item.data

				items.location			

		_getItemCalls = (locationItems) ->
			#... get item data data for each item		
			_getById('items', item) for item in locationItems	

		_makeItemCall = (location) ->
			$q.all _getItemCalls(location.items)
			.then (data) ->
				$q (resolve, reject) ->									
					resolve {
						location: location
						data: data
					}			

		_getLocationCalls = (mapData) ->
			#for each location on map...
			_makeItemCall location for location in mapData

		_getJSONData = ->
			$q((resolve, reject) ->
				#get all map data form db
				_get 'map'
				.then (map) ->
					#for each location...
					$q.all(_getLocationCalls(map.data))
					.then (data) ->
						resolve _addItemData data
			)			

		_buildJSON = ->
			_getJSONData()
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