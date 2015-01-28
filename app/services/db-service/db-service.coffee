angular.module('ngScaffoldApp').factory 'DB', [
	'$http'
	'UrlFactory'
	($http, UrlFactory) ->

		_trash = (path)->
			$http.put 'http://localhost:3000/collections/tree/'+path, 'trashed': true

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
			 
		trash: _trash
		getPlace: _getPlace
		get: _get
		getById: _getById
		post: _post
		put: _put
		getTree: _getTree
]