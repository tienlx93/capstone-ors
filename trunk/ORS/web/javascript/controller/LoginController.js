/**
 * Created by Thành on 14/06/2015.
 */


controllers.controller('LoginController', ['$scope', '$location', 'Api',
    function ($scope, $location, Api) {
        $scope.login = function(form) {
            console.log('1');
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                console.log('2');

                Api.login(username,password,function(data){
                    if (data=="Success") {
                        console.log('3');

                        $location.path("#/officeList").replace();
                    } else if (data=="Error") {
                        console.log('4');

                        $scope.error="Có lỗi xảy ra. Xin thử lại";
                    } else if (data=="Wrong") {
                        console.log('5');

                        $scope.error="Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại";
                    }
                });
            }

        }
    }]);
