controllers.controller('DetailController', ['$scope', '$location', '$routeParams', '$route', 'Api',
    function ($scope, $location, $routeParams, $route, Api) {
        var id = $routeParams.id;
        $scope.data = {};

        //get data
        Api.getOffice(id, function (data) {
            if (data == "Error") {
                $scope.error = true;
            } else {
                $scope.officeDetail = data;
                if (data.latitude) {
                    initialize(data.latitude, data.longitude);
                } else {
                    initialize(10.776083, 106.70095);
                }
                for (var i = 0; i < data.images.length; i++) {
                    $scope.addSlide(data.images[i]);
                    //$scope.addSlide('../img/office' + (i+1) + '.jpg');
                }
            }
        });
        function initialize(lat, lng) {
            var mapOptions = {
                center: {lat: lat, lng: lng},
                zoom: 16
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
        }

        $scope.relativeOffices = [];

        Api.getNewOffice(function (data) {
            if (data) {
                for (var i = 0; i < 3; i++) {
                    $scope.relativeOffices[i] = data[i];
                    $scope.relativeOffices[i].description = data[i].description.length > 200 ?
                    data[i].description.substring(0, 200) + "..." : data[i].description;
                }

            }
        });

        $scope.goto = function (officeId) {
            $location.path("/detail/" + officeId);
            window.scroll(0,0);
        };


        $scope.myInterval = 5000;
        var slides = $scope.slides = [];
        $scope.addSlide = function (url) {
            slides.push({
                image: url
            });
        };

    }

]);

