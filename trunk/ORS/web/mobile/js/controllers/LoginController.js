/**
 * Created by ASUS on 6/11/2015.
 */
controllers.controller('LoginController', ['$scope', '$location', 'Api',
    function ($scope, $location, Api) {
        setTimeout(function(){
            DEVICE_HEIGHT = $(window).height();
            $(".black").css({
                height: DEVICE_HEIGHT
            });
        },100);

        $scope.login = function(form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;

                Api.login(username,password,function(data){
                    if (data=="Success") {
                        $location.path("home");
                        //$location.replace();
                    } else if (data=="Error") {
                        $scope.error="Có lỗi xảy ra. Xin thử lại";
                    } else if (data=="Wrong") {
                        $scope.error="Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại";
                    }
                });
            }

        }
    }]);
