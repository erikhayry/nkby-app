angular
  .module('ngScaffoldApp').factory('DataFactory', ['$http', function($http){
	function _getJSON(){
		return $http.get('http://localhost:8080/json');
	};

	return {
		getJSON: _getJSON
	}
}])