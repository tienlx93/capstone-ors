/**
 * Created by Thành on 17/07/2015.
 */

controllers.controller('ContractReturnController', ['$scope', '$route', 'Api','toastr', '$modalInstance', '$routeParams',
    function ($scope, $route, Api, toastr, $modalInstance, $routeParams) {
        var id = $routeParams.id;
        $scope.contractReturn = function (form) {
            if (form.$valid) {

                Api.contractReturn(id, function (data) {
                    if (data == "Wrong") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "OK") {
                        toastr.success("Đã gửi yêu cầu hủy hợp đồng trước hạn");
                        $modalInstance.close();
                        $route.reload();
                    }
                });
            }
        };

        $scope.contractReturnAfter = function (form) {
            if (form.$valid) {

                Api.contractReturnAfter(id, function (data) {
                    if (data == "Wrong") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                    } else if (data == "OK") {
                        toastr.success("Đã gửi yêu cầu hủy hợp đồng trước hạn");
                        $modalInstance.close();
                        $route.reload();
                    }
                });
            }
        };

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }

        Api.checkContractReturn(id, function (data) {
            if (data == "First") {
                $scope.first = true;
                $scope.second = false;

            } else if (data == "Second") {
                $scope.first = true;
                $scope.second = true;

            }
        });

    }]);