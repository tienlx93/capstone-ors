controllers.controller('OfficeListController', ['$scope', '$location', 'Api', '$routeParams',
    function ($scope, $location, Api, $routeParams) {
        $scope.currentPage = 1;
        $scope.numPerPage = 5;
        $scope.maxSize = 5;
        $scope.q = [];
        $scope.filteredOffices = [];
        $scope.amenityWeight = [];
        $scope.filter = [];
        $scope.isCollapsed = true;
        var url = $routeParams.query;
        var getParameterValue = function (url, parameter) {
            var index = url.lastIndexOf(parameter);
            var cut = index >= 0 ? url.substring(index + parameter.length + 1) : "";
            return cut != "" ? cut.substring(0, cut.indexOf("&") >= 0 ? cut.indexOf("&") : cut.length) : "";
        };
        $scope.searchTerm = {
            'latitude': getParameterValue(url, "latitude"),
            'longitude': getParameterValue(url, "longitude"),
            'priceRange': getParameterValue(url, "priceRange")
        };


        function closest(num, arr) {
            var match = [];
            for (var i = 0; i < arr.length; i++) {
                if (arr[i].group && num.group == arr[i].group) {
                    match.push(arr[i]);
                }
            }
            if (match.length == 0) {
                return -1;
            }
            var curr = match[0];
            var diff = Math.abs(num.weight - curr.weight);
            for (var val = 0; val < match.length; val++) {
                var newdiff = Math.abs(num.weight - match[val].weight);
                if (newdiff < diff) {
                    diff = newdiff;
                    curr = arr[val];
                }
            }
            return curr.weight;
        }

        $scope.searchOffice = function () {
            Api.searchOfficeByTerm($scope.searchTerm, function (data) {
                if (data) {
                    $scope.officeList = data;
                    for (var i = 0; i < $scope.officeList.length; i++) {
                        $scope.officeList[i].description = $scope.officeList[i].description.length > 200 ?
                        $scope.officeList[i].description.substring(0, 200) + "..." : $scope.officeList[i].description;
                    }
                    $scope.filter = $scope.officeList;
                    $scope.totalItems = $scope.filter.length;
                    updatePage();
                    $scope.q = [];
                    for (var j = 0; j < $scope.amenityWeight.length; j ++) {
                        $scope.q.push(false);
                    }
                }
            });
        };

        $scope.$watch(function () {
            if ($scope.officeList && $scope.officeList.length > 0) {
                var selected = 0;
                for (var i = 0; i < $scope.q.length; i++) {
                    if ($scope.q[i] == true) {
                        selected++;
                    }
                }
                return selected;
            }
        }, function (selected) {
            $scope.filter = [];
            var matching = selected * 100;
            var matchingPoint;
            if (matching == 0) {
                $scope.filter = $scope.officeList;
            } else {
                if ($scope.officeList) {
                    for (var i = 0; i < $scope.officeList.length; i++) {
                        matchingPoint = 0;
                        var officeAmenity = $scope.officeList[i].amenityJSON;
                        for (var k = 0; k < $scope.q.length; k++) {
                            if ($scope.q[k] == true) {
                                var nearest = closest($scope.amenityWeight[k], officeAmenity);
                                if (nearest >= 0) {
                                    var distance = Math.abs(nearest - $scope.amenityWeight[k].weight);
                                    var point = 0;
                                    if (distance > 2) {
                                        point = 0;
                                    } else if (distance == 2) {
                                        point = 50;
                                    } else if (distance == 1) {
                                        point = 80;
                                    } else {
                                        point = 100;
                                    }
                                } else {
                                    point = 0;
                                }
                                matchingPoint += point;
                            }
                        }
                        if (matchingPoint / matching > 0.7) {
                            $scope.filter.push($scope.officeList[i]);
                        }
                    }
                }
            }
            $scope.totalItems = $scope.filter.length;
        });

        Api.amenityWeight(function (data) {
            $scope.amenityWeight = data;
            $scope.q = [];
            for (var i = 0; i < data.length; i ++) {
                $scope.q.push(false);
            }
        });

        $scope.$watch(function () {
            if($scope.filter) {
                return $scope.currentPage + $scope.numPerPage + $scope.filter.length;
            }
        }, function () {
            updatePage();
        });
        function updatePage() {
            var begin = (($scope.currentPage - 1) * $scope.numPerPage);
            var end = begin + $scope.numPerPage;
            $scope.filteredOffices = $scope.filter.slice(begin, end);
        }

        $scope.searchOffice();
    }]);
