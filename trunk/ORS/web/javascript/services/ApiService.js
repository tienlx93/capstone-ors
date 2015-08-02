/**
 * Created by ASUS on 6/14/2015.
 */
app.factory("Api", ['$http',
    function ($http) {
        var services = {};

        services.updateAccount = function() {

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

        services.contractReturn = function (id, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'contractReturn',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.contractExtend = function (id, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'contractExtend',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.register = function (user, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'register',
                    'username': user.username,
                    'password': user.password,
                    'mail': user.mail,
                    'title': user.title,
                    'fullname': user.fullname,
                    'company': user.company,
                    'phone': user.phone,
                    'address': user.address,
                    'birthday': user.birthday.getTime(),
                    'captcha': user.captcha,
                    'captcha3': user.captcha3
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.editProfile = function (data, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'editProfile',
                    'fullName': data.fullName,
                    'company': data.company,
                    'phone': data.phone,
                    'address': data.address,
                    'birthday': data.birthday.getTime()
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.editPass = function (data, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'editPass',
                    'username': data.username,
                    'password': data.password,
                    'newPassword': data.newPassword,
                    'reNewPassword': data.reNewPassword
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Pass Error");
                })
                .error(function () {
                    callback("RePass Error");
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.requestOffice = function (reOffice, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'requestOffice',
                    'category': reOffice.category,
                    'price': reOffice.price,
                    'area': reOffice.area,
                    'district': reOffice.district,
                    'amenityList': reOffice.amenityList
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.checkLogin = function (callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'checkLogin'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.logout = function (callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'logout'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.requestAppointment = function(time, officeId, callback) {
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
        };

        services.getContractList = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getContractList'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getProfile = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getProfile'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getAmenityList = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getAmenityList'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getRepairList = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRepairList',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getRepairHistoryList = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRepairHistoryList',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getAllOfficeRentalList = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getAllOfficeRentalList'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getRentalList = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRentalList',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getRentalListDone = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRentalListDone',
                    'id': id
                }
            })
                .success(function (rentalList) {
                    callback(rentalList);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.searchOfficeByAddress = function(address, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'searchOfficeByAddress',
                    'address': address
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.getNewOffice = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getNewOffice'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.getContractById = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getContractById',
                    'id': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };
        
        services.getOffice = function (officeId, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getOffice',
                    'officeId': officeId
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.requestRental = function (contractId, rentalList, description, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'requestRental',
                    'contractId': contractId,
                    'rentalList': rentalList,
                    'description': description
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.requestRepair = function (contractId, amenities, description, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'requestRepair',
                    'contractId': contractId,
                    'amenities': amenities,
                    'description': description
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.searchOfficeByTerm = function(term, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'matching',
                    'latitude': term.latitude,
                    'longitude': term.longitude,
                    'priceRange': term.priceRange
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.getRelativeOffice = function(id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRelativeOffice',
                    'officeId': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.getResultRequestOffice = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getResultRequestOffice'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.getRequestOffice = function(callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getRequestOffice'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };

        services.unsubscribeRequest = function(id, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'unsubscribeRequest',
                    'requestId': id
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback('Error');
                })
        };
        return services;
    }]);