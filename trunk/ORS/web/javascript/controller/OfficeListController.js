controllers.controller('OfficeListController', ['$scope','$location', 'Api', '$routeParams',
    function ($scope, $location, Api, $routeParams) {
        var address = $routeParams.query;

        $scope.searchOffice = function (address) {
            Api.searchOfficeByAddress(address, function(data) {
                if (data) {
                    $scope.listSearchedOffice = data;
                    for(var i = 0; i < $scope.listSearchedOffice.length; i++) {
                        $scope.listSearchedOffice[i].description = $scope.listSearchedOffice[i].description.length > 200 ?
                        $scope.listSearchedOffice[i].description.substring(0, 200) + "..." : $scope.listSearchedOffice[i].description;
                    }
                }
            })
        };

        $scope.searchOffice(address);
    }]);
