controllers.controller('HomeController', ['$scope','$location', 'Api',
    function ($scope, $location, Api) {

        $scope.listNewOffice = [];

        $scope.getNewOffice = function () {
            Api.getNewOffice(function(data) {
                if (data) {
                    $scope.listNewOffice = data
                }
            })
        };

        $scope.getNewOffice();
    }]);