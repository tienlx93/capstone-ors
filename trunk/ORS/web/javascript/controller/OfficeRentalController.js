controllers.controller('OfficeRentalController', ['$scope', '$location', 'Api', '$routeParams', 'ShoppingCartService',
    function ($scope, $location, Api, $routeParams, ShoppingCartService) {
        $scope.contractID = $routeParams.id;
        var rentalCart = [];

        var getAllRental = function () {
            Api.getAllOfficeRentalList(function (data) {
                if (data) {
                    $scope.itemList = data;
                    for(var i = 0; i < $scope.itemList.length; i++) {
                        $scope.itemList[i].quantity = 1;
                    }
                }
            })
        };

        getAllRental();

        $scope.addToCart = function (item) {
            ShoppingCartService.addProduct(item);
        };

    }]);
