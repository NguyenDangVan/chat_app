$(document).on("click", ".col-contact", function(){
  $(".col-contact").removeClass('active');
  $(this).addClass('active');
});

$(document).on("click", ".message", function(){
  $(".message").removeClass('active');
  $(this).addClass('active');
});

$(document).ready(function(){
  var a = $('.contact-content');
  a.css("overflow","hidden");
  a.mouseout(function(){
    a.css("overflow", "hidden");
  });
  a.mousemove(function(){
    a.css("overflow", "auto");
  });
});
