controllers.controller('OfficeRentalCartController', ['$scope','$location', 'Api', '$routeParams', 'ShoppingCartService', 'toastr',
    function ($scope, $location, Api, $routeParams, ShoppingCartService, toastr) {
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
                    toastr.success('Gửi yêu cầu thành công', 'Thành công');
                    $location.path("/home");
                } else {
                    toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');
                    //alert("Có lỗi xảy ra, xin thử lại");
                }
            })
        };
    }]);
