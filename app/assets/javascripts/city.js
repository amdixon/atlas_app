

  var profileVisible = false;
  
  $('#profile-btn').click( function(){
    if (profileVisible){
      $('#profile').hide('slide', {direction: "left"}, 400 );
      profileVisible = false;
    } else {
      $('#profile').show('slide', {direction: "left"}, 400 );
      profileVisible = true;
    }
    
  });
  
