'use strict'

angular.module('ngScaffoldApp').controller 'AppCtrl', [
	'$scope'
	'$timeout'
	($scope, $timeout) ->
		$scope.$on 'alert', (event, data) ->
			$scope.alert = data
			$timeout (->
			  $scope.alert = {}
			  return
			), 2000
]