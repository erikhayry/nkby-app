'use strict'

###*
@ngdoc function
@name ngScaffoldApp.controller:MainCtrl
@description
# MainCtrl
Controller of the ngScaffoldApp
###
angular.module('ngScaffoldApp').controller 'TreeCtrl', [
	'$scope'
	'$stateParams'
	'DataFactory'
	'UrlFactory'
	($scope, $stateParams, DataFactory, UrlFactory) ->
		DataFactory.getJSON($stateParams.path).then (json) ->
			$scope.node = json.data
]