@extends('layouts.app')

@section('title', 'Edit Event')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>Edit Event <small>(@lang('sale.invoice_no'): <span class="text-success">#{{$transaction->invoice_no}})</span></small></h1>
</section>
    @if (session('notification') || !empty($notification))
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    @if(!empty($notification['msg']))
                        {{$notification['msg']}}
                    @elseif(session('notification.msg'))
                        {{ session('notification.msg') }}
                    @endif
                </div>
            </div>  
        </div>     
    @endif
<!-- Main content -->
<section class="content">
@if(!empty($pos_settings['allow_overselling']))
	<input type="hidden" id="is_overselling_allowed">
@endif
@if(session('business.enable_rp') == 1)
    <input type="hidden" id="reward_point_enabled">
@endif
<input type="hidden" id="item_addition_method" value="{{$business_details->item_addition_method}}">
	{!! Form::open(['url' => action('EventPosController@update', ['id' => $transaction->id ]), 'method' => 'put', 'id' => 'edit_sell_form',  'enctype' => 'multipart/form-data']) !!}

	{!! Form::hidden('location_id', $transaction->location_id, ['id' => 'location_id', 'data-receipt_printer_type' => !empty($location_printer_type) ? $location_printer_type : 'browser']); !!}
	<div class="row">
		<div class="col-md-12 col-sm-12">
			@component('components.widget', ['class' => 'box-primary'])
				@if(!empty($price_groups))
					@if(count($price_groups) > 1)
						<div class="col-md-4 col-sm-6">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-money"></i>
									</span>
									{!! Form::hidden('hidden_price_group', $transaction->selling_price_group_id, ['id' => 'hidden_price_group']) !!}
									{!! Form::select('price_group', $price_groups, $transaction->selling_price_group_id, ['class' => 'form-control select2', 'id' => 'price_group']); !!}
									<span class="input-group-addon">
										@show_tooltip(__('lang_v1.price_group_help_text'))
									</span> 
								</div>
							</div>
						</div>
					@else
						{!! Form::hidden('price_group', $transaction->selling_price_group_id, ['id' => 'price_group']) !!}
					@endif
				@endif
				@if(in_array('subscription', $enabled_modules))
					<div class="col-md-4 pull-right col-sm-6">
						<div class="checkbox">
							<label>
				              {!! Form::checkbox('is_recurring', 1, $transaction->is_recurring, ['class' => 'input-icheck', 'id' => 'is_recurring']); !!} @lang('lang_v1.subscribe')?
				            </label><button type="button" data-toggle="modal" data-target="#recurringInvoiceModal" class="btn btn-link"><i class="fa fa-external-link"></i></button>@show_tooltip(__('lang_v1.recurring_invoice_help'))
						</div>
					</div>
				@endif
				<div class="clearfix"></div>
<!--customer name -->
		<div class="@if(!empty($commission_agent)) col-sm-3 @else col-sm-3 @endif">
					<div class="form-group">
						{!! Form::label('contact_id', __('contact.customer') . ':*') !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-user"></i>
							</span>
							<input type="hidden" id="default_customer_id" 
							value="{{ $transaction->contact->id }}" >
							<input type="hidden" id="default_customer_name" 
							value="{{ $transaction->contact->name }}" >
							{!! Form::select('contact_id', 
								[], $transaction->contact->name, ['class' => 'form-control mousetrap', 'id' => 'customer_id', 'placeholder' => 'Enter Customer name / phone', 'required']); !!}
							<span class="input-group-btn">
								<button type="button" class="btn btn-default bg-white btn-flat add_new_customer" data-name=""><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
							</span>
						</div>
					</div>
				</div>


<!--Event Name-->
<div class="col-sm-3">
<div class="form-group">

{!! Form::label('event_name', 'Event Name' . ':*', ['class' => 'control-label']) !!}
{!! Form::text('event_name',  $eventMenu->name,
[
'class' => 'form-control',
'placeholder' => 'Add Event Name', 'required'
])
!!}
</div>
</div>
<!--Event Time-->
<div class="col-md-3">
<div class="form-group">
{!! Form::label('event_time', 'Event Time'. ':*') !!}
<div class="input-group">
<span class="input-group-addon">
<i class="fa fa-calendar"></i>
</span>
{!! Form::text('event_time',  $eventMenu->event_time, ['class' => 'form-control', 'readonly', 'required']); !!}
</div>
</div>
</div>
<div class="clearfix"></div> 
<!--Event Venue-->
<div class="col-sm-3">
<div class="form-group">
{!! Form::label('venu', 'Event venue ' . ':*') !!}
{!! Form::text('venue',  $eventMenu->venue,
[
'class' => 'form-control',
'placeholder' => 'Add Event Venue', 'required'
])
!!}                        
</div>
</div>

<!--Event Type-->
<div class="col-sm-3">
<div class="form-group">
{!! Form::label('type', 'Event Type' . ':*') !!}
{!! Form::text('type', $eventMenu->type,
[
'class' => 'form-control',
'placeholder' => 'Add Event Type', 'required'
])
!!}                    </div>
</div>
<!--attendence-->
<div class="col-sm-3">
<div class="form-group">
{!! Form::label('attendences', 'Attendence'. ':*', ['class' => 'control-label']) !!}
{!! Form::text('attendences',  $eventMenu->attendences,
[
'class' => 'form-control',
'placeholder' => 'Add attendences', 'required'
])
!!}
</div>
</div>   
<div class="clearfix"></div>
<!--Booking-->
<div class="col-md-3">
<div class="form-group">
{!! Form::label('booking_time', 'Booking Time'. ':*') !!}
<div class="input-group">
<span class="input-group-addon">
<i class="fa fa-calendar"></i>
</span>
{!! Form::text('booking_time',  $eventMenu->booking_time, ['class' => 'form-control', 'readonly', 'required']); !!}
</div>
</div>
</div>

<!--status-->
		@php
					if($transaction->status == 'draft' && $transaction->is_quotation == 1){
						$status = 'quotation';
					} else {
						$status = $transaction->status;
					}
				@endphp
				<div class="@if(!empty($commission_agent)) col-sm-3 @else col-sm-3 @endif">
					<div class="form-group">
						{!! Form::label('status', __('sale.status') . ':*') !!}
						{!! Form::select('status', ['final' => __('sale.final'), 'draft' => __('sale.draft'), 'quotation' => __('lang_v1.quotation')], $status, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select'), 'required']); !!}
					</div>
				</div>
<div class="clearfix"></div>

<div class="col-sm-3">
    <div class="form-group">
          {!! Form::label('name','Grocery upload' . ':') !!}
        @show_tooltip('Add grocery csv / xlsx')
        {!! Form::file('groceries_csv'); !!}
      </div>
</div>

<div class="col-sm-3">
    <div class="form-group">
          {!! Form::label('name','Menu upload' . ':') !!}
        @show_tooltip('Add menu csv / xlsx')
        {!! Form::file('menus_csv'); !!}
      </div>
</div>

<div class="clearfix"></div>

<div class="col-sm-3">
    <a href="{{ asset('files/groceries.xlsx') }}" class="btn btn-success" download><i class="fa fa-download"></i> Download grocery template </a>
</div>
<div class="col-sm-3">
    <a href="{{ asset('files/menus.xlsx') }}" class="btn btn-success" download><i class="fa fa-download"></i> Download menu template </a>
</div>

<div class="clearfix"></div>

<div class="col-md-12">
<div class="form-group">
{!! Form::label('sell_note','Event Note') !!}
{!! Form::textarea('sale_note',$transaction->additional_notes, ['class' => 'form-control', 'rows' => 3]); !!}
</div>
</div>
				<div class="clearfix"></div>

			@endcomponent
			
			@component('components.widget', ['class' => 'box-primary'])
				<div class="col-md-5 col-sm-10 col-sm-offset-1">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-barcode"></i>
							</span>
							{!! Form::text('search_product', null, ['class' => 'form-control mousetrap', 'id' => 'search_product', 'placeholder' => __('lang_v1.search_product_placeholder'),
							'autofocus' => true,
							]); !!}
							<span class="input-group-btn">
								<button type="button" class="btn btn-default bg-white btn-flat pos_add_quick_product" data-href="{{action('ProductController@quickAdd')}}" data-container=".quick_add_product_modal"><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
							</span>
						</div>
					</div>
				</div>
				
                <div class="col-md-5 col-md-offset-1 col-sm-12">
                
                    @include('sale_pos.partials.right_div')
                
                </div>

				<div class="row col-sm-12 pos_product_div" style="min-height: 0">

					<input type="hidden" name="sell_price_tax" id="sell_price_tax" value="{{$business_details->sell_price_tax}}">

					<!-- Keeps count of product rows -->
					<input type="hidden" id="product_row_count" 
						value="{{count($sell_details)}}">
					@php
						$hide_tax = '';
						if( session()->get('business.enable_inline_tax') == 0){
							$hide_tax = 'hide';
						}
					@endphp
					<div class="table-responsive">
					<table class="table table-condensed table-bordered table-striped table-responsive" id="pos_table">
						<thead>
							<tr>
								<th class="text-center">	
									@lang('sale.product')
								</th>
								<th class="text-center">
									@lang('sale.qty')
								</th>
								@if(!empty($pos_settings['inline_service_staff']))
									<th class="text-center">
										@lang('restaurant.service_staff')
									</th>
								@endif
								<th class="text-center {{$hide_tax}}">
									@lang('sale.price_inc_tax')
								</th>
								<th class="text-center">
									@lang('sale.subtotal')
								</th>
								<th class="text-center"><i class="fa fa-close" aria-hidden="true"></i></th>
							</tr>
						</thead>
						<tbody>
							@foreach($sell_details as $sell_line)
								@include('sale_pos.product_row', ['product' => $sell_line, 'row_count' => $loop->index, 'tax_dropdown' => $taxes, 'sub_units' => !empty($sell_line->unit_details) ? $sell_line->unit_details : [] ])
							@endforeach
						</tbody>
					</table>
					</div>
					<div class="table-responsive">
					<table class="table table-condensed table-bordered table-striped table-responsive">
						<tr>
							<td>
								<div class="pull-right">
									<b>@lang('sale.item'):</b> 
									<span class="total_quantity">0</span>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<b>@lang('sale.total'): </b>
									<span class="price_total">0</span>
								</div>
							</td>
						</tr>
					</table>
					</div>
				</div>
			@endcomponent

            
            
<!--Default value sent -->
			    <input type="hidden" name="discount_type" id="discount_type" value="percentage">
			    <input type="hidden" name="discount_amount" id="discount_amount" value={{$business_details->default_sales_discount}}>
			    <input type="hidden" name="rp_redeemed" id="rp_redeemed" value="0">
			    <input type="hidden" name="rp_redeemed_amount" id="rp_redeemed_amount" value="0">
			    <input type="hidden" id="rp_name" value="{{session('business.rp_name')}}">
			    <input type="hidden" name="is_direct_sale" value="1">
                <input id="tax_rate_id" name="tax_rate_id" type="hidden" value={{$business_details->default_sales_tax}}>
                <input type="hidden" name="tax_calculation_amount" id="tax_calculation_amount" 
				value="@if(empty($edit)) {{@num_format($business_details->tax_calculation_amount)}} @else {{@num_format(optional($transaction->tax)->amount)}} @endif" 
				data-default="{{$business_details->tax_calculation_amount}}">
				<input type="hidden" name="final_total" id="final_total_input">
				    <div class="col-md-12">
			    	<button type="button" class="btn btn-primary pull-right" id="submit-sell">@lang('messages.update')</button>
			    </div>

<!--Default value sent -->

		</div>
	</div>
	@if(in_array('subscription', $enabled_modules))
		@include('sale_pos.partials.recurring_invoice_modal')
	@endif
	{!! Form::close() !!}
</section>

<div class="modal fade contact_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	@include('contact.create', ['quick_add' => true])
</div>
<!-- /.content -->
<div class="modal fade register_details_modal" tabindex="-1" role="dialog" 
	aria-labelledby="gridSystemModalLabel">
</div>
<div class="modal fade close_register_modal" tabindex="-1" role="dialog" 
	aria-labelledby="gridSystemModalLabel">
</div>
<!-- quick product modal -->
<div class="modal fade quick_add_product_modal" tabindex="-1" role="dialog" aria-labelledby="modalTitle"></div>

@stop

@section('javascript')
    <script src="{{ asset('js/event.js')}}"></script>
	<script src="{{ asset('js/pos.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/product.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/opening_stock.js?v=' . $asset_v) }}"></script>
	<!-- Call restaurant module if defined -->
    @if(in_array('tables' ,$enabled_modules) || in_array('modifiers' ,$enabled_modules) || in_array('service_staff' ,$enabled_modules))
    	<script src="{{ asset('js/restaurant.js?v=' . $asset_v) }}"></script>
    @endif
@endsection
