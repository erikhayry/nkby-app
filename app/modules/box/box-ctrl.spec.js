'use strict';

describe('Controller: BoxCtrl', function () {

  // load the controller's module
  beforeEach(module('ngScaffoldApp'));

  var BoxCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    BoxCtrl = $controller('BoxCtrl', {
      $scope: scope
    });
  }));

  it('should attach a title to the scope', function () {
    expect(scope.title).toBe('BoxCtrl');
  });
});
