$( document ).on('turbolinks:load', function() {
  $('.alert').fadeOut(6000);
});

function notify(text, type){
  new PNotify({
    text: text,
    type: type,
    width: '300px',
    min_height: '10px',
    delay: 2000
  });
}
