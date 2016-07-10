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

});