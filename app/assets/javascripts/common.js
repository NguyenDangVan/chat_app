$(document).on("click", ".col-contact", function(){
  $(".col-contact").removeClass('active');
  $(this).addClass('active');
});

$(document).on("click", ".message", function(){
  $(".message").removeClass('active');
  $(this).addClass('active');
});
