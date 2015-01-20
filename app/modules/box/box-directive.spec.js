'use strict';

describe('Directive: box', function() {

    // load the directive's module
    beforeEach(module('ngScaffoldApp'));
    beforeEach(module('tmplt'));

    var element,
        scope;

    beforeEach(inject(function($rootScope, $compile, $templateCache) {
        element = angular.element('<box></box>');
        scope = $rootScope;
        $compile(element)(scope);
        scope.$digest();
    }));

    it('should make hidden element visible', inject(function() {
        expect(scope.title).toBe('BoxCtrl');
        expect(scope.text).toBe('this is the box directives');
    }));
});