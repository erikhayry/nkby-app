'use strict';

angular.module('ngScaffoldApp').directive('htmlTool', function() {
    return {
        restrict: 'E',
        replace: true,
        scope: {
            html: '=',
        },
        templateUrl: '/modules/htmlTool/html-tool-tmplt.html',
        link: function(scope, element, attrs) {
            console.log(scope)
        }
    }
})