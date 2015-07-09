/**
 * Created by Thành on 02/07/2015.
 */

controllers.controller('RegisterController', ['$scope', '$location', 'Api',
    function ($scope, $location, Api) {
        $scope.register = function (form) {

            if (form.$valid) {


                Api.register($scope.user, function (data) {
                    if (data == "Error") {
                        $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home").replace();
                    }
                });
            }
        }
    }]);