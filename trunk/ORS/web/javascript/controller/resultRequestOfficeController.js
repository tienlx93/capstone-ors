/**
 * Created by xps on 7/22/2015.
 */

controllers.controller('resultRequestOfficeController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        $scope.resultRequestOffice = {};

        Api.getResultRequestOffice(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.resultRequestOffice = data;
                for (var i = 0; i < $scope.resultRequestOffice.length; i++) {
                    $scope.resultRequestOffice[i].description = $scope.resultRequestOffice[i].description.length > 200 ?
                    $scope.resultRequestOffice[i].description.substring(0, 200) + "..." : $scope.resultRequestOffice[i].description;
                }
            }
        })
    }]);