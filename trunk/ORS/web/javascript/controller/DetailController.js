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
                for (var i = 0; i < data.images.length; i ++) {
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


        /*$scope.$on('$viewContentLoaded', function () {
            initialize(10.776083, 106.70095);
        });*/

       /* $scope.amenities = [
            {amenityName: 'Telephone answering'},
            {amenityName: 'Air-conditioning'},
            {amenityName: 'Security system'},
            {amenityName: 'Meeting rooms'},
            {amenityName: 'Videoconferencing'},
            {amenityName: 'Reception services'},
            {amenityName: 'IT support'},
            {amenityName: 'AV equipment'}
        ];*/


        $scope.myInterval = 5000;
        var slides = $scope.slides = [];
        $scope.addSlide = function(url) {
            var newWidth = slides.length + 1;
            slides.push({
                image: url
                /*text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
                ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]*/
            });
        };
        /*for (var i=0; i<4; i++) {
            $scope.addSlide('../img/office' + 1 + '.jpg');
        }*/
    }

]);

