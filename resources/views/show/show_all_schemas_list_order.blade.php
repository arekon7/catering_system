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
                            Table schemas
                        </div> <!--/.panel-heading--> 
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="menu_table">
                                <thead>
                                    <tr>
                                        <th>Schema</th>
                                        
                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($schemas as $schema)
                                        <tr>
                                            <td> <a href="{{ route('show_schema_order', ['id' => $schema->id]) }}"> {{ $schema->schema_name }} </a>  </td>

                                        </tr>
                                    @endforeach
                                    
                                    

                                    <!--deleteschema-->
                                    
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
    
   
</script>





@endsection