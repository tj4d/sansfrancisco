// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$( document ).ready(function() {
   
  /* 
  ========= Animate scroll to div =========
  */
   $('.sideNav a').click(function(){
      $('html, body').animate({
          scrollTop: $( $(this).attr('href') ).offset().top - 40
      }, 500);
      return false;
  });
  
  /* 
  ========= Sticky nav =========
  */
  var  mn = $(".sideNav");
    intro = $(".mainContent");
    mns = "sideNav-scrolled";
    fix = "sticky_fix";

  $(window).scroll(function() {
    if( $(this).scrollTop() > 450 ) {
      mn.addClass(mns);
      intro.addClass(fix);
    } else {
      mn.removeClass(mns);
      intro.removeClass(fix);
    }
  });

  /* 
  ========= Changing Theme Color Color =========
  */
  var colors = ['#EDB0B1', '#F8DCB6', '#D9EDB0', '#B0EDB0', '#B0EDD7', '#B0DAED', '#B0B1ED', '#D4B0ED', '#EDB0E1'];
  var random_color = colors[Math.floor(Math.random() * colors.length)];
  $('.announcement').css('background-color', random_color);
  $('.logo').css('text-shadow', '2px 2px' + random_color);
  $('.active-nav').css('border-bottom', '5px solid' + random_color)
});