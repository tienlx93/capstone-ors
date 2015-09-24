/**
 * Created by Thành on 19/06/2015.
 */
controllers.controller('RepairController', ['$scope', '$location', '$routeParams', '$route', 'Api', '$modal',
    function ($scope, $location, $routeParams, $route, Api, $modal) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getRepairList(id, function (data) {
            $scope.id = id;
            if (data == "Error") {
                $scope.WrongCus = true;
                $scope.RightCus = false;
                $scope.isLogin = true;
                $scope.Repair = true;
            } else if (data == "Wrong") {
                $scope.RightCus = false;
                $scope.WrongCus = false;
                $scope.isLogin = false;
                $scope.Repair = true;
            } else if (data.length == [0]) {
                $scope.Repair = false;
                $scope.isLogin = true;
                $scope.RightCus = false;
                $scope.WrongCus = false;
            } else {
                $scope.data = data;
                /*if (data.createTime = 0) {
                    $scope.time = data.createTime;
                }*/
                $scope.isLogin = true;
                $scope.Repair = true;
                $scope.RightCus = true;
                $scope.WrongCus = false;
            }
        });

        $scope.showHistory = function (id) {
            $modal.open({
                animation: true,
                size: 'lg',
                templateUrl: 'html/repairHistory.html',
                controller: 'RepairHistoryController'
            });
        };
    }]);