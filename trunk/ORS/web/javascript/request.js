/**
 * Created by ASUS on 6/7/2015.
 */
function changePage() {
    $("#info").hide();

    $("#appointment").show();
}
function login() {
    changePage();
}

function register(){
    var pass = window.prompt("Xin xác nhận lại mật khẩu");
    changePage();
}
function back() {
    $("#info").show();
    $("#appointment").hide();
}