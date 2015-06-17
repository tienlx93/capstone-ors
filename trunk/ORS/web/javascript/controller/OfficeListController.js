controllers.controller('OfficeListController', ['$scope','$location', 'Api', '$routeParams',
    function ($scope, $location, Api, $routeParams) {
        var address = $routeParams.query;

        $scope.searchOffice = function (address) {
            Api.searchOfficeByAddress(address, function(data) {
                if (data) {
                    $scope.listSearchedOffice = data;
                }
            })
        };

        $scope.searchOffice(address);
    }]);
