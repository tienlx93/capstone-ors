/**
 * Created by ASUS on 6/16/2015.
 */
controllers.controller('ContractDetailController', ['$scope', '$location', '$routeParams', '$route', 'Api', '$modal',
    function ($scope, $location, $routeParams, $route, Api, $modal) {
        var id = $routeParams.id;
        $scope.data = {};
        $scope.show = {};

        //get data
        Api.getContractById(id, function (data) {
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
            }
        });

        $scope.rentalList = {};
        $scope.id = id;

        //get data
        Api.getRentalListDone(id, function (rentalList) {
            if (rentalList == "Error") {
                $scope.error = true;
            } else {
                $scope.rentalList = rentalList;
                var sum = 0;
                for (var i = 0; i < rentalList.length; i++) {
                    sum += rentalList[i].price;
                }
                if (sum == 0) {
                    $scope.Rentaled = true;

                } else {
                    $scope.total = sum;
                }
            }
        });
        $scope.contractReturn = function () {
            $modal.open({
                animation: true,
                templateUrl: 'html/contractReturn.html',
                controller: 'ContractReturnController'
            });
        };
        $scope.contractExtend = function () {
            $modal.open({
                animation: true,
                templateUrl: 'html/contractExtend.html',
                controller: 'ContractExtendController'
            });
        };
    }]);