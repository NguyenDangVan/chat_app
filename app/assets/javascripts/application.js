//= require jquery
//= require jquery_ujs
//= require cable
//= require jquery-slim.min
//= require bootstrap.min
//= require swipe.min
//= require popper.min



$('document').ready(function(){
  $('#show_mess').on('click', function() {
    $('.material-icons').removeClass('active');
    $('#show_mess').find('.material-icons').addClass('active');
  });
});
