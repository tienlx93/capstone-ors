/**
 * Created by Thành on 08/07/2015.
 */

controllers.controller('RequestOfficeController', ['$scope', '$location', 'Api', 'toastr',
    function ($scope, $location, Api, toastr) {
        $scope.reOffice = {};
        $scope.login = function (form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                Api.login(username, password, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data == "Wrong") {
                        $scope.error = "Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại";
                    } else if (data) {
                        $scope.isLogin = true;
                        Api.updateAccount();
                    }
                });

            }
        };
        $scope.register = function (form) {

            if (form.$valid) {


                Api.register($scope.user, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home").replace();
                    }
                });
            }
        };
        $scope.requestOffice = function (form) {

            if (form.$valid) {

                Api.requestOffice($scope.reOffice, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home");
                        toastr.success('Đặt yêu cầu thành công');
                    }
                });
            }
        };

        Api.getAmenityList(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else if (data) {
                $scope.amenities = data;
            }
        });

        $scope.reOffice.amenityList = [];

        $scope.add = function() {
            $scope.reOffice.amenityList.push( $scope.amenityInput );
            $scope.amenityInput = "";
        };
        $scope.remove = function ( idx ) {
            $scope.reOffice.amenityList.splice( idx, 1 );
        };

    }]);