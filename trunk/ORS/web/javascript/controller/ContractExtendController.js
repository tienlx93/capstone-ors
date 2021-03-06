/**
 * Created by Thành on 17/07/2015.
 */

controllers.controller('ContractExtendController', ['$scope', '$route', 'Api','toastr', '$modalInstance', '$routeParams',
    function ($scope, $route, Api, toastr, $modalInstance, $routeParams) {
        var id = $routeParams.id;
        $scope.contractExtend = function (form) {
            if (form.$valid) {

                Api.contractExtend(id, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data) {
                        toastr.success("Đã gửi yêu cầu gia hạn hợp đồng");
                        $modalInstance.close();
                        $route.reload();
                    }
                });
            }
        };
        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }

    }]);