/*
	Created: Henry Karagory 04/12/2018
		- This file contains javascript for pages related to business requests
*/


$( document ).ready(function() {
	$.ajaxSetup({
	  headers: {
	    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	  }
	});

	$('.accept-business-request-button').click(function(){
		var containingCard = $(this).closest('.card');
		var requestId = $(this).siblings('.request-partial-request-id').html();
		var bandId = $(this).siblings('.request-partial-band-id').html();
		var businessId = $(this).siblings('.request-partial-business-id').html();
		var pay = containingCard.find('request-pay').html();
		var time = containingCard.find('request-time').html();
		var date = containingCard.find('request-date').html();
		var location = containingCard.find('request-location').html();
		var message = containingCard.find('request-message').html();
		
		var business_request = {
			band_id: bandId,
			business_id: businessId,
			pay: pay,
			time: time,
			location: location,
			message: message,
			band_decision: "true"
		}

		$.ajax({
		  type: "PATCH",
		  url: '/business_requests/' + requestId + '.json',
		  data: {business_request: business_request},
		  success: function(data){
		  	if(data.status == "accepted"){
		  		alert("You already accepted that job!");
		  	}
		  },
		  dataType: 'json'
		});
		// Remove the aply button, replace with green success button.
		var parent = $(this).parent();
		$(this).siblings('.decline-business-request-button').remove();
		$(this).remove();
		parent.append('<button class=\'btn btn-success\'>Accepted</button>');
	});

	$('.decline-business-request-button').click(function(){
		var containingCard = $(this).closest('.card');
		var requestId = $(this).siblings('.request-partial-request-id').html();
		var bandId = $(this).siblings('.request-partial-band-id').html();
		var businessId = $(this).siblings('.request-partial-business-id').html();
		var pay = containingCard.find('request-pay').html();
		var time = containingCard.find('request-time').html();
		var date = containingCard.find('request-date').html();
		var location = containingCard.find('request-location').html();
		var message = containingCard.find('request-message').html();
		
		var business_request = {
			band_id: bandId,
			business_id: businessId,
			pay: pay,
			time: time,
			location: location,
			message: message,
			band_decision: "false"
		}

		$.ajax({
		  type: "PATCH",
		  url: '/business_requests/' + requestId + '.json',
		  data: {business_request: business_request},
		  success: function(data){
		  	if(data.status == "accepted"){
		  		alert("You already accepted that job!");
		  	}
		  },
		  dataType: 'json'
		});
		// Remove the aply button, replace with green success button.
		var parent = $(this).parent();
		$(this).siblings('.accept-business-request-button').remove();
		$(this).remove();
		parent.append('<button class=\'btn btn-danger\'>Declined</button>');
	});
});