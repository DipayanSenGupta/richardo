<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Yajra\DataTables\Facades\DataTables;
use App\EventBooking;

use App\BusinessLocation;
use App\Contact;
use App\User;

use App\Utils\Util;

class EventBookingController extends Controller
{
    protected $commonUtil;

    public function __construct(Util $commonUtil)
    {
        $this->commonUtil = $commonUtil;
    }
    public function index()
        {
    // if (!auth()->user()->can('crud_all_bookings') && !auth()->user()->can('crud_own_bookings')) {
    //     abort(403, 'Unauthorized action.');
    // }
    // $user_id = request()->session()->get('user.id');
    
    $business_id = request()->session()->get('user.business_id');
    
    if (request()->ajax()) {
        $start_date = request()->start;
        $end_date = request()->end;
        $query = EventBooking::where('business_id', $business_id)
                        ->whereBetween(DB::raw('date(booking_time)'), [$start_date, $end_date])
                        ->with(['eventMenu']);
    
        $bookings = $query->get();
    
        $events = [];
    
        foreach ($bookings as $booking) {
            $contact_id = $booking->eventMenu->transaction->contact_id;
            $event_name = $booking->eventMenu->name;
            $customer_name = Contact::find($contact_id)->name;
            $backgroundColor = '#3c8dbc';
            $borderColor = '#3c8dbc';
            if ($booking->booking_status == 'completed') {
                $backgroundColor = '#00a65a';
                $borderColor = '#00a65a';
            } elseif ($booking->booking_status == 'cancelled') {
                $backgroundColor = '#f56954';
                $borderColor = '#f56954';
            }
                $title = $event_name;
    
                $title .= ' - ' .'( '. $customer_name.' )';
            
                $events[] = [
                    'title' => $title,
                    'start' => $booking->event_time,
                    'end' => $booking->event_time,
                    'customer_name' => $customer_name,
                    'url' => action('EventBookingController@show', [ $booking->id ]),
                    'backgroundColor' => $backgroundColor,
                    'borderColor'     => $borderColor,
                    'allDay'          => true
                ];
        }
        
        return $events;
    }
    
    $business_locations = BusinessLocation::forDropdown($business_id);
    
    $customers =  Contact::customersDropdown($business_id, false);
    
    $correspondents = User::forDropdown($business_id, false);
    
    return view('eventbooking.index', compact('business_locations', 'customers', 'correspondents'));
    }
    
    public function show($id)
    {
        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');
            $eventbooking = EventBooking::find($id);
            $eventMenu = $eventbooking->eventMenu;
            $customer_id = $eventMenu->transaction->contact_id;
            $customer_name = Contact::find($customer_id)->name;
            // dd($customer_name);
                return view('eventbooking.show', compact('eventbooking','eventMenu','customer_name'));
            }
    }
}
