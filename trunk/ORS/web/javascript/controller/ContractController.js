/**
 * Created by Thành on 15/06/2015.
 */

controllers.controller('ContractController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        $scope.data = {};

        //get data
        Api.getContractList(function (data) {
            if (data == "Error") {
                $scope.exist1 = true;
                $scope.rightCus1 = false;
                $scope.exist2 = false;
            } else if (data == "Wrong") {
                $scope.exist1 = false;
                $scope.exist2 = true;
                $scope.rightCus1 = false;
            } else {
                $scope.data = data;
                $scope.rightCus1 = true;
                $scope.exist1 = false;
                $scope.exist2 = false;
            }
        })
    }]);