angular.module('ngScaffoldApp').factory 'MapService', [
	'DB'
	(DB) ->
		_addItem = (item, people, years) ->
		    selectedPeople = []
		    for person of people
		      selectedPeople.push person if people[person]

		    selectedYears = []
		    for year of years
		      selectedYears.push year if years[year]

		    itemSrc = item.node.src.www if item.node

		    DB.post 'items', 
		            {
		                parent: item.parent
		                url: item.url
		                name: item.name
		                src: itemSrc 
		                type: item.type
		                people: selectedPeople
		                years: selectedYears

		            } 	
		
		addItem: _addItem
]