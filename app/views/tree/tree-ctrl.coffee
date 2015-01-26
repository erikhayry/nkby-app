'use strict'

angular.module('ngScaffoldApp').controller 'TreeCtrl', [
	'$scope'
	'$stateParams'
	'DataFactory'
	'DB'
	'FilterFactory'
	($scope, $stateParams, DataFactory, DB, FilterFactory) ->
		
		DB.getTree($stateParams.path)
		.then (tree) ->
			$scope.node = tree

		$scope.trash = (path) ->
        	DB.trash path
        	.then (json) ->
        		console.log json

        return					
]