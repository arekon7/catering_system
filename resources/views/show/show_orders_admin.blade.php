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
                            All Orders
                        </div> <!--/.panel-heading--> 
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="orders_table">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Menu Item</th>
                                        <th>Category</th>
                                        <th>Quantity</th>
                                        <th>Company name</th>
                                        <th>Status</th>
                                        <th>Delete</th>
                                        <th>Tel</th>
                                        <th>Address</th>
                                        <th>Orderer Name <br> Last Name</th>
                                        <th>Email</th>
                                        <th>Created</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orders as $order)
                                        <tr id="order_row-{{ $order->id }}" >
                                            <td>  {{ $order->id }} </td>
                                            <td>  {{ $order->item }} </td>
                                            <td>  {{ $order->category }} </td>
                                            <td>  {{ $order->quantity }} </td>
                                            <td>  {{ $order->co_name }} </td>
                                            <td>  <div id="status-{{ $order->id }}">@if($order->status == 0) Active @else Completed @endif</div><button type="button" class="btn btn-primary btn-xs change_order_status" value="{{ $order->id }}" id="change_book_status">Change status</button> </td>
                                            <td>  <button type="button" class="btn btn-danger btn-xs delete_order" value="{{ $order->id }}" id="delete_order-{{ $order->id }}">Delete</button> </td>
                                            <td>  {{ $order->tel_no }} </td>
                                            <td>  {{ $order->address }} </td>
                                            <td>  {{ $order->first_name }} <br> {{ $order->last_name }} </td>
                                            <td>  {{ $order->email }} </td>
                                            <td>  {{ $order->created_at }} </td>

                                        </tr>
                                    @endforeach
                                    
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
        $('#orders_table').DataTable({
            responsive: true
        });
    });
    
    $(document).ready(function() {
        $('#table_id').DataTable({
            responsive: true
        });
    });
    
     $('.change_order_status').on('click', function(){
                 
            var order_id = $(this).val();

           $.ajax({  
               data: {  
                   order_id: order_id
               },
               type: "POST",
               url: $('.change_order_status_url').val(),  
               beforeSend: function (xhr) {
                   var token = $('meta[name="csrf-token"]').attr('content');
                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
               },
               success: function(result) {
//                   console.log('Ok');
//                   console.log(result);
                   $('#status-'+order_id).html(result['order_status']);
               },
               error: function(result) {
                   console.log('Error');
                   console.log("Error: " + JSON.stringify(result));
//                   alert("Error! Try again!");
               }
           });
        });
        
        $('.delete_order').on('click', function(){
            
            var confirmation = confirm('Ar you sure want to delete?');
              
            if(confirmation) {  
                var order_id = $(this).val();
    //            console.log($(this).val());

               $.ajax({  
                   data: {  
                       order_id: order_id
                   },
                   type: "POST",
                   url: $('.delete_order_url').val(), 
                   beforeSend: function (xhr) {
                       var token = $('meta[name="csrf-token"]').attr('content');
                       if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                   },
                   success: function(result) {
                       console.log('Ok');
                       console.log(result);
    //                   $('#booking_row-'+booking_id).hide();
                       $('#order_row-'+order_id).empty();
                       $('#order_row-'+order_id).html('<div class="alert alert-info"><b>Deleted<b></div>');
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