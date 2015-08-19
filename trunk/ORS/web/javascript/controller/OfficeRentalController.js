controllers.controller('OfficeRentalController', ['$scope', '$location', 'Api', '$routeParams', 'ShoppingCartService', 'toastr',
    function ($scope, $location, Api, $routeParams, ShoppingCartService, toastr) {
        $scope.contractID = $routeParams.id;
        var rentalCart = [];
        $scope.cart = ShoppingCartService.getProducts();

        Api.getContractById($scope.contractID, function (data) {
            if (data == "Error") {
                $scope.WrongCus = true;
                $scope.RightCus = false;
                $scope.isLogin = true;
                $scope.Expire = false;
            } else if (data == "Expire") {
                $scope.Expire = true;
                $scope.RightCus = false;
                $scope.WrongCus = false;
                $scope.isLogin = true;
                $scope.error = "Hợp đồng đã hết hạn";
            } else if (data == "Wrong") {
                $scope.RightCus = false;
                $scope.WrongCus = false;
                $scope.Expire = false;
                $scope.isLogin = false;
            } else {
                $scope.data = data;
                $scope.RightCus = true;
                $scope.WrongCus = false;
                $scope.Expire = false;
                $scope.isLogin = true;
                $scope.category = 1;
                if($scope.data.category === 'Tòa nhà văn phòng') {
                    $scope.category = 2;
                }
                Api.getAllOfficeRentalList(function (data) {
                    if (data) {
                        $scope.rentals = data;
                        $scope.itemList = [];
                        for (var i = 0; i < $scope.rentals.length; i++) {
                            if($scope.rentals[i].officeType === $scope.category) {
                                $scope.rentals[i].number = 1;
                                $scope.rentals[i].quantity = 1;
                                $scope.itemList.push($scope.rentals[i]);
                            }
                        }
                    }
                });
                if (data.paymentTerm == "3 tháng") {
                    $scope.Term = 3;
                } else if (data.paymentTerm == "6 tháng") {
                    $scope.Term = 6;
                } else $scope.Term = 1;

            }
        });


        $scope.addToCart = function (item) {
            ShoppingCartService.addProduct(item);
            toastr.success('Bạn đã thêm ' + item.number + ' ' + item.name + ' vào giỏ hàng');
            item.number = 1;
            $scope.cart = ShoppingCartService.getProducts();
        };

    }]);
