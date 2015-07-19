/**
 * Created by Thành on 14/06/2015.
 */


controllers.controller('LoginController', ['$scope', '$location', 'Api','toastr', '$modalInstance',
    function ($scope, $location, Api, toastr, $modalInstance) {
        $scope.login = function (form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;

                Api.login(username, password, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "Wrong") {
                        toastr.error('Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại');

                    } else if (data) {
                        Api.account.username = username;
                        Api.account.fullName = data;
                        Api.updateAccount();
                        toastr.success("Đăng nhập thành công");
                        $modalInstance.close();
                        //$location.path("#/home").replace();
                    }


                });
            }
        };
        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        };
    }]);
