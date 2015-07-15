controllers.controller('OfficeRentalCartController', ['$scope','$location', 'Api', '$routeParams', 'ShoppingCartService', 'toastr',
    function ($scope, $location, Api, $routeParams, ShoppingCartService, toastr) {
        var id = $routeParams.id;
        $scope.description = '';
        Api.account.cart = ShoppingCartService.getProducts();
        $scope.listItems = Api.account.cart;

        $scope.removeFromCart = function(item){
            ShoppingCartService.removeProduct(item);
        };

        $scope.requestRental = function() {
            var rentalList = [];
            for(var i = 0; i < $scope.listItems.length; i++) {
                var rentalItem = {
                    rentalId: $scope.listItems[i].rentalId,
                    name: $scope.listItems[i].name,
                    description: $scope.listItems[i].description,
                    unitPrice: $scope.listItems[i].unitPrice,
                    quantity: $scope.listItems[i].quantity,
                    imageUrl: $scope.listItems[i].imageUrl
                };
                rentalList.push(rentalItem);
            };
            var description = $scope.description;
            Api.requestRental(id, rentalList, description, function(data){
                if (data=="Success") {
                    toastr.success('Gửi yêu cầu thành công', 'Thành công');
                    Api.account.cart = [];
                    $location.path("/home");
                } else {
                    toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');
                }
            })
        };
    }]);
