/**
 * Created by ASUS on 6/15/2015.
 */
controllers.controller('MenuController', ['$scope', '$rootScope', '$location', 'Api', '$modal',
    function ($scope, $rootScope, $location, Api, $modal) {
        $rootScope.isLogin = false;

        $scope.logout = function () {
            Api.logout(function (data) {
                if (data && data != "Error") {
                    Api.account = {};
                    $scope.fullName = "";
                    $rootScope.isLogin = false;
                    $location.path("/home");
                }
            });
        };

        Api.checkLogin(function (data) {
            if (data && data != "Error") {
                Api.account.username = data[0];
                Api.account.fullName = data[1];
                Api.updateAccount();
            } else {
                if (localStorage.getItem("username")) {
                    var username = localStorage.getItem("username");
                    var password = localStorage.getItem("password");
                    Api.login(username, password, function (data) {
                        if (data == "Error" || data == "Wrong") {
                            //toastr.error('Tên đăng nhập hoặc mật khẩu không chính xác, xin thử lại');
                        } else if (data) {
                            Api.account.username = username;
                            Api.account.fullName = data;
                            Api.updateAccount();
                        }
                    });
                }
            }
        });

        Api.updateAccount = function () {
            if (Api.account.username) {
                $rootScope.isLogin = true;
                $scope.fullName = Api.account.fullName;
                Api.getContractList(function (data) {
                    if (data!= "Error" && data!= "Wrong") {
                        $scope.hasContract = true;
                    } else {
                        Api.getRequestOffice(function (data) {
                            if (data.length && data.length > 0) {
                                $scope.hasRequest = data.length && data.length > 0;
                                Api.getResultRequestOffice(function (d) {
                                    $scope.hasRequestResult = d.length && d.length > 0;
                                });
                            }
                        });
                    }
                });


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
        $scope.hasContract = false;

        $scope.hasRequest = false;
        $scope.hasRequestResult = false;


    }]);