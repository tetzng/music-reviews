$(document).on('turbolinks:load', function(){
  $('#write-review').on('click', function() {
    $('body').addClass('write');
  });

  $('#write-review-not-login').on('click', function() {
    $('body').addClass('write');
  });

  $('#close-review-form').on('click', function() {
    $('body').removeClass('write');
  });

  $('#checked-rate input[name="rate"]').on('change', function(){
    let rateNum = $(this).val();
    console.log(rateNum);
    $("#rate_view").html(rateNum);
  });
});