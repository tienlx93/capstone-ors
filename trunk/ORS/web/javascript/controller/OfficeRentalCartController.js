controllers.controller('OfficeRentalCartController', ['$scope','$location', 'Api', '$routeParams', 'ShoppingCartService',
    function ($scope, $location, Api, $routeParams, ShoppingCartService) {
        var id = $routeParams.id;
        $scope.listItems = ShoppingCartService.getProducts();

    }]);
