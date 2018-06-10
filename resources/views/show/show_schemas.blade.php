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
                        <div class="table-buttons-top"> 
                            @if(Auth::check()) @if(Auth::user()->hasRole('Company'))
                                <button type="button" class="btn btn-primary btn-outline" onclick="window.location.href='{{ route('tables_map') }}'">Create new table schema</button>
                            @endif @endif
                            <!--<button type="button" class="btn btn-outline btn-primary">Primary</button>-->

                        </div>
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="schemas_table">
                                <thead>
                                    <tr>
                                        <th>Schema name</th> 
                                        <th>Created at</th> 
                                        <th>Updated at</th> 
                                        @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company']) ) <th>Edit</th>  <th>Delete</th> @endif @endif 
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($schemas as $schema)
                                        <tr>
                                            <td> <a href="{{ route('show_schema', [$schema->id]) }}">  {{ $schema->schema_name }} </a> </td>
                                            <td>  {{ $schema->created_at }} </td>
                                            <td>  {{ $schema->updated_at }} </td>
                                            
                                            @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company'])) <td> <a href="{{ route('edit_schema', [$schema->id]) }}"> 
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> Edit </a> </td>
                                            
                                            <td>
                                           <!--<a href="/delete_schema/{{$schema->id}}" id="delete_schema" data-method="delete" onclick="return confirm('Are you sure?')""> Delete </a>--> 
                                            {{ Form::open(array('route' => ['delete_schema', $schema->id], 'id' => 'delete-schema-form')) }}
                                                {{ method_field('delete') }}
                                                {!! Form::submit('Delete', array('class'=>'btn btn-danger', 'onclick' => 'return ConfirmDelete();')) !!}
                                            {{ Form::close() }}
                                                
                                            </td> 
                                            @endif @endif 

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
        $('#schemas_table').DataTable({
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