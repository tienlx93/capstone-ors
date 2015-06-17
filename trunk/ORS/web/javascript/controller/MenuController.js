/**
 * Created by ASUS on 6/15/2015.
 */
controllers.controller('MenuController', ['$scope', '$location', 'Api',
    function ($scope,$location, Api) {
        $scope.loggedIn = false;

        $scope.logout = function() {
            Api.logout(function(data){
                if (data&& data!="Error") {
                    Api.account = {};
                    $scope.loggedIn = false;
                    $scope.fullName = "";
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
                $scope.loggedIn = true;
                $scope.fullName = Api.account.fullName;
            }
        }

    }]);