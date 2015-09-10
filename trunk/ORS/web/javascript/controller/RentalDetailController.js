/**
 * Created by Thành on 9/12/2015.
 */

controllers.controller('RentalDetailController', ['$scope', '$location', 'id', '$route', 'Api', '$modalInstance',
    function ($scope, $location, id, $route, Api, $modalInstance) {

        Api.getRentalDetail(id, function (rentalList) {
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


        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }


    }]);