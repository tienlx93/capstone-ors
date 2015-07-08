controllers.controller('OfficeRentalController', ['$scope', '$location', 'Api', '$routeParams', 'ShoppingCartService', 'toastr',
    function ($scope, $location, Api, $routeParams, ShoppingCartService, toastr) {
        $scope.contractID = $routeParams.id;
        var rentalCart = [];

        var getAllRental = function () {
            Api.getAllOfficeRentalList(function (data) {
                if (data) {
                    $scope.itemList = data;
                    for(var i = 0; i < $scope.itemList.length; i++) {
                        $scope.itemList[i].number = 1;
                        $scope.itemList[i].quantity = 1;
                    }
                }
            })
        };

        getAllRental();

        $scope.addToCart = function (item) {
            ShoppingCartService.addProduct(item);
            toastr.success('Bạn đã thêm ' + item.number + ' ' + item.name + ' vào giỏ hàng');
            item.number = 1;
        };

    }]);
