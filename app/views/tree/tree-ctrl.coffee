'use strict'

angular.module('ngScaffoldApp').controller 'TreeCtrl', [
	'$scope'
	'$sce'
	'$stateParams'
	'DataFactory'
	'DB'
	'FilterFactory'
	'UrlFactory'
	($scope, $sce, $stateParams, DataFactory, DB, FilterFactory, UrlFactory) ->
		$scope.openfolders = []

		getTree = () ->
			DB.getTree(UrlFactory.decode $stateParams.path)
			.then (tree) ->
				$scope.node = tree

		$scope.openfile = (url) ->
			$scope.htmlurl = '#/html/' + $sce.trustAsResourceUrl UrlFactory.decode url

		$scope.closefile = () ->
			$scope.htmlurl = ''   

		$scope.addtotrash = (path) ->
        	DB.trash UrlFactory.decode path
        	.then (json) ->
        		getTree()

        getTree()					
]