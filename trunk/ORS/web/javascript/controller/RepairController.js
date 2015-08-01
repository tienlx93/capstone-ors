/**
 * Created by Thành on 19/06/2015.
 */
controllers.controller('RepairController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getRepairList(id, function (data) {
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
                $scope.id = id;
                $scope.isLogin = true;
                $scope.RightCus = true;
                $scope.WrongCus = false;
            }
        })
    }]);