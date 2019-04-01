//= require jquery
//= require select2
//= require bootstrap-datepicker/core
//= require datetimepicker
//= require custom
//= require pnotify
//= require jquery_ujs
//= require popper.min
//= require swipe.min
//= require bootstrap.min
//= require turbolinks
//= require cable


function notify(text, type) {
	new PNotify({
		text: text,
		type: type,
		width: '300px',
		min_height: '10px',
		delay: 20000
	});
}
