angular.module('ngScaffoldApp').factory 'DB', [
	'$http'
	'UrlFactory'
	($http, UrlFactory) ->
		_trash = (path)->
			$http.post 'http://localhost:3000/collections/trash', 'path': path

		_get = (collection)->
			$http.get 'http://localhost:3000/collections/'+collection					
			 
		trash: _trash
		get: _get
]