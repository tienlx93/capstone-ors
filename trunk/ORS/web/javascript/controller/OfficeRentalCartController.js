controllers.controller('OfficeRentalCartController', ['$scope','$location', 'Api', '$routeParams', 'ShoppingCartService',
    function ($scope, $location, Api, $routeParams, ShoppingCartService) {
        var id = $routeParams.id;
        $scope.description = '';
        $scope.listItems = ShoppingCartService.getProducts();

        $scope.removeFromCart = function(item){
            ShoppingCartService.removeProduct(item);
        };

        $scope.requestRental = function() {
            var rentalList = $scope.listItems;
            var description = $scope.description;
            Api.requestRental(id, rentalList, description, function(data){
                if (data=="Success") {
                    alert("Gửi yêu cầu thành công");
                    $location.path("/home");
                } else {
                    alert("Có lỗi xảy ra, xin thử lại");
                }
            })
        };
    }]);
