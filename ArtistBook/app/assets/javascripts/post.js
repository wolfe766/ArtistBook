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
		  	if(data.status == "applied"){
		  		alert("You already applied to that post!");
		  	}
		  },
		  dataType: 'json'
		});
		// Remove the aply button, replace with green success button.
		var parent = $(this).parent();
		$(this).remove();
		parent.append('<button class=\'btn btn-success\'>Already applied!</button>');
	});
});
