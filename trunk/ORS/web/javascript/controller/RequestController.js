
controllers.controller('RequestController', ['$scope', '$rootScope', '$location', 'Api',
    function ($scope, $rootScope, $location, Api) {

        $scope.login = function(form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                Api.login(username,password,function(data){
                    if (data=="Error") {
                        $scope.error="Có lỗi xảy ra. Xin thử lại";
                    } else if (data=="Wrong") {
                        $scope.error="Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại";
                    } else if (data) {
                        $scope.isLogin = true;
                        Api.updateAccount();
                    }
                });

            }
        };
        $scope.register = function(){

        };


        $scope.request = function(form) {
            if (form.$valid) {
                var time = new Date($scope.date);
                if (!time) {
                    $scope.error = "Mời nhập thời gian hẹn";
                } else {
                    time = time.getTime();
                    Api.requestAppointment(time, 9, function(data) {
                        if (data == "Success") {
                            alert("Đặt lịch hẹn thành công");
                            $location.path("/detail");
                        } else {
                            alert("Có lỗi xảy ra, xin thử lại");
                        }
                    });
                }
            }


        }
    }]);
