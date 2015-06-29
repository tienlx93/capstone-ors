controllers.controller('HomeController', ['$scope','$location', 'Api',
    function ($scope, $location, Api) {
        $scope.searchKey ='';
        $scope.listNewOffice = [];

        $scope.getNewOffice = function () {
            Api.getNewOffice(function(data) {
                if (data) {
                    $scope.listNewOffice = data;
                    for(var i = 0; i < $scope.listNewOffice.length; i++) {
                        $scope.listNewOffice[i].description = $scope.listNewOffice[i].description.length > 200 ?
                        $scope.listNewOffice[i].description.substring(0, 200) + "..." : $scope.listNewOffice[i].description;
                    }
                }
            })
        };

        $scope.getNewOffice();

        $scope.searchListOffice = function (address) {
            $location.path("/list/" + address).replace();
        }
    }]);