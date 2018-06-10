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
                            Table bookings
                        </div> <!--/.panel-heading--> 
                        <div class="table-buttons-top"> 
                            @if(Auth::check()) @if(Auth::user()->hasRole('Company'))
                            @endif @endif
                        </div>
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="menu_table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Table#</th>
                                        <th>Schema</th>
                                        <th>Company</th>
                                        <th>Orderer</th>
                                        <th>Time</th>
                                        <th>Tel# <br> Email</th>
                                        <th>Status</th>
                                        <th>Notes</th>
                                        <th>Created at</th>
                                            @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company']) )
                                        <th>Delete</th> 
                                            @endif @endif 
                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($bookings as $booking)
                                    <tr id="booking_row-{{ $booking->id }}">
                                            <td>  {{ $booking->id }} <input value="{{ $booking->id }}" id="booking_id" hidden="true"> </td>
                                            <td>  {{ $booking->table_no }} </td>
                                            <td>  <a href="{{ route('show_schema', ['id' => $booking->t_id]) }}">{{ $booking->schema_name }} </a> </td>
                                            <td>  {{ $booking->co_name }} </td>
                                            <td>  {{ $booking->first_name }} <br>{{ $booking->last_name }} </td>
                                            <td>  {{ $booking->time }} </td>
                                            <td>  {{ $booking->tel_no }} <br> {{ $booking->email }} </td>
                                            <td>  <div id="status-{{ $booking->id }}">@if($booking->status == 0) Active @else Completed @endif</div><button type="button" class="btn btn-primary btn-xs change_book_status" value="{{ $booking->id }}" id="change_book_status">Change status</button> </td>
                                            <td>  {{ $booking->notes }} </td>
                                            <td>  {{ $booking->created_at }} </td>
                                            <td>  <button type="button" class="btn btn-danger btn-xs delete_booking" value="{{ $booking->id }}" id="delete_booking-{{ $booking->id }}">Delete</button> </td>
                                            
                                          

                                        </tr>
                                    @endforeach
                                    
                                    

                                    <!--deleteschema-->
                                    
                                </tbody>
                            </table>
                             <!--/.table-responsive--> 
                        </div>
                         <!--/.panel-body--> 
                    </div>
                     <!--/.panel--> 
                </div>
                 <!--/.col-lg-12--> 
            </div>


<script>
    $(document).ready(function() {
        $('#menu_table').DataTable({
            responsive: true
        });
    });
    
    $(document).ready(function() {
        $('#table_id').DataTable({
            responsive: true
        });
    });

     function ConfirmDelete()
       {
           var x = confirm("Are you sure you want to delete?");
           if (x)
               return true;
           else
               return false;
       }
    
    $('.change_book_status').on('click', function(){
                 
            var booking_id = $(this).val();

           $.ajax({  
               data: {  
                   booking_id: booking_id
               },
               type: "POST",
               url: $('.change_booking_status_url').val(), 
               beforeSend: function (xhr) {
                   var token = $('meta[name="csrf-token"]').attr('content');
                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
               },
               success: function(result) {
//                   console.log('Ok');
//                   console.log(result);
                   $('#status-'+booking_id).html(result['booking_status']);
               },
               error: function(result) {
                   console.log('Error');
                   console.log("Error: " + JSON.stringify(result));
//                   alert("Error! Try again!");
               }
           });
        });
        
        $('.delete_booking').on('click', function(){
                 
            var confirmation = confirm('Ar you sure want to delete?');     
              
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
                       $('#booking_row-'+booking_id).html('<div class="alert alert-info"><b>Deleted<b></div>');
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