'use strict';

/**
 * @ngdoc directive
 * @name ngScaffoldApp.directive:box
 * @description
 * # box
 */
angular.module('ngScaffoldApp')
  .directive('box', function () {
    return {
      restrict: 'E',
      replace: true,
      link: function postLink(scope, element, attrs) {
        scope.text = 'this is the box directives';
      },
      controller: 'BoxCtrl',
      templateUrl: '/modules/box/box-tmplt.html'
    };
  });