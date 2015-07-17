/**
 * Created by ASUS on 6/11/2015.
 */
app.factory("Api", ['$http',
    function ($http) {
        var services = {};

        services.login = function (username, password, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'login',
                    'username': username,
                    'password': password,
                    'type': 3
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getList = function (type, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'listMobile',
                    'type': type
                }
            })
                .success(function (data) {
                    for (var i = 0; i < data.length; i++) {
                        if (type == 'appointment') {
                            data[i].statusName = APPOINTMENT_STATUS[data[i].status - 1].name;
                        } else {
                            data[i].statusName = REPAIR_STATUS[data[i].status - 1].name;
                        }
                    }

                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };


        services.getDetail = function (type, id, callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'detailMobile',
                    'type': type,
                    'id': id
                }
            })
                .success(function (data) {
                    if (type == 'appointment') {
                        data.statusClass = APPOINTMENT_STATUS[data.status - 1].name;
                        data.statusName = APPOINTMENT_STATUS[data.status - 1].description;
                    } else {
                        data.statusClass = REPAIR_STATUS[data.status - 1].name;
                        data.statusName = REPAIR_STATUS[data.status - 1].description;
                    }

                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.changeStatus = function (type, id, status, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'changeStatus',
                    'type': type,
                    'id': id,
                    'status': status
                }
            })
                .success(function () {
                    callback("Success");
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.countAssigned = function (callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'countAssigned'
                }
            })
                .success(function (data) {
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                });
        };

        return services;
    }]);