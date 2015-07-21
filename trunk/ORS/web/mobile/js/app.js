/**
 * Created by ASUS on 6/11/2015.
 */
var app = angular.module("orsMobile", [
    'ngRoute', 'ngAnimate',
    'controllers', 'filters'
]);
var DEVICE_HEIGHT = $(window).height();
var controllers = angular.module('controllers', []);

app.factory("timeoutService", function ($q, $timeout) {
    return {
        timeout: function () {
            var deferred = $q.defer();
            $timeout(function () {
                deferred.resolve("done");
            }, 250);
            return deferred.promise;
        }
    }
});

app.config(['$routeProvider', '$httpProvider', '$compileProvider',
    function ($routeProvider, $httpProvider, $compileProvider) {
        $httpProvider.defaults.withCredentials = true;
        $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|geo):/);

        $routeProvider.
            when('/login', {
                templateUrl: 'html/login.html',
                controller: 'LoginController'
            }).
            when('/home', {
                templateUrl: 'html/home.html',
                controller: 'HomeController',
                resolve: {
                    timeout: function (timeoutService) {
                        return timeoutService.timeout();
                    }
                }
            }).
            when('/home/:function', {
                templateUrl: 'html/list.html',
                controller: 'ListController',
                resolve: {
                    timeout: function (timeoutService) {
                        return timeoutService.timeout();
                    }
                }
            }).
            when('/home/:function/:id', {
                templateUrl: 'html/detail.html',
                controller: 'DetailController',
                resolve: {
                    timeout: function (timeoutService) {
                        return timeoutService.timeout();
                    }
                }
            }).
            otherwise({
                redirectTo: '/home'
            });
    }]);

angular.module('filters', []).filter('encode', function () {
    return function (input) {
        encodeURI(input);
    };
}).filter('toLocaleDate', function () {
    return function (input) {
        var date = new Date(input);
        return date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
    };
});

var BACK_END_URL = "";
var APPOINTMENT_STATUS = [{}, {
    'id': 2,
    'name': 'Assigned',
    'description': 'Lịch hẹn của tôi'
}, {
    'id': 3,
    'name': 'Accepted',
    'description': 'Khách hàng chấp nhận'
}, {}, {
    'id': 5,
    'name': 'Rejected',
    'description': 'Hủy'
}];
var REPAIR_STATUS = [{}, {
    'id': 2,
    'name': 'Assigned',
    'description': 'Cần xác nhận'
}, {}, {
    'id': 3,
    'name': 'Done',
    'description': 'Hoàn thành'
}, {
    'id': 4,
    'name': 'Canceled',
    'description': 'Hủy'
}, {
    'id': 5,
    'name': 'WaitingConfirm',
    'description': 'Việc của tôi'
}];
var url = "";
controllers.controller('MainController', ['$scope', '$location', '$rootScope',
    function ($scope, $location, $rootScope) {
        $scope.back = function () {
            if ($location.path().lastIndexOf("home/") < 0) {
                $location.replace();
            } else {
                window.history.back();
            }
        };
        window.onhashchange = function () {
            var newUrl = $location.path();
            if (newUrl.length < url.length) {
                $scope.$apply(function () {
                    $rootScope.slide = 'slide-right';
                });
            }
            url = newUrl;
        };
        $scope.direction = function () {
            $rootScope.slide = 'slide-left';
        };
    }]);