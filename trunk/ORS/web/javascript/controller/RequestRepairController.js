/**
 * Created by Thành on 12/06/2015.
 */

controllers.controller('RequestRepairController', ['$scope', '$location', '$routeParams', '$route', 'Api', 'toastr',
    function ($scope, $location, $routeParams, $route, Api, toastr) {
        var id = $routeParams.id;
        $scope.img = {};
        Api.getContractById(id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.officeOwnerName = data.ownerName;
                $scope.officeOwnerPhone = data.ownerPhone;
                Api.getOffice(data.officeId, function (data) {
                    if (data == "Error") {
                        $scope.error = true;
                    } else {
                        $scope.officeName = data.name;
                        $scope.officeAddress = data.address;
                        if (data.amenities.length == 0 ) {
                            $scope.amenities = "Văn phòng này không có thiết bị có thể sửa chữa";
                            $scope.have = false;
                        } else {
                            $scope.amenities = data.amenities;
                            $scope.have = true;
                        }
                        $scope.img = data.images[0];
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

        $scope.submit = function ($form) {
            var amenities = $scope.selection;
            var description = $scope.description;
            var phone = $scope.officeOwnerPhone;
            Api.requestRepair(id, amenities, description, phone, function (data) {
                if (data == "Success") {
                    toastr.success('Đã gửi yêu cầu sửa chữa', 'Thành công');
                    $location.path("/contractList");
                } else if (data == "Error") {
                    toastr.error('Có lỗi xảy ra, xin thử lại');
                    //    alert("Có lỗi xảy ra, xin thử lại");
                } else {
                    toastr.success('Đã gửi yêu cầu sửa chữa', 'Thành công');
                    $location.path("/contractList");
                }
            })
        };


    }]);
