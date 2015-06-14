/**
 * Created by Thành on 14/06/2015.
 */


controllers.controller('LoginController', ['$scope', '$location', 'ApiController',
    function ($scope, $location, ApiController) {
        $scope.login = function(form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;

                ApiController.login(username,password,function(data){
                    if (data=="Success") {
                        $location.path("#/officeList").replace();
                    } else if (data=="Error") {
                        $scope.error="Có lỗi xảy ra. Xin thử lại";
                    } else if (data=="Wrong") {
                        $scope.error="Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại";
                    }
                });
            }

        }
    }]);
