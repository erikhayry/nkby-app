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


		$scope.$watch 'openfolders', (newValue, oldValue) ->
			console.log 'chnaged;'

		getTree = () ->
			DB.getTree(UrlFactory.decode $stateParams.path)
			.then (tree) ->
				$scope.node = tree

		$scope.openfile = () ->
			$scope.htmlurl = $sce.trustAsResourceUrl 'http://bisnode.com'

		$scope.closefile = () ->
			$scope.htmlurl = ''   

		$scope.addtotrash = (path) ->
        	DB.trash UrlFactory.decode path
        	.then (json) ->
        		getTree()

        getTree()					
]