/**
 * Created by Thành on 14/06/2015.
 */


controllers.controller('LoginController', ['$scope', '$location', 'Api','toastr',
    function ($scope, $location, Api, toastr) {
        $scope.login = function (form) {
            console.log('1');
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                console.log('2');

                Api.login(username, password, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "Wrong") {
                        toastr.error('Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại');

                    } else if (data) {
                        Api.account.username = username;
                        Api.account.fullName = data;
                        Api.updateAccount();
                        $location.path("#/home").replace();
                    }


                });
            }

        }
    }]);
