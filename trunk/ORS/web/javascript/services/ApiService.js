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
        return services;
    }]);