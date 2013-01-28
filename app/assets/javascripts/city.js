
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

//erase search bar autofill
$('#again').val('')


$(document).ready( function(){

  //main page autocomplete
  $('#search').autocomplete({
    source: "/search_suggestions",
    delay: 100,
    minLength: 2,
  })
  $('#again').autocomplete({
    source: "/search_suggestions",
    delay: 100,
    minLength: 2,
    position: { my: "left bottom", at: "left top"}
  })
  
  
  $('#content').fadeIn(1000)
  
  
  setTimeout( function(){
    $('#search').focus();
  }, 600)
  
  
  
  
    
  
})
