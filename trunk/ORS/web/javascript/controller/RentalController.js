/**
 * Created by Thành on 19/06/2015.
 */

controllers.controller('RentalController', ['$scope', '$location', '$routeParams', '$route', 'Api', '$modal',
    function ($scope, $location, $routeParams, $route, Api, $modal) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getRentalList(id, function (data) {
            if (data == "Error") {
                $scope.WrongCus = true;
                $scope.RightCus = false;
                $scope.isLogin = true;
                $scope.Rental = true;
            } else if (data == "Wrong") {
                $scope.RightCus = false;
                $scope.WrongCus = false;
                $scope.isLogin = false;
                $scope.Rental = true;
            } else if (data.length == [0]) {
                $scope.Rental = false;
                $scope.isLogin = true;
                $scope.RightCus = false;
                $scope.WrongCus = false;
            } else {
                $scope.data = data;
                $scope.Rental = true;
                $scope.isLogin = true;
                $scope.RightCus = true;
                $scope.WrongCus = false;
            }
        });

        $scope.rentalDetail = function (id) {
            $modal.open({
                animation: true,
                templateUrl: 'html/rentalDetail.html',
                controller: 'RentalDetailController',
                resolve: {
                    id: function () {
                        return id;
                    }
                }
            });
        };

    }]);