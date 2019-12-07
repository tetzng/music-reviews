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
    const rateNum = $(this).val();
    $("#rate_view").html(rateNum);
  });

  $('#checked-rate-edit input[name="review[rate]"]').on('change', function(){
    const rateNum = $(this).val();
    $("#rate_view").html(rateNum);
  });

  if(document.URL.match(/reviews/) && document.URL.match(/edit/)) {
    $(document).ready(function(){
      const rateValue = $('#checked-rate-edit').data('rate-value');
      $(`input[value="${rateValue}"]`).prop('checked', true);
      $("#rate_view").html(rateValue);
    });
  }
});