/*
	Created: Henry Karagory 04/12/2018
		- This file contains javascript for pages related to posts.

	MODIFIED: 04/13/2018 Henry Karagory and David Levine
		-Updated postId and bandId so that they no longer would
		access parent to get the html
*/

/*
	CREATED: Henry Karagory 04/14/2018 
*/
function updateResponse(responseId, bandId, postId, bus_decision){
	$.ajax({
		  type: "PATCH",
		  url: '/responses/' + responseId + '.json',
		  data: {response: {band_id: bandId, post_id: postId, bus_decision: bus_decision}},
		  success: function(data){
		  	if(data.status == "decided"){
		  		alert("You already made a decision for that post!");
		  	}
		  },
		  dataType: 'json'
	});
}


$( document ).ready(function() {
	$.ajaxSetup({
	  headers: {
	    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	  }
	});

	$('.post-apply-button').click(function(){
		var postId = $(this).siblings('.post-partial-post-id').html();
		var bandId = $(this).siblings('.post-partial-band-id').html();
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
		parent.append('<button class=\'btn btn-success\'>Applied!</button>');
	});

	// Accept a band response and decline all others on the posts/# page 
	$('.accept-band-response-button').click(function(){
		// Get the ids needed to update the response
		var responseId = $(this).siblings('.band-partial-response-id').html();
		var bandId = $(this).siblings('.band-partial-band-id').html();
		var postId = $(this).siblings('.band-partial-post-id').html();
		
		// Accept the response
		updateResponse(responseId, bandId, postId, 'accept');

		// Replace the accept and decline buttons with an accepted button
		var parent = $(this).parent();
		$(this).siblings('.decline-band-response-button').remove();
		$(this).remove();
		parent.append('<button class=\'btn btn-success\'>Accepted!</button>');

		// Decline all other requests on the page
		$('.cards .decline-band-response-button').each(function(index){
			var responseId = $(this).siblings('.band-partial-response-id').html();
			var bandId = $(this).siblings('.band-partial-band-id').html();
			var postId = $(this).siblings('.band-partial-post-id').html();

			setTimeout(function(){
				updateResponse(responseId, bandId, postId, 'decline');
			}, 500*index);

			var parent = $(this).parent();
			$(this).siblings('.accept-band-response-button').remove();
			$(this).remove();
			parent.append('<button class=\'btn btn-danger\'>Declined!</button>');
		});
	});

	// Decline a band response on the posts/# page
	$('.decline-band-response-button').click(function(){
		// Get the ids needed to update the response
		var responseId = $(this).siblings('.band-partial-response-id').html();
		var bandId = $(this).siblings('band-partial-band-id').html();
		var postId = $(this).siblings('band-partial-post-id').html();
		
		// Decline the response
		updateResponse(responseId, bandId, postId, 'decline');
		
		// Replace accept and decline buttons with a declined button
		var parent = $(this).parent();
		$(this).siblings('.accept-band-response-button').remove();
		$(this).remove();
		parent.append('<button class=\'btn btn-danger\'>Declined</button>');
	});
});
