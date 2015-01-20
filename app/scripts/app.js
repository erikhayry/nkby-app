'use strict';

/**
 * @ngdoc overview
 * @name ngScaffoldApp
 * @description
 * # ngScaffoldApp
 *
 * Main module of the application.
 */
angular
  .module('ngScaffoldApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.router'
  ])
  .config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise('/');
  
  // States
  $stateProvider
    .state('main', {
      url: '/',
      controller: 'MainCtrl',
      templateUrl: 'views/main/main-view.html'
    })

    .state('about', {
      url: '/about',
      controller: 'AboutCtrl',
      templateUrl: 'views/about/about-view.html'
    });


  });