
controllers.controller('RequestController', ['$scope', 'Api',
    function ($scope, Api) {
        $scope.isLogin = false;
        $scope.login = function(form) {
            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                //
                $scope.isLogin = true;

            }
        };
        $scope.register = function(){

        };
        $scope.back = function() {
            $scope.isLogin = false;
        };

        $scope.request = function() {
            var time = new Date($scope.date);
            Api.requestAppointment(time, function() {

            });
        }
    }]);
