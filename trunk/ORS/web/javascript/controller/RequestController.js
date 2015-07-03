controllers.controller('RequestController', ['$scope', '$rootScope', '$location', 'Api',
    function ($scope, $rootScope, $location, Api) {

        var date = $('#date').datetimepicker({
            sideBySide: true,
            minDate: new Date(),
            daysOfWeekDisabled: [6],
            disabledHours: [0, 1, 2, 3, 4, 5, 6, 7, 18, 19, 20, 21, 22, 23, 24]
        });
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
        $scope.register = function () {

        };

        $scope.request = function (form) {
            var txtTime = $('#date').val();
            var time = new Date(txtTime);
            if (!time) {
                $scope.error = "Mời nhập thời gian hẹn";
            } else {
                time = time.getTime();
                Api.requestAppointment(time, 9, function (data) {
                    if (data == "Success") {
                        alert("Đặt lịch hẹn thành công");
                        $location.path("/detail");
                    } else {
                        alert("Có lỗi xảy ra, xin thử lại");
                    }
                });
            }

        }
    }]);
