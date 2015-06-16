/**
 * Created by Thành on 15/06/2015.
 */

controllers.controller('ContractController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getContractList(id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
            }
        })
    }]);