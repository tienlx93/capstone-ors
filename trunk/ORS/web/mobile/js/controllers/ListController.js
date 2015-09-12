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
                Api.getCurrentTime(function(time){
                    var nowTemp = new Date(time);
                    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
                    var tomorrow = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate() + 1, 0, 0, 0, 0);
                    for (var i = 0; i < data.length; i++) {
                        if (type == 'appointment' || type == 'repair') {
                            var jobTime = new Date(data[i].date);
                            data[i].date = jobTime.getTime();
                            if (jobTime < tomorrow) {
                                data[i].statusName = DEFAULT_STATUS[0].name;
                            } else {
                                data[i].statusName = DEFAULT_STATUS[1].name;
                            }
                        } else {
                            data[i].statusName = REPAIR_STATUS[data[i].status - 1].name;
                        }
                    }
                    $scope.data = data;
                });

            }
        })

    }]);
