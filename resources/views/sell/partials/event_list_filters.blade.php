
<div class="col-md-3">
    <div class="form-group">
        {!! Form::label('sell_list_filter_customer_id',  __('contact.customer') . ':') !!}
        {!! Form::select('sell_list_filter_customer_id', $customers, null, ['class' => 'form-control select2', 'style' => 'width:100%', 'placeholder' => __('lang_v1.all')]); !!}
    </div>
</div>

<div class="col-md-3">
    <div class="form-group">
        {!! Form::label('sell_list_filter_date_range', __('report.date_range') . ' Booking time' . ':') !!}
        {!! Form::text('sell_list_filter_date_range', null, ['placeholder' => __('lang_v1.select_a_date_range'), 'class' => 'form-control', 'readonly']); !!}
    </div>
</div>
<div class="col-md-3">
    <div class="form-group">
        {!! Form::label('created_by',  __('report.user') . ':') !!}
        {!! Form::select('created_by', $sales_representative, null, ['class' => 'form-control select2', 'style' => 'width:100%']); !!}
    </div>
</div>

