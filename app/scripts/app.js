'use strict';

/**
@ngdoc overview
@name ngScaffoldApp
@description
 * ngScaffoldApp

Main module of the application.
 */
angular.module('ngScaffoldApp', ['ngAnimate', 'ngAria', 'ngCookies', 'ngMessages', 'ngResource', 'ngRoute', 'ngSanitize', 'ngTouch', 'ui.router']).config(function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/');
  $stateProvider.state('editor', {
    url: '/',
    controller: 'EditorCtrl',
    templateUrl: 'views/editor/editor-view.html'
  });
});

//# sourceMappingURL=app.js.map
