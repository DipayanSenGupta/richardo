@extends('layouts.app')

@section('title', __('sale.add_sale'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang('sale.add_sale')</h1>
</section>
<!-- Main content -->
<section class="content no-print">
@if(!empty($pos_settings['allow_overselling']))
	<input type="hidden" id="is_overselling_allowed">
@endif
@if(session('business.enable_rp') == 1)
    <input type="hidden" id="reward_point_enabled">
@endif
@if(is_null($default_location))
<div class="row">
	<div class="col-sm-3">
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon">
					<i class="fa fa-map-marker"></i>
				</span>
			{!! Form::select('select_location_id', $business_locations, null, ['class' => 'form-control input-sm', 
			'placeholder' => __('lang_v1.select_location'),
			'id' => 'select_location_id', 
			'required', 'autofocus'], $bl_attributes); !!}
			<span class="input-group-addon">
					@show_tooltip(__('tooltip.sale_location'))
				</span> 
			</div>
		</div>
	</div>
</div>
@endif
<input type="hidden" id="item_addition_method" value="{{$business_details->item_addition_method}}">
	{!! Form::open(['url' => action('SellPosController@store'), 'method' => 'post', 'id' => 'add_sell_form' ]) !!}
	<div class="row">
		<div class="col-md-12 col-sm-12">
			@component('components.widget', ['class' => 'box-primary'])
				{!! Form::hidden('location_id', $default_location, ['id' => 'location_id', 'data-receipt_printer_type' => isset($bl_attributes[$default_location]['data-receipt_printer_type']) ? $bl_attributes[$default_location]['data-receipt_printer_type'] : 'browser']); !!}

				@if(!empty($price_groups))
					@if(count($price_groups) > 1)
						<div class="col-sm-4">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-money"></i>
									</span>
									@php
										reset($price_groups);
									@endphp
									{!! Form::hidden('hidden_price_group', key($price_groups), ['id' => 'hidden_price_group']) !!}
									{!! Form::select('price_group', $price_groups, null, ['class' => 'form-control select2', 'id' => 'price_group']); !!}
									<span class="input-group-addon">
										@show_tooltip(__('lang_v1.price_group_help_text'))
									</span> 
								</div>
							</div>
						</div>
						
					@else
						@php
							reset($price_groups);
						@endphp
						{!! Form::hidden('price_group', key($price_groups), ['id' => 'price_group']) !!}
					@endif
				@endif
				
				@if(in_array('subscription', $enabled_modules))
					<div class="col-md-4 pull-right col-sm-6">
						<div class="checkbox">
							<label>
				              {!! Form::checkbox('is_recurring', 1, false, ['class' => 'input-icheck', 'id' => 'is_recurring']); !!} @lang('lang_v1.subscribe')?
				            </label><button type="button" data-toggle="modal" data-target="#recurringInvoiceModal" class="btn btn-link"><i class="fa fa-external-link"></i></button>@show_tooltip(__('lang_v1.recurring_invoice_help'))
						</div>
					</div>
				@endif
				<div class="clearfix"></div>
				<div class="@if(!empty($commission_agent)) col-sm-3 @else col-sm-4 @endif">
					<div class="form-group">
						{!! Form::label('contact_id', __('contact.customer') . ':*') !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-user"></i>
							</span>
							<input type="hidden" id="default_customer_id" 
							value="{{ $walk_in_customer['id']}}" >
							<input type="hidden" id="default_customer_name" 
							value="{{ $walk_in_customer['name']}}" >
							{!! Form::select('contact_id', 
								[], null, ['class' => 'form-control mousetrap', 'id' => 'customer_id', 'placeholder' => 'Enter Customer name / phone', 'required']); !!}
							<span class="input-group-btn">
								<button type="button" class="btn btn-default bg-white btn-flat add_new_customer" data-name=""><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
							</span>
						</div>
					</div>
				</div>

				<div class="col-md-3">
		          <div class="form-group">
		            <div class="multi-input">
		              {!! Form::label('pay_term_number', __('contact.pay_term') . ':') !!} @show_tooltip(__('tooltip.pay_term'))
		              <br/>
		              {!! Form::number('pay_term_number', $walk_in_customer['pay_term_number'], ['class' => 'form-control width-40 pull-left', 'placeholder' => __('contact.pay_term')]); !!}

		              {!! Form::select('pay_term_type', 
		              	['months' => __('lang_v1.months'), 
		              		'days' => __('lang_v1.days')], 
		              		$walk_in_customer['pay_term_type'], 
		              	['class' => 'form-control width-60 pull-left','placeholder' => __('messages.please_select')]); !!}
		            </div>
		          </div>
		        </div>

				@if(!empty($commission_agent))
				<div class="col-sm-3">
					<div class="form-group">
					{!! Form::label('commission_agent', __('lang_v1.commission_agent') . ':') !!}
					{!! Form::select('commission_agent', 
								$commission_agent, null, ['class' => 'form-control select2']); !!}
					</div>
				</div>
				@endif
				<div class="@if(!empty($commission_agent)) col-sm-3 @else col-sm-4 @endif">
					<div class="form-group">
						{!! Form::label('transaction_date', __('sale.sale_date') . ':*') !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
							{!! Form::text('transaction_date', $default_datetime, ['class' => 'form-control', 'readonly', 'required']); !!}
						</div>
					</div>
				</div>
				<div class="@if(!empty($commission_agent)) col-sm-3 @else col-sm-4 @endif">
					<div class="form-group">
						{!! Form::label('status', __('sale.status') . ':*') !!}
						{!! Form::select('status', ['final' => __('sale.final'), 'draft' => __('sale.draft'), 'quotation' => __('lang_v1.quotation')], null, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select'), 'required']); !!}
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('invoice_scheme_id', __('invoice.invoice_scheme') . ':') !!}
						{!! Form::select('invoice_scheme_id', $invoice_schemes, $default_invoice_schemes->id, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select')]); !!}
					</div>
				</div>
				<div class="clearfix"></div>
				<!-- Call restaurant module if defined -->
		        @if(in_array('tables' ,$enabled_modules) || in_array('service_staff' ,$enabled_modules))
		        	<span id="restaurant_module_span">
		          		<div class="col-md-3"></div>
		        	</span>
		        @endif
			@endcomponent

			@component('components.widget', ['class' => 'box-primary'])
	            <div class="col-md-5 col-md-offset-1 col-sm-10 col-sm-offset-1">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-barcode"></i>
							</span>
							{!! Form::text('search_product', null, ['class' => 'form-control mousetrap', 'id' => 'search_product', 'placeholder' => __('lang_v1.search_product_placeholder'),
							'disabled' => is_null($default_location)? true : false,
							'autofocus' => is_null($default_location)? false : true,
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
						value="0">
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
						<tbody></tbody>
					</table>
					</div>
					<div class="table-responsive">
					<table class="table table-condensed table-bordered table-striped">
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

			@component('components.widget', ['class' => 'box-primary'])
				<div class="row col-sm-12" style="min-height: 0">
                        
                        <div class="col-sm-3">
                        <div class="form-group">
                        
                        {!! Form::label('event_name', 'Event Name', ['class' => 'control-label']) !!}
                        {!! Form::text('event_name', null,
                        [
                        'class' => 'form-control input-lg',
                        'placeholder' => 'Event Name', 'required'
                        ])
                        !!}
                        </div>
                        </div> 
                        
                        <div class="col-md-3">
                        <div class="form-group">
                        {!! Form::label('event_time', 'Event Time'. ':*') !!}
                        <div class="input-group">
                        <span class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                        </span>
                        {!! Form::text('event_time', null, ['class' => 'form-control', 'readonly', 'required']); !!}
                        </div>
                        </div>
                        </div>
                        
                        <div class="col-sm-3">
                        <div class="form-group">
                        {!! Form::label('venu', 'Event venue ' . ':*') !!}
                        {!! Form::select('venue', ['Sena Maloncho' => __('Sena Maloncho'), 'PSC' => 'PSC', 'RAWA' => 'RAWA'], null, ['class' => 'form-control select2', 'placeholder' => 'Select Event Type', 'required']); !!}
                        </div>
                        </div>
                        
                        
                        <div class="col-sm-3">
                    <div class="form-group">
                    {!! Form::label('type', 'Event Type' . ':*') !!}
                    {!! Form::select('type',  ['Wedding' => 'Wedding', 'Reception' => 'Reception', 'Holud' => 'Holud'], null, ['class' => 'form-control select2', 'placeholder' =>'Select Event Type', 'required']); !!}
                    </div>
                    </div>
                        
                                                <div class="clearfix"></div>

                      <div class="col-sm-3">
                            <div class="form-group">
                                {!! Form::label('attendences', 'Attendence', ['class' => 'control-label']) !!}
                                {!! Form::text('attendences', null,
                                [
                                'class' => 'form-control input-lg',
                                'placeholder' => 'attendences', 'required'
                                ])
                                !!}
                            </div>
                        </div>                        

                    
                        <div class="col-md-3">
                            <div class="form-group">
                                {!! Form::label('booking_time', 'Booking Time'. ':*') !!}
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                    {!! Form::text('booking_time', $default_datetime, ['class' => 'form-control', 'readonly', 'required']); !!}
                                </div>
                            </div>
                        </div>
                                               <div class="col-md-3">
                            <div class="form-group">
                                {!! Form::label('documents', __('purchase.attach_document') . ':') !!}
                                <div class="input-group">
                                    <span class="input-group-addon">
                                    </span>
                                </div>    
                            {!! Form::file('documents', ['id' => 'upload_document']); !!}
                            </div>
                        </div>
                     <div class="col-md-12">
			    	<div class="form-group">
						{!! Form::label('sell_note','Event Note') !!}
						{!! Form::textarea('sale_note', null, ['class' => 'form-control', 'rows' => 3]); !!}
					</div>
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

<!--Default value sent -->
	

		</div>
	</div>
	@component('components.widget', ['class' => 'box-primary', 'id' => "payment_rows_div", 'title' => __('purchase.add_payment')])
	<div class="payment_row">
		@include('sale_pos.partials.payment_row_form', ['row_index' => 0])
		<hr>
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-right"><strong>@lang('lang_v1.balance'):</strong> <span class="balance_due">0.00</span></div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-12">
				<button type="button" id="submit-sell" class="btn btn-primary pull-right btn-flat">@lang('messages.submit')</button>
			</div>
		</div>
	</div>
	@endcomponent
	
	@if(empty($pos_settings['disable_recurring_invoice']))
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
