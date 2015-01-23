'use strict'

###*
@ngdoc function
@name ngScaffoldApp.controller:MainCtrl
@description
# MainCtrl
Controller of the ngScaffoldApp
###
angular.module('ngScaffoldApp').controller 'EditorCtrl', [
	'$scope'
	'DataFactory'
	($scope, DataFactory) ->
		DataFactory.getJSON().then (json) ->
			$scope.node = json.data

		$scope.$on 'html-open', (event, args) ->
			$scope.activeNode = args.path

		$scope.$on 'html-closed', (event, args) ->
			$scope.activeNode = ''			

]