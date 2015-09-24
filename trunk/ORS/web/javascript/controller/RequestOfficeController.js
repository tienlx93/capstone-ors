/**
 * Created by Thành on 08/07/2015.
 */

controllers.controller('RequestOfficeController', ['$scope', '$location', 'Api', 'toastr', '$routeParams',
    function ($scope, $location, Api, toastr, $routeParams) {
        var url = $routeParams.query;
        var getParameterValue = function (url, parameter) {
            var index = url.lastIndexOf(parameter);
            var cut = index >= 0 ? url.substring(index + parameter.length + 1) : "";
            return cut != "" ? cut.substring(0, cut.indexOf("&") >= 0 ? cut.indexOf("&") : cut.length) : "";
        };
        var district = getParameterValue(url, "district");
        var price = getParameterValue(url, "price");
        var amenities = getParameterValue(url, "amenities");
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

        $scope.reOffice = {};
        $scope.districts = [
            'Tân Bình', 'Phú Nhuận', 'Bình Thạch', 'Gò Vấp', 'Bình Tân', 'Thủ Đức', 'Tân Phú',
            'Củ Chi', 'Hóc Môn', 'Nhà Bè', 'Cần Giờ', 'Bình Chánh',
            'Quận 1', 'Quận 2', 'Quận 3', 'Quận 4', 'Quận 5', 'Quận 6',
            'Quận 7', 'Quận 8', 'Quận 9', 'Quận 10', 'Quận 11', 'Quận 12'
        ];

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
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "Error Date") {
                        toastr.error('Ngày sinh không hợp lệ');
                    } else if (data) {
                        toastr.success('Mời đăng nhập và kiểm tra email để hoàn tất đăng kí', 'Đăng kí thành công');
                        $location.path("#/home").replace();
                    }
                });
            }
        };
        $scope.requestOffice = function (form) {
            $scope.clicked= true;
            if (form.$valid) {

                Api.requestOffice($scope.reOffice, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                        $scope.clicked= false;
                    } else if (data) {
                        $location.path("/resultRequestOffice");
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

        $scope.add = function () {
            var error = true;
            for (var i = 0; i < $scope.amenities.length; i++) {
                if ($scope.amenityInput === $scope.amenities[i]) {
                    var duplicate = false;
                    for(var j = 0; j < $scope.reOffice.amenityList.length; j++) {
                        if($scope.amenityInput === $scope.reOffice.amenityList[j]){
                            duplicate = true;
                            error = false;
                        }
                    }
                    if(duplicate == false) {
                        $scope.reOffice.amenityList.push($scope.amenityInput);
                        $scope.amenityInput = "";
                        error = false;
                    }
                }
            }
            if(duplicate) {
                toastr.error('Tiện nghi đã được thêm trước đó');
            }
            if(error) {
                toastr.error('Tiện nghi chưa tồn tại');
            }
        };
        $scope.remove = function (idx) {
            $scope.reOffice.amenityList.splice(idx, 1);
        };

    }]);