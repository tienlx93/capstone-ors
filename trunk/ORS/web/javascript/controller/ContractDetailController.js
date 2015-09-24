/**
 * Created by ASUS on 6/16/2015.
 */
controllers.controller('ContractDetailController', ['$scope', '$location', '$routeParams', '$route', 'Api', '$modal',
    function ($scope, $location, $routeParams, $route, Api, $modal) {
        var id = $routeParams.id;
        var tab = $routeParams.tab;
        if (tab && tab < 2) {
            $scope.tab = tab;
        }
        $scope.data = {};
        $scope.show = {};
        $scope.profile = {};

        var officeId = 0;
        //get data
        Api.getContractById(id, function (data) {

            if (data == "Error") {
                $scope.WrongCus = true;
                $scope.RightCus = false;
                $scope.isLogin = true;

            } else if (data == "Wrong") {
                $scope.RightCus = false;
                $scope.WrongCus = false;

                $scope.isLogin = false;
            } else {

                $scope.data = data;
                $scope.RightCus = true;
                $scope.WrongCus = false;

                $scope.isLogin = true;
                $scope.today = new Date();

                Api.getContractChildById(id, function (data2) {
                    if (data2 == "Error") {
                        var time30 = new Date();
                        time30.setDate(time30.getDate() + 30);
                        if (time30 < data.endDay) {
                            $scope.month = 1;
                        }
                        $scope.child = 1;
                    } else {
                        $scope.child = 0;
                        $scope.month = 1;
                    }
                });



                officeId = data.officeId;

                Api.getAmenityByOfficeId(officeId, function (amenity) {
                    $scope.amenities = amenity;
                });

                var imgList = data.imgUrl;
                if (imgList != undefined) {
                    $scope.listImg = imgList.split(',');
                    $scope.listImg.pop($scope.listImg.length - 1);
                }

                if (data.paymentTerm == "3 tháng") {
                    $scope.Term = 3;
                } else if (data.paymentTerm == "6 tháng") {
                    $scope.Term = 6;
                } else $scope.Term = 1;
                $scope.totalPrice = Math.ceil((data.endDay - data.startDay) / (86400000 * 30)) * $scope.data.area * $scope.data.price;
            }
        });

        Api.getProfile(function (profile) {
            if (profile == "Error") {

            } else {
                $scope.profile = profile;
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
                    $scope.display = "Không có";
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