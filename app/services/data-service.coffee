angular.module('ngScaffoldApp').factory 'DataFactory', [
	'$http'
	($http) ->
		_getJSON = ->
			$http.get 'http://localhost:3000/static/json/data-tree-sidor'
		return getJSON: _getJSON
]