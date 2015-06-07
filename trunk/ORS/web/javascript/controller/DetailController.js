
controllers.controller('DetailController', ['$scope',
    function ($scope) {
        function initialize() {
            var mapOptions = {
                center: {lat: 10.776083, lng: 106.70095},
                zoom: 16
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
        }
        $scope.$on('$viewContentLoaded', function(){
            initialize();
        });
    }]);
