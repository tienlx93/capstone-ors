controllers.controller('HomeController', ['$scope','$location', 'Api',
    function ($scope, $location, Api) {
        $scope.searchKey ='';
        $scope.listNewOffice = [];

        $scope.getNewOffice = function () {
            Api.getNewOffice(function(data) {
                if (data) {
                    $scope.listNewOffice = data
                }
            })
        };

        $scope.getNewOffice();

        $scope.searchListOffice = function (address) {
            $location.path("/list/" + address).replace();
            //Api.searchOfficeByAddress(address, function(data) {
            //    if (data) {
            //        $scope.listSearchedOffice = data;
            //    }
            //})
        }
    }]);