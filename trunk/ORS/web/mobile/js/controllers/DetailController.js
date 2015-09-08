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
