@extends('layouts.app')
@section('title', 'All Events')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header no-print">
    <!--Change Sell to Event-->
    <h1>Events
        <small></small>
    </h1>
</section>

<!-- Main content -->
<section class="content no-print">
    @component('components.filters', ['title' => __('report.filters')])
        @include('sell.partials.event_list_filters')
    @endcomponent
        <!--Change Sell to Event-->
    @component('components.widget', ['class' => 'box-primary', 'title' => 'All Events'])
        @can('sell.create')
            @slot('tool')
                <div class="box-tools">
                    <a class="btn btn-block btn-primary" href="{{action('SellController@create')}}">
                    <i class="fa fa-plus"></i> @lang('messages.add')</a>
                </div>
            @endslot
        @endcan
        @if(auth()->user()->can('direct_sell.access') ||  auth()->user()->can('view_own_sell_only'))
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
                        <th>No. of Guests</th>
                        <th>Grocery</th>
                        <th>Menu</th>
                        <th>Action</th>
                        </tr>
                    </thead>
                </table>
            </div>
        @endif
    @endcomponent
</section>
<!-- /.content -->
<div class="modal fade payment_modal" tabindex="-1" role="dialog" 
    aria-labelledby="gridSystemModalLabel">
</div>

<div class="modal fade edit_payment_modal" tabindex="-1" role="dialog" 
    aria-labelledby="gridSystemModalLabel">
</div>

<!-- This will be printed -->
<!-- <section class="invoice print_section" id="receipt_section">
</section> -->

@stop

@section('javascript')
<script type="text/javascript">
$(document).ready( function(){
    //Date range as a button
    $('#sell_list_filter_date_range').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('#sell_list_filter_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            sell_table.ajax.reload();
        }
    );
    $('#sell_list_filter_date_range').on('cancel.daterangepicker', function(ev, picker) {
        $('#sell_list_filter_date_range').val('');
        sell_table.ajax.reload();
    });

    sell_table = $('#sell_table').DataTable({
        processing: true,
        serverSide: true,
        aaSorting: [[0, 'desc']],
        "ajax": {
            "url": "/sells",
            "data": function ( d ) {
                if($('#sell_list_filter_date_range').val()) {
                    var start = $('#sell_list_filter_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
                    var end = $('#sell_list_filter_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
                    d.start_date = start;
                    d.end_date = end;
                }
                d.is_direct_sale = 1;
                d.location_id = $('#sell_list_filter_location_id').val();
                d.customer_id = $('#sell_list_filter_customer_id').val();
                d.created_by = $('#created_by').val();
            }
        },
        columnDefs: [ {
            "targets": [6],
            "orderable": false,
            "searchable": false
        } ],
        columns: [
            { data: 'evId', name: 'evId'},
            { data: 'name', name: 'contacts.name'},
            { data: 'evName', name: 'evName'},
            { data: 'booking_time', name: 'ev.booking_time'  },
            { data: 'event_time', name: 'ev.event_time'  },
            { data: 'venue', name: 'ev.venue'  },
            { data: 'attendences', name: 'ev.attendences'},
            { data: 'grocery', name: 'grocery',"orderable": false},
            { data: 'menu', name: 'menu',"orderable": false},
            { data: 'action', name: 'action',"orderable": false}
        ]
    });

    $(document).on('change', '#sell_list_filter_location_id,#sell_list_filter_customer_id, #sell_list_filter_customer_id, #created_by',  function() {
        sell_table.ajax.reload();
    });
});
</script>
<script src="{{ asset('js/payment.js?v=' . $asset_v) }}"></script>
@endsection