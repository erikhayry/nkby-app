'use strict';

/**
 * @ngdoc function
 * @name ngScaffoldApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the ngScaffoldApp
 */
angular.module('ngScaffoldApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
