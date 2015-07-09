/**
 * Created by Thành on 08/07/2015.
 */

controllers.controller('RequestOfficeController', ['$scope', '$location', 'Api',
    function ($scope, $location, Api) {
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
        }
        $scope.requestOffice = function (form) {

            if (form.$valid) {

                Api.requestOffice($scope.reOffice, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home").replace();
                    }
                });
            }
        }
    }]);