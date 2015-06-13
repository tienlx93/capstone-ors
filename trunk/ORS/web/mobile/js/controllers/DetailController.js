/**
 * Created by ASUS on 6/12/2015.
 */
controllers.controller('DetailController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var func = $routeParams.function;
        var id = $routeParams.id;
        $scope.data = {};
        $scope.goto = function (item) {
            if (!$scope.showLegend) {
                $location.path("/home/" + func + "/" + item);
            }
        };
        //switch state
        if (func == 'appointment') {
            $scope.type = "lịch hẹn";
            Api.getAppointmentDetail(id, function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })

        } else if (func == 'repair') {
            $scope.type = "sửa chữa";
            Api.getRepairDetail(id, function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })
        } else if (func == 'rental') {
            $scope.type = "thuê thiết bị";
            Api.getRentalDetail(id, function (data) {
                if (data == "Error") {
                    $scope.error = true;
                } else {
                    $scope.data = data;
                }
            })
        }
        $scope.title = "Chi tiết " + $scope.type;

        //Change status
        $scope.change = function (status) {
            Api.changeStatus(func, id, status, function() {
                $route.reload();
            });
        }

    }]);
