<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">Event Details</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6">
						<strong>Customer Name:</strong> {{ $customer_name }}<br>
						<strong>Event Note:</strong> {{ $eventbooking->booking_note }}
					</div>
					<div class="col-sm-6">
						<strong>Event Name:</strong> {{ $eventMenu->name }}<br>
						<strong>Event Venue:</strong> {{ $eventMenu->venue }}<br>
						<strong>No of Guests:</strong> {{ $eventMenu->attendences }}<br>
						<strong>Booking Time:</strong> {{@format_date($eventMenu->booking_time)}} <br>
						<strong>Event Time:</strong> {{@format_date($eventMenu->event_time)}} <br>
						<br>
                        <button type="button" class="btn btn-info"><a href="#" data-href="{{route('sells.edit', $eventMenu->id)}}" 
                        class="btn-modal" data-container=".view_modal" style="color:white;"> 
                        Edit</a></button>
					</div>
				</div>
		
	
			<br>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
			</div>
		

	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->