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

        $scope.$on('$viewContentLoaded', function () {
            initialize();
        });
        $scope.officeDetail =
        {
            'amenity': ['Telephone answering', 'Air-conditioning', 'Security system', 'Meeting rooms', 'IT support', 'Reception services', 'AV equipment', 'Videoconferencing'],
            'name': 'Office Space: Le Thanh Ton, District 1, Ho Chi Minh',
            'price': '₫20580000',
            'title': ['Serviced Offices From', 'Request', 'The space', 'Location'],
            'unit': ['per month', 'per person', 'Shared / Coworking Office Spaces From ₫6300000 per person per month', 'The estimated price of this office can be affected by a number of factors including the amount of space needed, length of contract and move-in date.'],
            'intro': ['This serviced office is located in a prestigious building, which contains office facilities, a shopping mall and restaurant district, and a luxurious condominium.',
                'This facility can easily assist expanding businesses and has other locations in Asia which can be used during business trips and global expansion. Staff are multilingual and can speak Vietnamese, English, and Japanese fluently, so a translation/interpretation service is also available at this facility.']


        }
    },


]);
