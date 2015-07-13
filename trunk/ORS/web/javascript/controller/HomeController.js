controllers.controller('HomeController', ['$scope','$location', 'Api', 'toastr',
    function ($scope, $location, Api, toastr) {
        $scope.searchKey ='';

        $scope.gPlace = {};
        $scope.place = {};
        $scope.priceRange = 0;

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

        $scope.searchListOffice = function () {
            if ($scope.place.latitude) {
                $location.path("/list/latitude=" + $scope.place.latitude
                + "&longitude=" + $scope.place.longitude
                + "&priceRange=" + $scope.priceRange);
            } else {
                toastr.error("Mời nhập vào địa chỉ");
            }

        }
    }]);