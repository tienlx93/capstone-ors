/**
 * Created by Thành on 10/07/2015.
 */

controllers.controller('ProfileController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        $scope.data = {};

        //get data
        Api.getProfile(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
            }
        })
    }]);