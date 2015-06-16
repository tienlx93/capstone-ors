/**
 * Created by ASUS on 6/14/2015.
 */
app.factory("Api", ['$http',
    function ($http) {
        var services = {};

        services.updateAccount = function () {

        };
        services.account = {};

        services.login = function (username, password, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'login',
                    'username': username,
                    'password': password
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.requestAppointment = function (time, officeId, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'requestAppointment',
                    'time': time,
                    'officeId': officeId
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        }

        services.getContractList = function (contractId, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getContractList',
                    'contractId': contractId
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };
        services.getOffice = function (officeId, name, description, priceTerm, floorNumber, area,
                                       address, latitude, longitude, category, amenities, images, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getOffice',
                    'OfficeId': officeId,
                    'Name': name,
                    'Description': description,
                    'PriceTerm': priceTerm,
                    'floorNumber': floorNumber,
                    'area': area,
                    'address': address,
                    'latitude': latitude,
                    'longitude': longitude,
                    'category': category,
                    'amenities': amenities,
                    'images': images

                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };
        return services;
    }]);