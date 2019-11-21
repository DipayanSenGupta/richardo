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
                <th>Invoice no</th>
                <th>Customer name</th>
                <th>Booking date</th>
                <th>Event date</th>
                <th>Event Venue</th>
                <th>Attendence</th>
                <th>Grocery</th>
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
        ajax: '/sells/draft-dt?is_quotation=0',
        columnDefs: [ {
            "targets": 6,
            "orderable": false,
            "searchable": false
        } ],
        columns: [
            { data: 'invoice_no', name: 'invoice_no'},
            { data: 'name', name: 'contacts.name'},
            { data: 'booking_time', name: 'eventMenu.booking_time'  },
            { data: 'event_time', name: 'eventMenu.event_time'  },
            { data: 'venue', name: 'eventMenu.venue'  },
            { data: 'attendences', name: 'eventMenu.attendences'  },
            { data: 'grocery', name: 'grocery'},
            { data: 'action', name: 'action'}
        ]

    });
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('#daterange-btn span').html(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            sell_table.ajax.url( '/sells/draft-dt?is_quotation=0&start_date=' + start.format('YYYY-MM-DD') +
                '&end_date=' + end.format('YYYY-MM-DD') ).load();
        }
    );
    $('#daterange-btn').on('cancel.daterangepicker', function(ev, picker) {
        sell_table.ajax.url( '/sells/draft-dt?is_quotation=0').load();
        $('#daterange-btn span').html('<i class="fa fa-calendar"></i> Filter By Date');
    });
});
</script>
	
@endsection