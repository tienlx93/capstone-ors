/**
 * Created by Thành on 02/07/2015.
 */

controllers.controller('RegisterController', ['$scope', '$location', 'Api', 'toastr',
    function ($scope, $location, Api, toastr ) {
        /*$scope.user = {
            birthday: new Date(1980, 11, 31)
        };*/

        $scope.register = function (form) {

            if (form.$valid) {


                Api.register($scope.user, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                     //   $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data == "Error Date") {
                        toastr.error('Ngày sinh không hợp lệ');
                    } else if (data) {
                        $location.path("#/home").replace();
                        toastr.success('Tạo tài khoản thành công');
                    }
                });
            }
        }
    }]);