'use strict'

angular.module('ngScaffoldApp').controller 'TreeCtrl', [
	'$scope'
	'$sce'
	'$stateParams'
	'DB'
	'UrlFactory'
	($scope, $sce, $stateParams, DB, UrlFactory) ->
		$scope.openfolders = []

		_getTree = () ->
			DB.getTree(UrlFactory.decode $stateParams.path)
			.then (tree) ->
				$scope.node = tree


		$scope.buildJSON = ->
			DB.buildJSON()
			.then (data) ->
				$scope.$emit('alert', {
					type: 'success'
					message: 'JSON created at ' + data.data
				})				

		$scope.openitem = (id) ->
			DB.getById 'items', id
			.then (item) -> 
				console.log item		

		$scope.openfile = (url) ->
			$scope.htmlurl = '#/html/' + $sce.trustAsResourceUrl UrlFactory.decode url

		$scope.closefile = () ->
			$scope.htmlurl = ''   

		$scope.toggledone = (path, bool) ->
        	DB.updateNode UrlFactory.decode(path), 'done': bool 
        	.then (json) ->
        		_getTree()
        	,(e) ->
        		_getTree()

		$scope.addtotrash = (path) ->
        	DB.updateNode UrlFactory.decode(path), 'trashed': true 
        	.then (json) ->
        		_getTree()
        	,(e) ->
        		_getTree()

        _getTree()					
]