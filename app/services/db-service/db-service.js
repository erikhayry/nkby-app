angular.module('ngScaffoldApp').factory('DB', [
  '$http', '$q', 'DataFactory', function($http, $q, DataFactory) {
    var _buildJSON, _delete, _get, _getById, _getPlace, _getTree, _post, _put, _updateNode;
    _buildJSON = function() {
      return $q(function(resolve, reject) {
        return _get('map').then(function(map) {
          var location, _fn, _i, _len, _locationCalls, _ref;
          _locationCalls = [];
          _ref = map.data;
          _fn = function(location) {
            var _itemCalls;
            _itemCalls = location.items.map(function(item) {
              return _getById('items', item);
            });
            return _locationCalls.push($q.all(_itemCalls).then(function(data) {
              return $q(function(resolve, reject) {
                return resolve({
                  location: location,
                  data: data
                });
              });
            }));
          };
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            location = _ref[_i];
            _fn(location);
          }
          return $q.all(_locationCalls).then(function(data) {
            var locations;
            locations = data.map(function(items) {
              items.location.items = items.data.map(function(item) {
                return item.data;
              });
              return items.location;
            });
            return resolve(locations);
          });
        });
      }).then(function(data) {
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
