/**
 * Created by Thành on 02/07/2015.
 */
controllers.controller('RegisterController', ['$scope', '$location', 'Api', 'toastr', '$modalInstance',
    function ($scope, $location, Api, toastr, $modalInstance) {
        var verifyCallback = function (response) {
            $scope.user.captcha = response;
            $scope.$$phase || $scope.$apply();
        };
        setTimeout(function () {
            grecaptcha.render('captcha', {
                'sitekey': '6Lcn1QkTAAAAAK51YHXxI3b2jL_0yW1tgrq_Fv71',
                'callback': verifyCallback
            });
        }, 100);

        $scope.user = {};
        /*$scope.user = {
            birthday: new Date(1980, 11, 31)
        };*/

        $scope.register = function (form) {

            if (form.$valid) {


                Api.register($scope.user, function (data) {
                    if (data == "Error") {
                        toastr.error('Hãy chọn tên khác','Tên đăng nhập đã được sử dụng');
                        $modalInstance.close();//   $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data == "Error Date") {
                        toastr.error('Ngày sinh không hợp lệ');
                    } else if (data) {
                        toastr.success('Mời đăng nhập và kiểm tra email để hoàn tất đăng kí', 'Đăng kí thành công');
                        $modalInstance.close();
                    }
                });
            }
        };
        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        };
    }]);