/**
 * Created by Thành on 11/07/2015.
 */

controllers.controller('ChangePassController', ['$scope', '$location', '$routeParams', '$route', 'toastr', 'Api',
    function ($scope, $location, $routeParams, $route, toastr, Api) {

        $scope.editPass = function (form) {
            if (form.$valid) {
                $scope.data.username = "";
                $scope.data.username = Api.account.username;
                Api.editPass($scope.data, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');

                    } else if (data == "Pass Error") {
                        toastr.error('Mật khẩu hiện tại không đúng');

                    } else if (data == "RePass Error") {
                        toastr.error('Mật khẩu mới không chính xác');
                        $scope.data.error = true;

                    } else if (data == "Success") {
                        toastr.success('Chỉnh sửa thành công');
                        $location.path("/profile");
                    }
                });
            }
        }
    }]);