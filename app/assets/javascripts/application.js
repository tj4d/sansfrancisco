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

/* 
========= Animate scroll to div =========
*/
function scrollToDiv(){
  $('.sideNav a').click(function(){
    $('html, body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top - 40
    }, 500);
    return false;
  });
}

/* 
========= Sticky nav =========
*/
function stickyNav(){
  var fixedDiv = $('.sideNav');
  var startFixed = fixedDiv.offset().top - 75;                  // get initial position of the element
  $(window).scroll(function() {                                 // assign scroll event listener
      var currentScroll = $(window).scrollTop();                // get current position

      if (currentScroll >= startFixed) {                        // apply position: fixed if you
          $('.sideNav').addClass('sideNav-scrolled');
      } else {                                                  // apply position: static
          $('.sideNav').removeClass('sideNav-scrolled');        // if you scroll above it
      }
  });
}

/* 
========= Changing Theme Color Color =========
*/
function themeColor(){
  var colors = ['#EDB0B1', '#F8DCB6', '#D9EDB0', '#B0EDB0', '#B0EDD7', '#B0DAED', '#B0B1ED', '#D4B0ED', '#EDB0E1'];
  var random_color = colors[Math.floor(Math.random() * colors.length)];
  $('.announcement').css('background-color', random_color);
  $('.logo').css('text-shadow', '2px 2px' + random_color);
  $('.activeNav').css('border-bottom', '5px solid' + random_color);
  $('.overlay').css('background-color', random_color);
  if ($(window).width() <= 479){
    $('.header').css('border-bottom', '2px solid' + random_color);
  }
  $('.activeTab').css('border-bottom', '5px solid' + random_color);
}

/* 
========= Mobile Nav Overlay =========
*/
function navOverlay(){
  $( ".hamburger" ).click(function() {
    $( ".overlay" ).css('height', '100vh');
    $( "body" ).css('overflow-y', 'hidden');
  });

  $( ".cross" ).click(function() {
    $( ".overlay" ).css('height', '0');
    $( "body" ).css('overflow-y', 'visible');
  });
}

/* 
========= Mobile Nav Overlay =========
*/
function newsletterModal(){
  $("#headerNewsletterButton").click(function(){
    $('.small.modal')
      .modal('show')
    ;
  })
}

