/**
 * Created by xps on 7/22/2015.
 */

controllers.controller('resultRequestOfficeController', ['$scope', '$location', '$routeParams', '$route', 'Api', 'toastr',
    function ($scope, $location, $routeParams, $route, Api, toastr) {
        $scope.resultRequestOffice = {};
        $scope.requestOffice = {};

        Api.getResultRequestOffice(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.resultRequestOffice = data;
                for (var i = 0; i < $scope.resultRequestOffice.length; i++) {
                    $scope.resultRequestOffice[i].description = $scope.resultRequestOffice[i].description.length > 200 ?
                    $scope.resultRequestOffice[i].description.substring(0, 200) + "..." : $scope.resultRequestOffice[i].description;
                }
            }
        });

        Api.getRequestOffice(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.requestOffice = data;
            }
        });

        $scope.unsubscribeRequest = function(requestId) {
            Api.unsubscribeRequest(requestId, function (data){
                if (data=="Success") {
                    toastr.success('Gửi yêu cầu thành công', 'Thành công');
                    $route.reload();
                } else {
                    toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');
                }
            })
        };
    }]);    