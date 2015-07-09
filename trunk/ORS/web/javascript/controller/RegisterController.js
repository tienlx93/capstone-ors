/**
 * Created by Thành on 02/07/2015.
 */

controllers.controller('RegisterController', ['$scope', '$location', 'Api', 'toastr',
    function ($scope, $location, Api, toastr ) {
        $scope.register = function (form) {

            if (form.$valid) {
                var username = $scope.username;
                var password = $scope.password;
                var mail = $scope.mail;
                var title = $scope.title;
                var fullname = $scope.fullname;
                var company = $scope.company;
                var phone = $scope.phone;
                var address = $scope.address;
                var birthday = $scope.birthday;


                Api.register(username, password, mail, title, fullname, company, phone, address, birthday, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra. Xin thử lại');
                     //   $scope.error = "Có lỗi xảy ra. Xin thử lại";
                    } else if (data) {
                        $location.path("#/home").replace();
                    }
                });
            }
        }
    }]);