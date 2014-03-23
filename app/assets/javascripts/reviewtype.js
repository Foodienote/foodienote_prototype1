function getReviewTypeIndexSelected() {
	var url = window.location + '';
	var params = url.substring(url.indexOf('?') + 1).split('&');
	var index = -1;
	for (var i = 0; i < params.length; i++) {
		if (params[i].indexOf('index=') == 0) {
			var index = params[i].replace('index=','');
			$('#reviewtype' + index).hide();
			$('#reviewtype' + index + '_bigger').show();
		}
	}
	return index;
}
	
/*
$(function() {
  $(".reviewtypes_clip_container").mouseover(function() {
	  $(this).find(".reviewtype_bigger").show();
	  $(this).find(".reviewtype_icons").hide();
	  })
  .mouseout(function() {
		if ($(this).prop('id').indexOf(index) == -1) {
		  $(this).find(".reviewtype_bigger").hide();
    		$(this).find(".reviewtype_icons").show();
		}
});
});
*/
