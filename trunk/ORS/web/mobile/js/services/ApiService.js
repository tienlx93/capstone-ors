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
                    'password': password
                }
            })
                .success(function (data) {
                    callback("Success");
                })
                .error(function () {
                    callback("Error");
                })
        };

        var appointmentList = [{
            'id': 1,
            'officeName': 'Văn phòng 1',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Ông Nguyễn Văn A',
            'date': '12/03/2015',
            'status': 2
        }, {
            'id': 2,
            'officeName': 'Văn phòng 2',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Ông Nguyễn Văn A',
            'date': '12/03/2015',
            'status': 3
        }, {
            'id': 3,
            'officeName': 'Văn phòng 3',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Ông Nguyễn Văn A',
            'date': '12/03/2015',
            'status': 4
        }, {
            'id': 4,
            'officeName': 'Văn phòng 4',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Ông Nguyễn Văn A',
            'date': '12/03/2015',
            'status': 5
        }, {
            'id': 5,
            'officeName': 'Văn phòng 5',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Ông Nguyễn Văn A',
            'date': '12/03/2015',
            'status': 5
        }];

        var rentalList = [{
            'id': 1,
            'officeName': 'Văn phòng 1',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'detail': 'Sửa ống nước',
            'date': '12/03/2015',
            'status': 2
        }];
        var repairList = [];

        var appointmentDetail = {
            'id':1,
            'officeName': 'Văn phòng 1',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'latitude': 10.8023066,
            'longitude': 106.7149526,
            'customerName': 'Ông Nguyễn Văn A',
            'detail': '',
            'date': '12/03/2015',
            'status': 2
        };
        var repairDetail = {
            'id':1,
            'officeName': 'Văn phòng 1',
            'address': 'Địa chỉ 1, đường Quang Trung, quận 12, TP Hồ Chí Minh',
            'latitude': 10.8023066,
            'longitude': 106.7149526,
            'customerName': 'Ông Nguyễn Văn A',
            'detail': 'Sửa ống nước',
            'date': '12/03/2015',
            'status': 2,
            'list': ['Ống nước', 'Máy lạnh']
        };
        var rentalDetail = {};


        services.getAppointmentList = function (callback) {
            for (var i = 0; i < appointmentList.length; i++) {
                appointmentList[i].statusName = APPOINTMENT_STATUS[appointmentList[i].status - 1].name;
            }
            callback(appointmentList);
        };

        services.getRepairList = function (callback) {
            for (var i = 0; i < repairList.length; i++) {
                repairList[i].statusName = REPAIR_STATUS[repairList[i].status - 1].name;
            }
            callback(repairList);
        };

        services.getRentalList = function (callback) {
            for (var i = 0; i < rentalList.length; i++) {
                rentalList[i].statusName = REPAIR_STATUS[rentalList[i].status - 1].name;
            }
            callback(rentalList);
        };

        services.getAppointmentDetail = function (id, callback) {
            appointmentDetail.statusName= APPOINTMENT_STATUS[appointmentDetail.status - 1].description;
            appointmentDetail.statusClass= APPOINTMENT_STATUS[appointmentDetail.status - 1].name;
            callback(appointmentDetail);
        };

        services.getRentalDetail = function (id, callback) {
            rentalDetail.statusName= REPAIR_STATUS[rentalDetail.status - 1].description;
            rentalDetail.statusClass= REPAIR_STATUS[rentalDetail.status - 1].name;
            callback(rentalDetail);
        };

        services.getRepairDetail = function (id, callback) {
            repairDetail.statusName= REPAIR_STATUS[repairDetail.status - 1].description;
            repairDetail.statusClass= REPAIR_STATUS[repairDetail.status - 1].name;
            callback(repairDetail);
        };

        services.changeStatus = function (func, id, status, callback) {
            $http({
                method: 'POST',
                url: BACK_END_URL + '/api',
                params: {
                    'action': 'changeStatus',
                    'func': func,
                    'id': id,
                    'status': status
                }
            })
                .success(function () {
                    appointmentDetail.status = status;
                    repairDetail.status = status;
                    callback("Success");
                })
                .error(function () {
                    callback("Error");
                })
        };

        return services;
    }]);