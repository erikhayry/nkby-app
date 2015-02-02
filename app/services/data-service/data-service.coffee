angular.module('ngScaffoldApp').factory 'DataFactory', [
	'$http'
	($http) ->

		_buildJSON = (data) ->
			$http.post 'http://localhost:3000/static/json/', data

		_getJSON = (path)->
			$http.get 'http://localhost:3000/static/json/' + path
		
		_getHTML = (path)->
			$http.get 'http://localhost:3000/static/html/' + path			
		
		 
		getJSON: _getJSON
		buildJSON: _buildJSON
		getHTML: _getHTML
]