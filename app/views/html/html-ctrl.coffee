'use strict'

angular.module('ngScaffoldApp').controller 'HtmlCtrl', [
	'$scope'
	'$stateParams'
	'DataFactory'
	'UrlFactory'
	($scope, $stateParams, DataFactory, UrlFactory) ->
		$scope.url = UrlFactory.decode $stateParams.path
		
		DataFactory.getHTML($stateParams.path).then (html) ->
			$scope.html = html.data
]