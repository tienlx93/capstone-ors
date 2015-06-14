/**
 * Created by ASUS on 6/12/2015.
 */
controllers.controller('DetailController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var type = $routeParams.function;
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getDetail(type, id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
            }
        });

        $scope.goto = function (item) {
            if (!$scope.showLegend) {
                $location.path("/home/" + type + "/" + item);
            }
        };
        //switch state
        if (type == 'appointment') {
            $scope.type = "lịch hẹn";
        } else if (type == 'repair') {
            $scope.type = "sửa chữa";
        } else if (type == 'rental') {
            $scope.type = "thuê thiết bị";
        }
        $scope.title = "Chi tiết " + $scope.type;
        $scope.encodeURI = function(data) {
            return encodeURI(data);
        };


        //Change status
        $scope.change = function (status) {
            Api.changeStatus(type, id, status, function() {
                $route.reload();
            });
        }

    }]);
