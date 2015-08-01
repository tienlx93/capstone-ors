/**
 * Created by ASUS on 6/15/2015.
 */
controllers.controller('MenuController', ['$scope', '$rootScope', '$location', 'Api', '$modal',
    function ($scope, $rootScope, $location, Api, $modal) {
        $rootScope.isLogin = false;

        $scope.logout = function() {
            Api.logout(function(data){
                if (data&& data!="Error") {
                    Api.account = {};
                    $scope.fullName = "";
                    $rootScope.isLogin = false;
                    $location.path("/home");
                }
            });
        };

        Api.checkLogin(function(data){
            if (data&& data!="Error") {
                Api.account.username = data[0];
                Api.account.fullName = data[1];
                Api.updateAccount();
            }
        });

        Api.updateAccount = function(){
            if (Api.account.username) {
                $rootScope.isLogin = true;
                $scope.fullName = Api.account.fullName;
            }
        };

        $scope.login = function () {
            $modal.open({
                animation: true,
                templateUrl: 'html/login.html',
                controller: 'LoginController'
            });
        };
        $scope.register = function () {
            $modal.open({
                animation: true,
                templateUrl: 'html/register.html',
                controller: 'RegisterController'
            });
        };

    }]);