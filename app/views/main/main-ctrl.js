'use strict';

/**
 * @ngdoc function
 * @name ngScaffoldApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the ngScaffoldApp
 */
angular.module('ngScaffoldApp')
  .controller('MainCtrl', ["$scope", "DataFactory",
    function($scope, DataFactory) {
    	DataFactory.getJSON().then(function(json){
    		$scope.node = json.data
    	})
   		
    }
]);