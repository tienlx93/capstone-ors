/**
 * Created by ASUS on 6/12/2015.
 */
controllers.controller('DetailController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var type = $routeParams.function;
        var id = $routeParams.id;
        $scope.data = {};
        $scope.diff = "";
        $scope.showBtn = false;
        var nowTemp;
        var now;
        var tomorrow;
        var jobTime;
        //get data
        Api.getDetail(type, id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                Api.getCurrentTime(function(time){
                    nowTemp = new Date(time);
                    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
                    tomorrow = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate() + 1, 0, 0, 0, 0);
                    jobTime = new Date(data.date);
                    if (type == 'appointment' || type == 'repair') {
                        if (jobTime < tomorrow) {
                            data.statusClass = DEFAULT_STATUS[0].name;
                            data.statusName = DEFAULT_STATUS[0].description;
                        } else {
                            data.statusClass = DEFAULT_STATUS[1].name;
                            data.statusName = DEFAULT_STATUS[1].description;
                        }
                    } else {
                        data.statusClass = REPAIR_STATUS[data.status - 1].name;
                        data.statusName = REPAIR_STATUS[data.status - 1].description;
                    }

                    $scope.data = data;
                    $scope.now = nowTemp;
                    if (jobTime < nowTemp) {
                        $scope.showBtn = true;
                    } else {
                        var days = Math.ceil((jobTime.getTime() - tomorrow.getTime())/(3600*24*1000));
                        if (days > 0) {
                            $scope.diff = days + " ngày";
                        } else {
                            $scope.diff = "khoảng " + Math.round((jobTime.getTime() - nowTemp.getTime())/(3600*1000)) + " giờ";
                        }
                    }
                });
            }
        });

        //switch state
        if (type == 'appointment') {
            $scope.type = "lịch hẹn";
        } else if (type == 'repair') {
            $scope.type = "sửa chữa";
        } else if (type == 'rental') {
            $scope.type = "thuê thiết bị";
        }
        $scope.title = "Chi tiết " + $scope.type;
        $scope.encodeURI = function (data) {
            return encodeURI(data);
        };


        //Change status
        $scope.change = function (status) {

            var comment = "";
            var changeStatus = function () {
                Api.changeStatus(type, id, status, function (data) {
                    if (data == "Wrong") {
                        alert("Chưa tới thời gian công việc. Cập nhật thất bại.")
                    }
                    if (data == "Success"){
                        alert("Cập nhật thành công.")
                    }
                    window.history.back();
                }, comment);
            };

            if ((status == 5) && type == "appointment") {
                if (status == 5) {
                    comment = window.prompt("Nhập lí do hủy");
                }
                if (comment) {
                    changeStatus();
                }
            } else {
                changeStatus();
            }

        }

    }]);
