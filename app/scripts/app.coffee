'use strict'

###*
@ngdoc overview
@name ngScaffoldApp
@description
# ngScaffoldApp

Main module of the application.
###
angular.module('ngScaffoldApp', [
  'ngAnimate'
  'ngAria'
  'ngCookies'
  'ngMessages'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
  'ui.router'
]).config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/tree/sidor'
  
  # States
  $stateProvider.state 'tree',
    url: '/tree/:path'
    controller: 'TreeCtrl'
    templateUrl: 'views/tree/tree-view.html'

  $stateProvider.state 'html',
    url: '/html/:path'
    controller: 'HtmlCtrl'
    templateUrl: 'views/html/html-view.html'    

  return