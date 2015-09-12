/**
 * Created by ASUS on 6/12/2015.
 */
controllers.controller('ListController', ['$scope', '$location', '$routeParams', 'Api',
    function ($scope, $location, $routeParams, Api) {
        var type = $routeParams.function;
        $scope.showLegend = false;
        $scope.data = [];
        $scope.goto = function (item) {
            if (!$scope.showLegend) {
                $location.path("/home/" + type + "/" + item);
            }
        };
        if (type == 'appointment') {
            $scope.title = "Danh sách lịch hẹn";
            $scope.legends = DEFAULT_STATUS;
        } else if (type == 'repair') {
            $scope.title = "Danh sách sửa chữa";
            $scope.legends = DEFAULT_STATUS;
        } else if (type == 'rental') {
            $scope.title = "Danh sách thuê thiết bị";
            $scope.legends = REPAIR_STATUS;
        }
        Api.getList(type, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
            }
        })

    }]);
