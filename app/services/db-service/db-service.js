angular.module('ngScaffoldApp').factory('DB', [
  '$http', '$q', 'DataFactory', function($http, $q, DataFactory) {
    var _addItemData, _buildJSON, _delete, _get, _getById, _getItemCalls, _getJSONData, _getLocationCalls, _getPlace, _getTree, _makeItemCall, _post, _put, _updateNode;
    _addItemData = function(data) {
      return data.map(function(items) {
        items.location.items = items.data.map(function(item) {
          return item.data;
        });
        return items.location;
      });
    };
    _getItemCalls = function(locationItems) {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = locationItems.length; _i < _len; _i++) {
        item = locationItems[_i];
        _results.push(_getById('items', item));
      }
      return _results;
    };
    _makeItemCall = function(location) {
      return $q.all(_getItemCalls(location.items)).then(function(data) {
        return $q(function(resolve, reject) {
          return resolve({
            location: location,
            data: data
          });
        });
      });
    };
    _getLocationCalls = function(mapData) {
      var location, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = mapData.length; _i < _len; _i++) {
        location = mapData[_i];
        _results.push(_makeItemCall(location));
      }
      return _results;
    };
    _getJSONData = function() {
      return $q(function(resolve, reject) {
        return _get('map').then(function(map) {
          return $q.all(_getLocationCalls(map.data)).then(function(data) {
            return resolve(_addItemData(data));
          });
        });
      });
    };
    _buildJSON = function() {
      return _getJSONData().then(function(data) {
        return DataFactory.buildJSON(data);
      });
    };
    _updateNode = function(path, val) {
      return $http.put('http://localhost:3000/collections/tree/' + path, val);
    };
    _getPlace = function(latitude, longitude) {
      return $http.get('http://localhost:3000/collections/map/' + latitude + '/' + longitude);
    };
    _get = function(collection) {
      return $http.get('http://localhost:3000/collections/' + collection);
    };
    _getById = function(collection, id) {
      return $http.get('http://localhost:3000/collections/' + collection + '/' + id);
    };
    _post = function(collection, data) {
      return $http.post('http://localhost:3000/collections/' + collection, data);
    };
    _put = function(collection, id, data) {
      return $http.put('http://localhost:3000/collections/' + collection + '/' + id, data);
    };
    _getTree = function(parent) {
      return $http.get('http://localhost:3000/collections/tree/' + parent);
    };
    _delete = function(collection, id) {
      return $http["delete"]('http://localhost:3000/collections/' + collection + '/' + id);
    };
    return {
      buildJSON: _buildJSON,
      updateNode: _updateNode,
      getPlace: _getPlace,
      get: _get,
      getById: _getById,
      post: _post,
      put: _put,
      getTree: _getTree,
      "delete": _delete
    };
  }
]);

//# sourceMappingURL=db-service.js.map
