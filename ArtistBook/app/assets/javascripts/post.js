$( document ).ready(function() {
	$.ajaxSetup({
	  headers: {
	    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	  }
	});
	$('.post-apply-button').click(function(){
		var postId = $(this).parent().siblings('.post-partial-post-id').html();
		var bandId = $(this).parent().siblings('.post-partial-band-id').html();
		$.ajax({
		  type: "POST",
		  url: '/responses.json',
		  data: {response: {band_id: bandId, post_id: postId, bus_decision: ''}},
		  success: function(data){
		  	var r = $.parseJSON(data);
		  	console.log(r);
		  },
		  dataType: 'json'
		});
		var parent = $(this).parent();
		$(this).remove();
		parent.append('<button class=\'btn btn-success\'>Already applied!</button>');
	});
});
