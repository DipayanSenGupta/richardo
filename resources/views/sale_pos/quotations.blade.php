@extends('layouts.app')
@section('title', __( 'sale.drafts'))
@section('content')

<!-- Content Header (Page header) -->
<section class="content-header no-print">
    <h1>@lang('sale.drafts')
    </h1>
</section>

<!-- Main content -->
<section class="content no-print">
    @component('components.widget', ['class' => 'box-primary'])
        @slot('tool')
            <div class="box-tools">
                <a class="btn btn-block btn-primary" href="{{action('SellPosController@create')}}">
                <i class="fa fa-plus"></i> @lang('messages.add')</a>
            </div>
        @endslot
        <div class="form-group">
            <div class="input-group">
              <button type="button" class="btn btn-primary" id="daterange-btn">
                <span>
                  <i class="fa fa-calendar"></i> Filter By Date
                </span>
                <i class="fa fa-caret-down"></i>
              </button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped ajax_view" id="sell_table">
                <thead>
                <tr>
                <th>Event Id</th>
                <th>Customer Name</th>
                <th>Event Name</th>
                <th>Booking Date & Time </th>
                <th>Event Date & Time</th>
                <th>Event Venue</th>
                <th>Number of Guests</th>
                <th>Grocery</th>
                <th>Menu</th>  
                <th>Action</th>
                </tr>
                </thead>
            </table>
        </div>
    @endcomponent
</section>
<!-- /.content -->
@stop
@section('javascript')
<script type="text/javascript">
$(document).ready( function(){
    sell_table = $('#sell_table').DataTable({
        processing: true,
        serverSide: true,
        aaSorting: [[0, 'desc']],
        ajax: '/sells/draft-dt?is_quotation=1',
        columnDefs: [ {
            "targets": 6,
            "orderable": false,
            "searchable": false
        } ],
        columns: [
            { data: 'evId', name: 'evId'},
            { data: 'name', name: 'contacts.name'},
            { data: 'evName', name: 'evName'},
            { data: 'booking_time', name: 'ev.booking_time'  },
            { data: 'event_time', name: 'ev.event_time'  },
            { data: 'venue', name: 'ev.venue'},
            { data: 'attendences', name: 'ev.attendences'},
            { data: 'grocery', name: 'grocery',"orderable": false},
            { data: 'menu', name: 'menu',"orderable": false},
            { data: 'action', name: 'action',"orderable": false}
        ]

    });
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('#daterange-btn span').html(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            sell_table.ajax.url( '/sells/draft-dt?is_quotation=1&start_date=' + start.format('YYYY-MM-DD') +
                '&end_date=' + end.format('YYYY-MM-DD') ).load();
        }
    );
    $('#daterange-btn').on('cancel.daterangepicker', function(ev, picker) {
        sell_table.ajax.url( '/sells/draft-dt?is_quotation=1').load();
        $('#daterange-btn span').html('<i class="fa fa-calendar"></i> Filter By Date');
    });
});
</script>
	
@endsection