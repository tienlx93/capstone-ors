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
            }
            var description = $scope.description;
            $scope.clicked= true;
            Api.requestRental(id, rentalList, description, function(data){
                if (data=="Success") {
                    toastr.success('Gửi yêu cầu thành công', 'Thành công');
                    ShoppingCartService.resetProductList();
                    $location.path("/contractList/" + id);
                } else {
                    toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');
                    $scope.clicked= false;
                }
            });
        };
        $scope.calculateTotal = function() {
            var total = 0;
            for(var i = 0; i < $scope.listItems.length; i++) {
                total += $scope.listItems[i].quantity * $scope.listItems[i].unitPrice;
            }
            return total;
        };
    }]);
