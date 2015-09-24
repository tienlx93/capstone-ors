controllers.controller('HomeController', ['$scope', '$rootScope', '$location', 'Api', 'toastr',
    function ($scope, $rootScope, $location, Api, toastr) {
        $scope.searchKey ='';
        $scope.gPlace = {};
        $scope.searchTerm = {};
        $scope.priceRange = 0;
        $scope.listNewOffice = [];
        $rootScope.q = [];
        $rootScope.amenityWeight = [];
        $scope.isCollapsed = true;

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
            if ($scope.searchTerm.latitude) {
                //$scope.searchKey = $("#place").val();
                $location.path("/list/latitude=" + $scope.searchTerm.latitude
                + "&longitude=" + $scope.searchTerm.longitude
                + "&priceRange=" + $scope.priceRange
                + "&price=" + $scope.price
                + "&district=" + $scope.searchTerm.district
                + "&searchKey=" + $scope.searchKey);
            } else {
                toastr.error("Mời nhập vào địa chỉ");
            }
        };

        Api.amenityWeight(function (data) {
            $rootScope.amenityWeight = data;
            $rootScope.q = [];
            for (var i = 0; i < data.length; i ++) {
                $rootScope.q.push(false);
            }
        });

        $scope.$watch('price', function(price) {
            if (!price || price < 100000) {
                $scope.priceRange = 0;
            } else if (price < 200000) {
                $scope.priceRange = 1;
            } else if (price < 300000) {
                $scope.priceRange = 2;
            } else if (price < 400000) {
                $scope.priceRange = 3;
            } else if (price < 500000) {
                $scope.priceRange = 4;
            } else {
                $scope.priceRange = 5;
            }
        })
    }]);