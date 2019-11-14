<table class="table bg-gray">
        <tr class="bg-green">
        <th>#</th>
        <th>Name</th>
        <th>Type</th>
        <th>Venue</th>
        <th>Attendences</th>
        <th>Booking Time</th>
        <th>Event Time</th>
    </tr>
    <tr>
        <td></td>
        <td>{{ $eventMenu->name }}</td>
        <td>{{ $eventMenu->type }}</td>
        <td>{{ $eventMenu->venue }}</td>
        <td>{{ $eventMenu->attendences }}</td>
        <td>{{ $eventMenu->booking_time }}</td>
        <td>{{ $eventMenu->event_time }}</td>
    </tr>  
    
    <tr class="bg-green">
        <th>name</th>

    </tr>
    @foreach($items as $item)
    <tr>
    <td> {{$item->name}}</td>
    </tr>
    @endforeach

</table>