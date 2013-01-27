jQuery ->
  new PhotoCropper()

class PhotoCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1/1,
      setSelect: [0, 0, 150, 150],
      onSelect: @update,
      onChange: @update,
	  minSize: [150, 150]
  
  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
  	$('#preview').css
  		width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
  		height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
  		marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
  		marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'