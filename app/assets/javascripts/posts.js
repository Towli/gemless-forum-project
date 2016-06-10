$(document).ready(function() {
	$(".reply-link").click(function() {
		var id = $(this).attr('id');
		$("#"+id+".post-reply-form").toggle();
	});
});