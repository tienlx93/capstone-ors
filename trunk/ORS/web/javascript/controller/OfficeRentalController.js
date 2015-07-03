controllers.controller('OfficeRentalController', ['$scope', '$location', 'Api', '$routeParams', 'ShoppingCartService',
    function ($scope, $location, Api, $routeParams, ShoppingCartService) {
        $scope.contractID = $routeParams.id;
        var rentalCart = [];


        $scope.itemList = [
            {
                id: 1,
                name: 'Bàn số 1',
                description: 'Bàn làm việc 1*2 m',
                price: 100000,
                image: '../img/ban-1.jpg',
                quantity: 1
            },
            {
                id: 2,
                name: 'Bàn số 2',
                description: 'Bàn làm việc 1*2 m',
                price: 180000,
                image: '../img/ban-2.jpg',
                quantity: 1
            },
            {
                id: 3,
                name: 'Bàn số 3',
                description: 'Bàn làm việc 1*2 m',
                price: 80000,
                image: '../img/ban-3.jpg',
                quantity: 1
            },
            {
                id: 4,
                name: 'Ghế số 1',
                description: 'Ghế đơn văn phòng',
                price: 50000,
                image: '../img/ghe-1.jpg',
                quantity: 1
            },
            {
                id: 5,
                name: 'Ghế số 2',
                description: 'Ghế đơn văn phòng',
                price: 60000,
                image: '../img/ghe-2.jpg',
                quantity: 1
            }
        ];

        var getAllRental = function () {
            Api.getAllOfficeRentalList(function (data) {
                if (data) {
                    $scope.itemList = data;

                }
            })
        };

        getAllRental();

        $scope.addToCart = function (item) {
            ShoppingCartService.addProduct(item);
        };

    }]);
