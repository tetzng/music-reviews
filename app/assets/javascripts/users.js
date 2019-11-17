$(document).on('turbolinks:load', function(){
  $('#user_avatar').css({
      'display': 'none'
  }).change(function() {
      var val = $(this).val();
      var path = val.replace(/\\/g, '/');
      var match = path.lastIndexOf('/');
  $('#user_avatar_name').css("display","inline-block");
      $('#user_avatar_name').val(match !== -1 ? val.substring(match + 1) : val);
  });
  $('#user_avatar_name').bind('keyup, keydown, keypress', function() {
    return false;
  });
  $('#user_avatar_name, #btn').click(function() {
    $('#user_avatar').trigger('click');
  });
});
