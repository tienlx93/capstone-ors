/**
 * Created by Thành on 17/07/2015.
 */

controllers.controller('RepairHistoryController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getRepairHistoryList(id, function (data) {
            if (data == "Error") {
                $scope.WrongCus = true;
                $scope.RightCus = false;
                $scope.isLogin = true;
            } else if (data == "Wrong") {
                $scope.RightCus = false;
                $scope.WrongCus = false;
                $scope.isLogin = false;
            } else {
                $scope.data = data;
                $scope.isLogin = true;
                $scope.RightCus = true;
                $scope.WrongCus = false;
            }
        })
    }]);