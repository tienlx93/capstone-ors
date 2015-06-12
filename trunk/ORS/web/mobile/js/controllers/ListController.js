/**
 * Created by ASUS on 6/12/2015.
 */
controllers.controller('ListController', ['$scope', '$location', '$routeParams', 'Api',
    function ($scope, $location, $routeParams, Api) {
        var func = $routeParams.function;
        $scope.showLegend = false;
        $scope.data = [];
        $scope.goto = function (item) {
            if (!$scope.showLegend) {
                $location.path("/home/" + func + "/" + item);
            }
        };
        if (func == 'appointment') {
            $scope.title = "Danh sách lịch hẹn";
            $scope.legends = APPOINTMENT_STATUS;
            Api.getAppointmentList(function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })

        } else if (func == 'repair') {
            $scope.title = "Danh sách sửa chữa";
            $scope.legends = REPAIR_STATUS;
            Api.getRentalList(function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })
        } else if (func == 'rental') {
            $scope.title = "Danh sách thuê thiết bị";
            $scope.legends = REPAIR_STATUS;
            Api.getRepairList(function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })
        }

    }]);
