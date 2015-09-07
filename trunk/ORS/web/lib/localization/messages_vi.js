(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: VI (Vietnamese; Tiếng Việt)
 */
$.extend($.validator.messages, {
	required: "Mời nhập vào trường này.",
	remote: "Mời sửa cho đúng.",
	email: "Mời nhập email.",
	url: "Mời nhập URL.",
	date: "Mời nhập ngày.",
	dateISO: "Mời nhập ngày (ISO).",
	number: "Mời nhập số.",
	digits: "Mời nhập chữ số.",
	creditcard: "Mời nhập số thẻ tín dụng.",
	equalTo: "Mời nhập thêm lần nữa.",
	extension: "Phần mở rộng không đúng.",
	maxlength: $.validator.format("Mời nhập từ {0} kí tự trở xuống."),
	minlength: $.validator.format("Mời nhập từ {0} kí tự trở lên."),
	rangelength: $.validator.format("Mời nhập từ {0} đến {1} kí tự."),
	range: $.validator.format("Mời nhập từ {0} đến {1}."),
	max: $.validator.format("Mời nhập từ {0} trở xuống."),
	min: $.validator.format("Mời nhập từ {0} trở lên.")
});

}));