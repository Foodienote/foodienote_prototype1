
$(document).ready(function() {
	var review_title = $("#review_content_title_counter");
	$("#review_content_title").limiter(150, review_title);
	var review_body = $("#review_content_body_counter");
	$("#review_content_body").limiter(500, review_body);

	// prevent ENTER key
	$('#review_content_title').keypress(function(event) {
		if (event.keyCode == 13) {
    			event.preventDefault();
    		}
	});

});


