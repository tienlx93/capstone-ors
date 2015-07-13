controllers.controller('OfficeListController', ['$scope', '$location', 'Api', '$routeParams',
    function ($scope, $location, Api, $routeParams) {
        var url = $routeParams.query;
        var getParameterValue = function (url, parameter) {
            var index = url.lastIndexOf(parameter);
            var cut = index >= 0 ? url.substring(index + parameter.length+1) : "";
            return cut != "" ? cut.substring(0, cut.indexOf("&") >= 0 ? cut.indexOf("&") : cut.length) : "";
        };
        var searchTerm = {
            'latitude': getParameterValue(url, "latitude"),
            'longitude': getParameterValue(url, "longitude"),
            'priceRange': getParameterValue(url, "priceRange")
        };

        $scope.searchOffice = function (searchTerm) {
            Api.searchOfficeByTerm(searchTerm, function (data) {
                if (data) {
                    $scope.listSearchedOffice = data;
                    for (var i = 0; i < $scope.listSearchedOffice.length; i++) {
                        $scope.listSearchedOffice[i].description = $scope.listSearchedOffice[i].description.length > 200 ?
                        $scope.listSearchedOffice[i].description.substring(0, 200) + "..." : $scope.listSearchedOffice[i].description;
                    }
                }
            });
        };

        $scope.searchOffice(searchTerm);
    }]);
