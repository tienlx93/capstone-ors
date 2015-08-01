controllers.controller('RequestController', ['$scope', '$rootScope', '$routeParams', '$location', 'Api', 'toastr',
    function ($scope, $rootScope, $routeParams, $location, Api, toastr) {
        var verifyCallback = function (response) {
            $scope.user.captcha3 = response;
            $scope.$$phase || $scope.$apply();
        };
        setTimeout(function () {
            grecaptcha.render('captcha3', {
                'sitekey': '6LereAoTAAAAAMC3pFh9lblF7U8tLMuiCUjENLYW',
                'callback': verifyCallback
            });
        }, 100);

        var id = $routeParams.id;
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
                        toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');

                    } else if (data == "Wrong") {
                        toastr.error('Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại');

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
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "Error Date") {
                        toastr.error('Ngày sinh không hợp lệ');
                    } else if (data) {
                        toastr.success('Mời đăng nhập và kiểm tra email để hoàn tất đăng kí', 'Đăng kí thành công');
                    }
                });
            }
        };

        $scope.request = function (form) {
            var txtTime = $('#date').val();
            var time = new Date(txtTime);
            if (!time) {
                toastr.error('Mời nhập thời gian hẹn');

            } else {
                time = time.getTime();
                Api.requestAppointment(time, id, function (data) {
                    if (data == "Success") {
                        toastr.success('Đặt lịch hẹn thành công');
             //           alert("Đặt lịch hẹn thành công");
                        $location.path("/detail");
                    } else {
                        toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');
                    }
                });
            }

        }
    }]);
