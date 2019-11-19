<div class="modal-dialog modal-xl no-print" role="document">
  <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close no-print" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <!--sell to event-->
    <h4 class="modal-title" id="modalTitle"> Event Details(<b>@lang('sale.invoice_no'):</b> {{ $sell->invoice_no }})
    </h4>
</div>
<div class="modal-body">
    <div class="row">
      <div class="col-xs-12">
          <p class="pull-right"><b>@lang('messages.date'):</b> {{ @format_date($sell->transaction_date) }}</p>
      </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-xs-6">
        <div class="pull-left">
        <b>{{ __('sale.invoice_no') }}:</b> #{{ $sell->invoice_no }}<br>
        <b>{{ __('sale.status') }}:</b> 
          @if($sell->status == 'draft' && $sell->is_quotation == 1)
            {{ __('lang_v1.quotation') }}
          @else
            {{ ucfirst( $sell->status ) }}
          @endif
        <br>
        <b>{{ __('sale.payment_status') }}:</b> {{ ucfirst( $sell->payment_status ) }}<br>
      </div>
        <div class="pull-right">
        <b>{{ __('sale.customer_name') }}:</b> {{ $sell->contact->name }}<br>
        <b>{{ __('business.address') }}:</b><br>
        
        @if(!empty($sell->billing_address()))
          {{$sell->billing_address()}}
        @else
          @if($sell->contact->landmark)
              {{ $sell->contact->landmark }},
          @endif

          {{ $sell->contact->city }}

          @if($sell->contact->state)
              {{ ', ' . $sell->contact->state }}
          @endif
          <br>
          @if($sell->contact->country)
              {{ $sell->contact->country }}
          @endif
          @if($sell->contact->mobile)
          <br>
              {{__('contact.mobile')}}: {{ $sell->contact->mobile }}
          @endif
          @if($sell->contact->alternate_number)
          <br>
              {{__('contact.alternate_contact_number')}}: {{ $sell->contact->alternate_number }}
          @endif
          @if($sell->contact->landline)
            <br>
              {{__('contact.landline')}}: {{ $sell->contact->landline }}
          @endif
        @endif
        
      </div> 
        </div>

      <div class="col-sm-6 col-xs-6">
        <b>Event Address: </b>{{$eventMenu->venue}} <br>
        <b>Event Time: </b>{{$eventMenu->event_time}} <br>
        <b>Booking Time: </b>{{$eventMenu->booking_time}} <br>

      @if(in_array('tables' ,$enabled_modules))
         <strong>@lang('restaurant.table'):</strong>
          {{$sell->table->name ?? ''}}<br>
      @endif
      @if(in_array('service_staff' ,$enabled_modules))
          <strong>@lang('restaurant.service_staff'):</strong>
          {{$sell->service_staff->user_full_name ?? ''}}<br>
      @endif

      @if(!empty($sell->shipping_address()))
        <strong>@lang('sale.shipping'):</strong><br>
          {{$sell->shipping_address()}}
      @endif
      </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-6 col-xs-6">
            <h4>{{ __('sale.products') }}:</h4>
        <div class="table-responsive">
        <table class="table bg-gray">
        <tr class="bg-green">
        <th>#</th>
        <th>{{ __('sale.product') }}</th>
        @if( session()->get('business.enable_lot_number') == 1)
            <th>{{ __('lang_v1.lot_n_expiry') }}</th>
        @endif
        <th>{{ __('sale.qty') }}</th>
        @if(!empty($pos_settings['inline_service_staff']))
            <th>
                @lang('restaurant.service_staff')
            </th>
        @endif
        <th>Image</th>

    </tr>
    @foreach($sell->sell_lines as $sell_line)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>
                {{ $sell_line->product->name }}
                @if( $sell_line->product->type == 'variable')
                - {{ $sell_line->variations->product_variation->name ?? ''}}
                - {{ $sell_line->variations->name ?? ''}},
                @endif
                {{ $sell_line->variations->sub_sku ?? ''}}
                @php
                $brand = $sell_line->product->brand;
                @endphp
                @if(!empty($brand->name))
                , {{$brand->name}}
                @endif

                @if(!empty($sell_line->sell_line_note))
                <br> {{$sell_line->sell_line_note}}
                @endif
            </td>
            @if( session()->get('business.enable_lot_number') == 1)
                <td>{{ $sell_line->lot_details->lot_number ?? '--' }}
                    @if( session()->get('business.enable_product_expiry') == 1 && !empty($sell_line->lot_details->exp_date))
                    ({{@format_date($sell_line->lot_details->exp_date)}})
                    @endif
                </td>
            @endif
            <td>
                <span class="display_currency" data-currency_symbol="false" data-is_quantity="true">{{ $sell_line->quantity }}</span> @if(!empty($sell_line->sub_unit)) {{$sell_line->sub_unit->short_name}} @else {{$sell_line->product->unit->short_name}} @endif
            </td>
            <td>
            <img src="{{$sell_line->product->image_url}}" alt="Product image" class="product-thumbnail-small">
            </td>
        </tr>
    @endforeach
</table>
        </div>
      </div>
    

    <!--Payment Info section-->
    
    <!--event section add-->
        <div class="col-sm-6 col-xs-6">
                    <h4>Event:</h4>
            <div class="table-responsive">
                <table class="table bg-gray">
                    <tr class="bg-green">
                    <th>#</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Attendences</th>
                    </tr>
                    <tr>
                    <td></td>
                    <td>{{ $eventMenu->name }}</td>
                    <td>{{ $eventMenu->type }}</td>
                    <td>{{ $eventMenu->attendences }}</td>

                    </tr>  
                
                </table>
            </div>
        </div>
        </div>
        
        <!--dynamic event menu item-->
      
    
    <!--event section end -->
    
    <div class="row">
         <div class="col-sm-6 col-xs-6">
                    <h4>Grocery:</h4>
            <div class="table-responsive">
                <table class="table bg-gray">
                    <tr class="bg-green">
                    <th>#</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    </tr>
                    @foreach($groceries as $grocery)
                    <tr>
                    <td>{{ $grocery->name }}</td>
                    <td>{{ $grocery->quantity }}</td>
                    </tr>
                    @endforeach 
                </table>
            </div>
        </div>    
      <div class="col-sm-6 col-xs-6">
        <strong>{{ __( 'sale.sell_note')}}:</strong><br>
        <p class="well well-sm no-shadow bg-gray">
          @if($sell->additional_notes)
            {{ $sell->additional_notes }}
          @else
            --
          @endif
        </p>
      </div>
    <!--staff-note-->
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="print-invoice btn btn-primary" data-href="{{route('sell.printInvoice', [$sell->id])}}"><i class="fa fa-print" aria-hidden="true"></i> @lang("messages.print")</a>
      <button type="button" class="btn btn-default no-print" data-dismiss="modal">@lang( 'messages.close' )</button>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    var element = $('div.modal-xl');
    __currency_convert_recursively(element);
  });
</script>
