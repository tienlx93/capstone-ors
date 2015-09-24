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
            when('/contractHistory', {
                templateUrl: 'html/contractHistory.html',
                controller: 'ContractController'
            }).
            /*when('/contractHistory/:id', {
                templateUrl: 'html/contractHistoryDetail.html',
                controller: 'ContractDetailController'
            }).*/
            /*when('/repairHistory/:id', {
                templateUrl: 'html/repairHistory.html',
                controller: 'RepairHistoryController'
            }).*/
            when('/repairList/:id', {
                templateUrl: 'html/repairList.html',
                controller: 'RepairController'
            }).
            when('/rentalDetail/:id', {
                templateUrl: 'html/rentalDetail.html',
                controller: 'RentalDetailController'
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
            when('/requestOffice/:query', {
                templateUrl: 'html/requestOffice.html',
                controller: 'RequestOfficeController'
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

app.directive('googleplace', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, model) {
            var options = {
                types: ['geocode'],
                componentRestrictions: {}
            };
            scope.gPlace = new google.maps.places.Autocomplete(element[0], options);

            google.maps.event.addListener(scope.gPlace, 'place_changed', function () {
                scope.$apply(function () {
                    model.$setViewValue(element.val());
                    scope.searchKey = element.val();
                    var place = scope.gPlace.getPlace();
                    scope.searchTerm.latitude = place.geometry.location.lat();
                    scope.searchTerm.longitude = place.geometry.location.lng();
                    for (var i = 0; i < place.address_components.length; ++i) {
                        var component = place.address_components[i];
                        if (component.types.indexOf("administrative_area_level_2")>= 0) {
                            scope.searchTerm.district = component.long_name;
                        }
                    }
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

app.filter('round', ['$sce', function ($sce) {
    return function (input) {
        return Math.round(input / 1000) * 1000;
    };
}]);

app.directive('realTimeCurrency', function ($filter, $locale) {
    var decimalSep = $locale.NUMBER_FORMATS.DECIMAL_SEP;
    var toNumberRegex = new RegExp('[^0-9\\' + decimalSep + ']', 'g');
    var trailingZerosRegex = new RegExp('\\' + decimalSep + '0+$');
    var filterFunc = function (value) {
        return $filter('number')(value);
    };

    function getCaretPosition(input) {
        if (!input) return 0;
        if (input.selectionStart !== undefined) {
            return input.selectionStart;
        } else if (document.selection) {
            // Curse you IE
            input.focus();
            var selection = document.selection.createRange();
            selection.moveStart('character', input.value ? -input.value.length : 0);
            return selection.text.length;
        }
        return 0;
    }

    function setCaretPosition(input, pos) {
        if (!input) return 0;
        if (input.offsetWidth === 0 || input.offsetHeight === 0) {
            return; // Input's hidden
        }
        if (input.setSelectionRange) {
            input.focus();
            input.setSelectionRange(pos, pos);
        }
        else if (input.createTextRange) {
            // Curse you IE
            var range = input.createTextRange();
            range.collapse(true);
            range.moveEnd('character', pos);
            range.moveStart('character', pos);
            range.select();
        }
    }

    function toNumber(currencyStr) {
        return parseFloat(currencyStr.replace(toNumberRegex, ''), 10);
    }

    return {
        restrict: 'A',
        require: 'ngModel',
        link: function postLink(scope, elem, attrs, modelCtrl) {
            modelCtrl.$formatters.push(filterFunc);
            modelCtrl.$parsers.push(function (newViewValue) {
                var oldModelValue = modelCtrl.$modelValue;
                var newModelValue = toNumber(newViewValue);
                modelCtrl.$viewValue = filterFunc(newModelValue);
                var pos = getCaretPosition(elem[0]);
                elem.val(modelCtrl.$viewValue);
                var newPos = pos + modelCtrl.$viewValue.length -
                    newViewValue.length;
                setCaretPosition(elem[0], newPos);
                return newModelValue;
            });
        }
    };
});


var BACK_END_URL = "";