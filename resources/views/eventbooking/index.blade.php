@extends('layouts.app')
@section('title','Event Booking')

@section('content')
<link rel="stylesheet" href="{{ asset('plugins/fullcalendar/fullcalendar.min.css?v='.$asset_v) }}">


<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>Event Booking</h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-sm-10">
            <div class="box">
                <div class="box-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="box box-solid">
                <div class="box-body">
                    <!-- the events -->
                    <div class="external-event bg-light-blue text-center" style="position: relative;">
                        <small>Proposed</small>
                    </div>
                    <div class="external-event bg-green text-center" style="position: relative;">
                        <small>Final</small>
                    </div>
                    <div class="external-event bg-red text-center" style="position: relative;">
                        <small>Completed</small>
                    </div>
                    <small>
                    <p class="help-block">
                        <i>@lang('restaurant.click_on_any_booking_to_view_or_change_status')<br><br>
                        @lang('restaurant.double_click_on_any_day_to_add_new_booking')
                        </i>
                    </p>
                    </small>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
    </div>

</section>
<!-- /.content -->

@endsection

@section('javascript')
    <script src="{{ asset('plugins/fullcalendar/fullcalendar.min.js?v=' . $asset_v) }}"></script>

@php
    $fullcalendar_lang_file = session()->get('user.language', config('app.locale') ) . '.js';
@endphp
@if(file_exists(public_path() . '/plugins/fullcalendar/locale/' . $fullcalendar_lang_file))
    <script src="{{ asset('plugins/fullcalendar/locale/' . $fullcalendar_lang_file . '?v=' . $asset_v) }}"></script>
@endif
    
    <script type="text/javascript">
        $(document).ready(function(){
            clickCount = 0;
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                eventLimit: 2,
                events: '/event-bookings',
                eventRender: function (event, element) {
                    var title_html = event.title;
                    element.find('.fc-title').html(title_html);
                    element.attr('data-href', event.url);
                    element.attr('data-container', '.view_modal');
                    element.addClass('btn-modal');
                }
            });

            //If location is set then show tables.


        });
        
        $(document).on('change', 'select#booking_location_id', function(){
            getLocationTables($(this).val());
        });

        $(document).on('change', 'select#business_location_id', function(){
            reload_calendar();
            todays_bookings_table.ajax.reload();
        });


        // function reload_calendar(){
        //     var location_id = '';
        //     if($('select#business_location_id').val()){
        //         location_id = $('select#business_location_id').val();
        //     }

        //     var events_source = {
        //             url: '/bookings',
        //             type: 'get',
        //             data: {
        //                 'location_id': location_id
        //             }
        //         }
        //         $('#calendar').fullCalendar( 'removeEventSource', events_source);
        //         $('#calendar').fullCalendar( 'addEventSource', events_source);         
        //         $('#calendar').fullCalendar( 'refetchEvents' );
        // }

    </script>
@endsection
