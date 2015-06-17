/**
 * Created by ASUS on 6/15/2015.
 */
controllers.controller('MenuController', ['$scope', 'Api',
    function ($scope, Api) {
        $scope.loggedIn = false;

        Api.updateAccount = function(){
            if (Api.account.username) {
                $scope.loggedIn = true;
                $scope.fullName = Api.account.fullName;
            }
        }

    }]);