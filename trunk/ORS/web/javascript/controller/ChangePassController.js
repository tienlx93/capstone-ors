/**
 * Created by Thành on 11/07/2015.
 */

controllers.controller('ChangePassController', ['$scope', '$location', '$routeParams', '$route', 'toastr', 'Api',
    function ($scope, $location, $routeParams, $route, toastr, Api) {

        $scope.editPass = function (form) {
            if (form.$valid) {

                Api.editPass($scope.data, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');

                    } else if (data == "Pass Error") {
                        toastr.error('Mật khẩu hiện tại không đúng');

                    } else if (data == "RePass Error") {
                        toastr.error('Mật khẩu mới không chính xác');

                    } else if (data == "Success") {
                        toastr.success('Chỉnh sửa thành công');
                        $location.path("/home");
                    }
                });
            }
        }
    }]);