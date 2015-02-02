$(document).ready(function(){

  /// SIGN UP

  $('#show_signupform').click(function() {
    $('#signupform').css('visibility', 'visible');
  });

  $('section#signupform').submit(function( event ) {
    event.preventDefault();

    var name     =     $('#name').val();
    var password = $('#password').val();
    var email    = $('#email').val();
    var password_confirmation = $('#password_confirmation').val();

    $.post('/api/users/new', {name: name, email: email, password: password, password_confirmation: password_confirmation}), function( data ) {
      $( ".user-message" ).html("Welcome to Chitter, " + name);
    }
  });
});