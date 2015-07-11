/**
 * Created by Thành on 10/07/2015.
 */

controllers.controller('ProfileDetailController', ['$scope', '$location', '$routeParams', '$route', 'toastr', 'Api',
    function ($scope, $location, $routeParams, $route, toastr, Api) {

        Api.getProfile(function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.data = data;
                $scope.data.birthday = new Date($scope.data.birthday);
            }
        });

        $scope.phoneNumberPattern = (function() {
            var regexp = /^\(?(\d{3})\)?[ .-]?(\d{3})[ .-]?(\d{4})$/;
            return {
                test: function(value) {
                    if( $scope.requireTel === false ) {
                        return true;
                    }
                    return regexp.test(value);
                }
            };
        });

        $scope.editProfile = function (form) {
            if (form.$valid) {

                Api.editProfile($scope.data, function (data) {
                    if (data == "Error") {
                        toastr.error('Có lỗi xảy ra, xin thử lại', 'Không thành công');

                    } else if (data) {
                        $location.path("/profile");
                    }
                });
            }
        }

    }]);