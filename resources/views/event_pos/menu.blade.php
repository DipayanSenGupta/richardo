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
                    <h4>Menu:</h4>
            <div class="table-responsive">
                <table class="table bg-gray">
                    <tr class="bg-green">
                    <th>#</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    </tr>
                    @foreach($menuItems as $menuItem)
                    <tr>
                    <td>{{$loop->iteration}}</td>
                    <td>{{ $menuItem->name }}</td>
                    <td>{{ $menuItem->quantity }}</td>
                    </tr>
                    @endforeach 
                </table>
            </div>
        </div>    

    </div>
  </div>

  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    var element = $('div.modal-xl');
    __currency_convert_recursively(element);
  });
</script>
