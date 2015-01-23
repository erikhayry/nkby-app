angular.module('ngScaffoldApp').factory 'DataFactory', [
	'$http'
	($http) ->
		_getJSON = (path)->
			$http.get 'http://localhost:3000/static/json/' + path
		
		_getHTML = (path)->
			$http.get 'http://localhost:3000/static/html/' + path			
		
		 
		getJSON: _getJSON
		getHTML: _getHTML
]