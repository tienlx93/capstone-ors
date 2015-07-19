/**
 * Created by ASUS on 6/11/2015.
 */
controllers.controller('HomeController', ['$scope', '$location', 'Api',
    function ($scope, $location, Api) {
        $scope.title = "Home";
        $scope.badge = [4, 1, 3];
        Api.countAssigned(function(data){
            if (data != "Error") {
                $scope.badge = data;
            } else {
                $location.path("/login");
            }
        });
        $scope.goto = function (page) {
            if (page=='1') {
                $location.path("/home/appointment");
            } else if (page=='2') {
                $location.path("/home/repair");
            } else if (page=='3') {
                $location.path("/home/rental");
            }
        }
    }]);