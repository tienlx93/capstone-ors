/**
 * Created by Thành on 15/06/2015.
 */

controllers.controller('ContractController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        $scope.data = {};

        //get data
        Api.getContractList(function (data) {
            if (data == "Error") {
                $scope.Exist = true;
                $scope.RightCus = true;
            } else {
                $scope.data = data;
            }
        })
    }]);