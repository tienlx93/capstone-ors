/**
 * Created by Thành on 12/06/2015.
 */

controllers.controller('RequestRepairController', ['$scope',
    function ($scope) {
        $scope.officeName = "Tân Sơn"; //dựa vào contract để lấy officeName
        $scope.assignedStaff = "staff1";
        $scope.description = "Sửa quạt";
        $scope.repairStatusId = "1";
        $scope.amenities = [
            {option: 'Ổ cắm điện'},
            {option: 'Máy lạnh'},
            {option: 'Wi-fi'},
            {option: 'Điện thoại trả lời tự động'}

        ]
    }]);
