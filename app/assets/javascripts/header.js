$(document).on('turbolinks:load', function(){
  $('#nav-toggle').on('click', function() {
    $('body').toggleClass('open');
  });
});