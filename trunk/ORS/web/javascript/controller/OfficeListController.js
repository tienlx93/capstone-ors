controllers.controller('OfficeListController', ['$scope', '$rootScope', '$location', 'Api', '$routeParams',
    function ($scope, $rootScope, $location, Api, $routeParams) {
        $scope.currentPage = 1;
        $scope.numPerPage = 5;
        $scope.maxSize = 5;
        $scope.filteredOffices = [];
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
            'priceRange': getParameterValue(url, "priceRange"),
            'district': getParameterValue(url, "district")
        };
        $scope.searchKey = getParameterValue(url, "searchKey");
        $scope.price = getParameterValue(url, "price");

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
            if ($scope.searchTerm.latitude) {
                $location.path("/list/latitude=" + $scope.searchTerm.latitude
                + "&longitude=" + $scope.searchTerm.longitude
                + "&priceRange=" + $scope.searchTerm.priceRange
                + "&price=" + $scope.price
                + "&district=" + $scope.searchTerm.district
                + "&searchKey=" + $scope.searchKey);
            } else {
            }
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
                    /*$rootScope.q = [];
                     for (var j = 0; j < $rootScope.amenityWeight.length; j ++) {
                     $rootScope.q.push(false);
                     }*/
                }
            });
        };
        $scope.searchOffice();

        function filter(selected) {
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
                        for (var k = 0; k < $rootScope.q.length; k++) {
                            if ($rootScope.q[k] == true) {
                                var nearest = closest($rootScope.amenityWeight[k], officeAmenity);
                                if (nearest >= 0) {
                                    var distance = Math.abs(nearest - $rootScope.amenityWeight[k].weight);
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
        }

        $scope.$watch(function () {
            if ($scope.officeList && $scope.officeList.length > 0 && $rootScope.q) {
                var selected = 0;
                for (var i = 0; i < $rootScope.q.length; i++) {
                    if ($rootScope.q[i] == true) {
                        selected++;
                    }
                }
                return selected;
            }
        }, function (selected) {
            filter(selected);
        });

        if (!$rootScope.amenityWeight || !$rootScope.q || $rootScope.amenityWeight.length == 0 || $rootScope.q.length == 0) {
            $rootScope.amenityWeight = [];
            Api.amenityWeight(function (data) {
                $rootScope.amenityWeight = data;
                if (!$rootScope.q || $rootScope.q.length == 0) {
                    $rootScope.q = [];
                    for (var i = 0; i < data.length; i++) {
                        $rootScope.q.push(false);
                    }
                }
            });
        }

        $scope.$watch(function () {
            if ($scope.filter) {
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

        $scope.$watch('price', function(price) {
            if (!price || price < 100000) {
                $scope.searchTerm.priceRange = 0;
            } else if (price < 200000) {
                $scope.searchTerm.priceRange = 1;
            } else if (price < 300000) {
                $scope.searchTerm.priceRange = 2;
            } else if (price < 400000) {
                $scope.searchTerm.priceRange = 3;
            } else if (price < 500000) {
                $scope.searchTerm.priceRange = 4;
            } else {
                $scope.searchTerm.priceRange = 5;
            }
        });

        $scope.requestOffice = function() {
            var amenities = "";
            for (var k = 0; k < $rootScope.q.length; k++) {
                if ($rootScope.q[k] == true) {
                    amenities += ($rootScope.amenityWeight[k].amenity + ",");
                }
            }
            $location.path("/requestOffice/"
            + "district=" + $scope.searchTerm.district
            + "&price=" + $scope.price
            + "&amenities=" + amenities);
        }

    }]);
