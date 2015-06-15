/**
 * Created by ASUS on 6/7/2015.
 */
var app = angular.module('ors', [
    'ngRoute', 'ngAnimate', 'ui.bootstrap',
    'controllers'
]);
var controllers = angular.module('controllers', []);

app.config(['$routeProvider', '$httpProvider',
    function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.withCredentials = true;

        $routeProvider.
            when('/home', {
                templateUrl: 'html/home.html',
                controller: ''
            }).
            when('/list', {
                templateUrl: 'html/officeList.html',
                controller: ''
            }).
            when('/detail', {
                templateUrl: 'html/detail.html',
                controller: 'DetailController'
            }).
            when('/request', {
                templateUrl: 'html/request.html',
                controller: 'RequestController'
            }).
            when('/requestRepair', {
                templateUrl: 'html/requestRepair.html',
                controller: 'RequestRepairController'
            }).
            when('/login', {
                templateUrl: 'html/login.html',
                controller: 'LoginController'
            }).
            otherwise({
                redirectTo: '/home'
            });
    }]);

var BACK_END_URL = "";