'use strict';
angular.module('ngScaffoldApp').controller('HtmlCtrl', [
  '$scope', '$stateParams', 'DataFactory', 'UrlFactory', function($scope, $stateParams, DataFactory, UrlFactory) {
    $scope.url = UrlFactory.decode($stateParams.path);
    $scope.item = {
      type: 'image',
      node: {
        src: {
          www: 'pathToImage.com'
        }
      },
      years: ['1', '2', '3'],
      people: ['person 1', 'person 2'],
      parent: 'heavyTextExample.html'
    };
    $scope.$on('addItem', function(event, data) {
      return $scope.item = data;
    });
    return DataFactory.getHTML($stateParams.path).then(function(html) {
      return $scope.html = html.data;
    });
  }
]);

//# sourceMappingURL=html-ctrl.js.map
