<?php
use App\Role;
use App\User;
use Illuminate\Support\Facades\Auth;
?>

@extends('layouts.master')


@section('content')

@include('partials.flash_message')

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            My orders
                        </div> <!--/.panel-heading--> 
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="orders_table">
                                <thead>
                                    <tr>
                                        <th>Company</th>
                                        <th>Schema</th>
                                        <th>Table no</th>
                                        <th>Time to arrive</th>
                                        <th>Notes</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th>Cancel</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($bookings as $booking)
                                        <tr id="booking_row-{{ $booking->tb_id }}">
                                            <td>  {{ $booking->co_name }} </td>
                                            <td>  <a href="{{ route('show_schema', ['id' => $booking->ts_id]) }}">{{ $booking->schema_name }} </a> </td>
                                            <td>  {{ $booking->table_no }} </td>
                                            <td>  {{ $booking->time }} </td>
                                            <td>  {{ $booking->notes }} </td>
                                            <td>  @if($booking->status == 0) Active @else Completed @endif </td>
                                            <td>  {{ $booking->created_at }} </td>
                                            <td>  <button type="button" class="btn btn-danger btn-xs delete_booking" value="{{ $booking->tb_id }}" id="delete_booking-{{ $booking->tb_id }}">Cancel booking</button> </td>

                                            

                                        </tr>
                                    @endforeach
                                    
                                </tbody>
                            </table>
                             <!--/.table-responsive--> 
                        <input type="button" id="back_from_update" value="Back" class="btn btn-danger" onclick="window.history.back();">
                        </div>
                         <!--/.panel-body--> 
                         
                    </div>
                     <!--/.panel--> 
                
                </div>
                 <!--/.col-lg-12--> 
                 
            </div>


<script>
 $(document).ready(function() {
        $('#orders_table').DataTable({
            responsive: true
        });
    });
    
    $(document).ready(function() {
        $('#table_id').DataTable({
            responsive: true
        });
    });
    
    $('.delete_booking').on('click', function(){
                 
            var confirmation = confirm('Ar you sure want to cancel booking?');     
              
            if(confirmation){  
                var booking_id = $(this).val();
                console.log($(this).val());

               $.ajax({  
                   data: {  
                       booking_id: booking_id
                   },
                   type: "POST",
                   url: $('.delete_booking_url').val(), 
                   beforeSend: function (xhr) {
                       var token = $('meta[name="csrf-token"]').attr('content');
                       if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                   },
                   success: function(result) {
                       console.log('Ok');
                       console.log(result);
    //                   $('#booking_row-'+booking_id).hide();
                       $('#booking_row-'+booking_id).empty();
                       $('#booking_row-'+booking_id).html('<div class="alert alert-info"><b>Canceled<b></div>');
                   },
                   error: function(result) {
                       console.log('Error');
                       console.log("Error: " + JSON.stringify(result));
    //                   alert("Error! Try again!");
                   }
               });
           }
        });
    
    
    
</script>





@endsection