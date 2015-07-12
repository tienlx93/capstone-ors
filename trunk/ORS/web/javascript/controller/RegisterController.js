/**
 * Created by Thành on 02/07/2015.
 */

controllers.controller('RegisterController', ['$scope', '$location', 'Api', 'toastr',
    function ($scope, $location, Api, toastr ) {
        $scope.register = function (form) {

            if (form.$valid) {


                Api.register($scope.user, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                     //   $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home").replace();
                    }
                });
            }
        }
    }]);