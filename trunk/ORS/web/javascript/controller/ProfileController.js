/**
 * Created by Thành on 10/07/2015.
 */

controllers.controller('ProfileController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        $scope.data = {};

        //get data
        Api.getProfile(function (data) {
            if (data == "Error") {
                $scope.error = true;
                $scope.isLogin = true;
                $scope.Login = false;
                //$scope.error = "Lỗi kết nối cơ sở dữ liệu, vui lòng thử lại sau";
            } else {
                $scope.isLogin = false;
                $scope.Login = true;
                $scope.data = data;
                if (data.company == null || data.company == "") {
                    $scope.data.company = "Không có";
                }
                if (data.address == null || data.address == "") {
                    $scope.data.address = "Không có";
                }
                $scope.data.birthday2 = Date.parse($scope.data.birthday);
            }
        })
    }]);