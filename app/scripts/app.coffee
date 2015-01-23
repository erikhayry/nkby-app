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
  $urlRouterProvider.otherwise '/'
  
  # States
  $stateProvider.state 'editor',
    url: '/'
    controller: 'EditorCtrl'
    templateUrl: 'views/editor/editor-view.html'

  return