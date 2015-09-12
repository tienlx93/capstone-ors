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
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.getCurrentTime = function (callback) {
            $http({
                method: 'GET',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'getCurrentTime'
                }
            })
                .success(function (data) {
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
                    callback(data);
                })
                .error(function () {
                    callback("Error");
                })
        };

        services.changeStatus = function (type, id, status, callback, comment) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'changeStatus',
                    'type': type,
                    'id': id,
                    'status': status,
                    'comment': comment
                }
            })
                .success(function (data) {
                    callback(data);
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