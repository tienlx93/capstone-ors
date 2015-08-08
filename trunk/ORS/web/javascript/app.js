/**
 * Created by ASUS on 6/7/2015.
 */
var app = angular.module('ors', [
    'ngRoute', 'ngAnimate', 'ui.bootstrap', 'toastr',
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
            when('/contractReturn', {
                templateUrl: 'html/contractReturn.html',
                controller: 'ContractReturnController'
            }).
            when('/contractExtend', {
                templateUrl: 'html/contractExtend.html',
                controller: 'ContractExtendController'
            }).
            when('/contractList', {
                templateUrl: 'html/contractList.html',
                controller: 'ContractController'
            }).
            when('/contractList/:id', {
                templateUrl: 'html/contractDetail.html',
                controller: 'ContractDetailController'
            }).
            when('/repairHistory/:id', {
                templateUrl: 'html/repairHistory.html',
                controller: 'RepairHistoryController'
            }).
            when('/repairList/:id', {
                templateUrl: 'html/repairList.html',
                controller: 'RepairController'
            }).
            when('/rentalList/:id', {
                templateUrl: 'html/rentalList.html',
                controller: 'RentalController'
            }).
            when('/rental/:id', {
                templateUrl: 'html/rental.html',
                controller: 'OfficeRentalController'
            }).
            when('/rentalCart/:id', {
                templateUrl: 'html/rentalCart.html',
                controller: 'OfficeRentalCartController'
            }).
            when('/register', {
                templateUrl: 'html/register.html',
                controller: 'RegisterController'
            }).
            when('/requestOffice', {
                templateUrl: 'html/requestOffice.html',
                controller: 'RequestOfficeController'
            }).
            when('/profile', {
                templateUrl: 'html/profile.html',
                controller: 'ProfileController'
            }).
            when('/profileDetail', {
                templateUrl: 'html/profileDetail.html',
                controller: 'ProfileDetailController'
            }).
            when('/profilePass', {
                templateUrl: 'html/profilePass.html',
                controller: 'ChangePassController'
            }).
            when('/resultRequestOffice', {
                templateUrl: 'html/resultRequestOffice.html',
                controller: 'resultRequestOfficeController'
            }).

            otherwise({
                redirectTo: '/home'
            });
    }]);

app.directive('googleplace', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attrs, model) {
            var options = {
                types: ['geocode'],
                componentRestrictions: {}
            };
            scope.gPlace = new google.maps.places.Autocomplete(element[0], options);

            google.maps.event.addListener(scope.gPlace, 'place_changed', function() {
                scope.$apply(function() {
                    model.$setViewValue(element.val());
                    var place = scope.gPlace.getPlace();
                    scope.searchTerm.latitude = place.geometry.location.lat();
                    scope.searchTerm.longitude = place.geometry.location.lng();
                });
            });
        }
    };
});

app.filter('toLocaleDate', function () {
    return function (input) {
        var date = new Date(input);
        return date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
    };
});

app.filter('m2', ['$sce', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input.replace("m2", "m<sup>2</sup>"));
    };
}]);


var BACK_END_URL = "";