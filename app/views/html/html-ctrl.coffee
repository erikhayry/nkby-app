'use strict'

angular.module('ngScaffoldApp').controller 'HtmlCtrl', [
	'$scope'
	'$stateParams'
	'DataFactory'
	'UrlFactory'
	($scope, $stateParams, DataFactory, UrlFactory) ->
		$scope.url = UrlFactory.decode $stateParams.path
		$scope.item = 
	        type: 'image'
	        node: 
	        	src: 
	        		www: 'pathToImage.com'
	        years: ['1', '2', '3']
	        people: ['person 1', 'person 2']
	        parent: 'heavyTextExample.html'
		
		$scope.$on 'addItem', (event, data) ->
			$scope.item = data

		DataFactory.getHTML($stateParams.path).then (html) ->
			$scope.html = html.data
]