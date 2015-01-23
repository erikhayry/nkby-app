angular.module('ngScaffoldApp').factory 'UrlFactory', [
	() ->
		_urlToPath = (urlPath) ->
			urlPath.replace(/-/g, '/')

		_toTitle = (urlPath) ->
			urlPath.replace(/-/g, ' ')			
		
		urlToPath: _urlToPath
		toTitle: _toTitle
]