'use strict';
angular.module('ngScaffoldApp').controller('HtmlCtrl', [
  '$scope', '$stateParams', 'DataFactory', 'UrlFactory', function($scope, $stateParams, DataFactory, UrlFactory) {
    $scope.url = UrlFactory.decode($stateParams.path);
    $scope.$on('addItem', function(event, data) {
      return $scope.item = data;
    });
    return DataFactory.getHTML($stateParams.path).then(function(html) {
      return $scope.html = html.data;
    });
  }
]);

//# sourceMappingURL=html-ctrl.js.map
