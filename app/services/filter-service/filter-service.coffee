angular.module('ngScaffoldApp').factory 'FilterFactory', ['$q', 'DB'
	($q, DB) ->	

		_compare = (node, trashItem, status) ->
			node.status = status if node.path is trashItem.path

		_check = (node, trashData, status) ->
			_mark node.children, trashData, status if node.children
			_compare node, trashItem, status for trashItem in trashData

		_mark = (treeData, trashData, status) ->
			_check node, trashData, status for node in treeData
			return treeData			

		_tree = (treeData) ->
			$q (resolve, reject) ->
				DB.get('trash').then (trashData) ->
					console.log _mark(treeData.data, trashData.data, 'trash')
					resolve(treeData)

		    	    				
		tree: _tree
]