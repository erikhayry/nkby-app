'use strict';

/**
@ngdoc overview
@name ngScaffoldApp
@description
 * ngScaffoldApp

Main module of the application.
 */
angular.module('ngScaffoldApp', ['ngAnimate', 'ngAria', 'ngCookies', 'ngMessages', 'ngResource', 'ngRoute', 'ngSanitize', 'ngTouch', 'ui.router', 'uiGmapgoogle-maps']).config(function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/tree/sidor');
  $stateProvider.state('tree', {
    url: '/tree/:path',
    controller: 'TreeCtrl',
    templateUrl: 'views/tree/tree-view.html'
  });
  $stateProvider.state('html', {
    url: '/html/:path',
    controller: 'HtmlCtrl',
    templateUrl: 'views/html/html-view.html'
  });
}).config(function(uiGmapGoogleMapApiProvider) {
  uiGmapGoogleMapApiProvider.configure({
    key: 'AIzaSyB1t3KIHZN93NqVZjvLaXW3X8buZuuxCbc',
    v: "3.17",
    libraries: "weather,geometry,visualization"
  });
});

//# sourceMappingURL=app.js.map
