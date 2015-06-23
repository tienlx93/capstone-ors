/**
 * Created by Thành on 19/06/2015.
 */

controllers.controller('RentalController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getRentalList(id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
            }
        })
    }]);