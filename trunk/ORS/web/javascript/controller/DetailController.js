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

        $scope.amenities = [
            {amenityName: 'Telephone answering'},
            {amenityName: 'Air-conditioning'},
            {amenityName: 'Security system'},
            {amenityName: 'Meeting rooms'},
            {amenityName: 'Videoconferencing'},
            {amenityName: 'Reception services'},
            {amenityName: 'IT support'},
            {amenityName: 'AV equipment'}
        ];

        $scope.officeDetail =
        {
            'name': 'Văn phòng Ali',
            'price': '20580000 VNĐ',
            'priceTerm': 'Trên m2',
            'floorNumber' : '1',
            'area': '1000',
            'address': '12 Trần Hưng Đạo, Quận 1, HCM',
            'category': 'Tòa nhà văn phòng',
            'status': 'Chưa đặt',
            'description': 'This serviced office is located in a prestigious building, which contains office facilities, a shopping mall and restaurant district, and a luxurious condominium. This facility can easily assist expanding businesses and has other locations in Asia which can be used during business trips and global expansion. Staff are multilingual and can speak Vietnamese, English, and Japanese fluently, so a translation/interpretation service is also available at this facility.'
        };

        $scope.myInterval = 5000;
        var slides = $scope.slides = [];
        $scope.addSlide = function() {
            var newWidth = slides.length + 1;
            slides.push({
                image: '../img/office' + newWidth + '.jpg'
                /*text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
                ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]*/
            });
        };
        for (var i=0; i<4; i++) {
            $scope.addSlide();
        }
    }

]);

