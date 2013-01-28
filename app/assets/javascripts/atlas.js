// sets default css properties for the input titles a.k.a the watermarks
$.watermarker.setDefaults({left: -3});


var profileVisible = false;

$('#profile-click').click( function(){
  if (profileVisible){
    $('#profile').hide('slide', {direction: "left"}, 400 );
    profileVisible = false;
  } else {
    $('#profile').show('slide', {direction: "left"}, 400 );
    profileVisible = true;
  }
  
});

//erase footer search bar autofill
$('#again').val('')

//masonry loader
var masonryContent = $('#tumblelog')


$(masonryContent).imagesLoaded( function(){
    $(masonryContent).masonry({
	columnWidth: 240,
	isAnimated: true,
    })
})


/////// LOAD WHEN DOCUMENT READY /////////////
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
  
  
    
})//// document ready ////
