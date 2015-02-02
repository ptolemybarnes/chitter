$(document).ready(function(){

  /// SIGN UP
  alert("jQuery Loaded");

  $('form#signupform').submit(function( event ) {
    event.preventDefault();

    var name     = $('#signupform #name').val();
    var password = $('#signupform #password').val();
    var email    = $('#signupform #email').val();
    var password_confirmation = $('#password_confirmation').val();

    alert(name)

    $.post('/api/users', {name: name, email: email, password: password, password_confirmation: password_confirmation}, function( data ) {
      $( "div.user-messages" ).html("<p>Welcome to Chitter, " + name + "</p>");
    });
  });

  $('form#signinform').submit(function( event ) {
    event.preventDefault();


    var name     = $('#signinform #name').val();
    var password = $('#signinform #password').val();

    $.post('/api/users/authenticate', {name: name, password: password}, function( data ) {
      $( "div.user-messages" ).html("<p>You are signed in as " + name + " </p>");
    });
  });

});