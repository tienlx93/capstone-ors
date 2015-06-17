/**
 * Created by Thành on 12/06/2015.
 */

controllers.controller('RequestRepairController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        Api.getContractById(id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                Api.getOffice(data.officeId, function (data) {
                    if (data == "Error") {
                        $scope.error = true;
                    } else {
                        $scope.officeName = data.name;
                        $scope.amenities = data.amenities;
                    }
                });
            }
        });

        $scope.selection = [];

        // toggle selection for a given fruit by name
        $scope.toggleSelection = function toggleSelection(name) {
            var idx = $scope.selection.indexOf(name);
            if (idx > -1) {
                $scope.selection.splice(idx, 1);
            }
            else {
                $scope.selection.push(name);
            }
        };

        $scope.submit = function($form){
            var amenities = $scope.selection;
            var description = $scope.description;
            Api.requestRepair(id, amenities, description, function(data){
                if (data=="Success") {
                    alert("Gửi yêu cầu thành công");
                    $location.path("/home");
                } else {
                    alert("Có lỗi xảy ra, xin thử lại");
                }
            })
        };


    }]);
