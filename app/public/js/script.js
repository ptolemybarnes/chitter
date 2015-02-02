$(document).ready(function(){
  
  $('#signinform').submit(function( event ) {
    event.preventDefault();

    var name     =     $('#name').val();
    var password = $('#password').val();

    $.post("/api/users/authenticate", {name: name, password: password}, function( data ) {
      $( ".user-message" ).html("Welcome back " + name + "!");
      $('#userservices-bar').css('visibility', 'hidden');
      }, 'json');
  });

  $('#signupbutton').click(function() {
    $('#signupform').css('visibility', 'visible');
  });
});