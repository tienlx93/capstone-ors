/**
 * Created by ASUS on 6/11/2015.
 */
var app = angular.module("orsMobile", [
    'ngRoute', 'ngAnimate',
    'controllers'
]);

var controllers = angular.module('controllers', []);

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
                controller: 'HomeController'
            }).
            when('/home/:function', {
                templateUrl: 'html/list.html',
                controller: 'ListController'
            }).
            when('/home/:function/:id', {
                templateUrl: 'html/detail.html',
                controller: 'DetailController'
            }).
            otherwise({
                redirectTo: '/login'
            });
    }]);

var BACK_END_URL = "";
var APPOINTMENT_STATUS = [{
    'id': 1,
    'name': 'Pending',
    'description': 'Chờ xử lí'
}, {
    'id': 2,
    'name': 'Assigned',
    'description': 'Đã được giao'
}, {
    'id': 3,
    'name': 'Accepted',
    'description': 'Chấp nhận'
}, {
    'id': 4,
    'name': 'Done',
    'description': 'Hoàn thành'
}, {
    'id': 5,
    'name': 'Rejected',
    'description': 'Hủy'
}];
var REPAIR_STATUS = [{
    'id': 1,
    'name': 'Requested',
    'description': 'Chờ xử lí'
}, {
    'id': 2,
    'name': 'Assigned',
    'description': 'Đã được giao'
}, {
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
    'description': 'Chờ khách hàng xác nhận'
}];

controllers.controller('MainController', ['$scope', '$location',
    function ($scope, $location) {
        $scope.back = function () {
            if ($location.path().lastIndexOf("home/") < 0) {
                $location.replace();
            } else {
                window.history.back();
            }
        }
    }]);