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
                controller: 'HomeController'
            }).
            when('/list/:query', {
                templateUrl: 'html/officeList.html',
                controller: 'OfficeListController'
            }).
            when('/detail/:id', {
                templateUrl: 'html/detail.html',
                controller: 'DetailController'
            }).
            when('/request/:id', {
                templateUrl: 'html/request.html',
                controller: 'RequestController'
            }).
            when('/requestRepair/:id', {
                templateUrl: 'html/requestRepair.html',
                controller: 'RequestRepairController'
            }).
            when('/login', {
                templateUrl: 'html/login.html',
                controller: 'LoginController'
            }).
            when('/contractList', {
                templateUrl: 'html/contractList.html',
                controller: 'ContractController'
            }).
            when('/contractList/:id', {
                templateUrl: 'html/contractDetail.html',
                controller: 'ContractDetailController'
            }).
            when('/repairList', {

            }).
            when('/repairList/:id', {
                templateUrl: 'html/repairList.html',
                controller: 'RepairController'
            }).
            when('/rentalList', {

            }).
            when('/rentalList/:id', {
                templateUrl: 'html/rentalList.html',
                controller: 'RentalController'
            }).
            when('/rental', {
                templateUrl: 'html/rental.html',
                controller: ''
            }).
            when('/register', {
                templateUrl: 'html/register.html',
                controller: 'RegisterController'
            }).
            otherwise({
                redirectTo: '/home'
            });
    }]);

app.filter('toLocaleDate', function () {
    return function (input) {
        var date = new Date(input);
        return date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
    };
});

app.filter('m2', ['$sce', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input.replace("m2","m<sup>2</sup>"));
    };
}]);

var BACK_END_URL = "";