var ready = function(){
	var form_class_name = 'post-reply-form';
	var reply_link_class_name = 'reply-link';

	$('.reply-link').on('click', function() {
		var id = this.id;
		console.log(id);
		$('#'+id+'.post-reply-form').toggle();
	});
};

$(document).ready(ready);