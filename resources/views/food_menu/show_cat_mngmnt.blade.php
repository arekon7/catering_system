<?php
use App\Role;
use App\User;
use Illuminate\Support\Facades\Auth;
?>

@extends('layouts.master')


@section('content')

@include('partials.flash_message')

{!! Breadcrumb::withLinks(['Main Page' => route('main'), 'Menu management' => route('menu_management'), 'Categories']) !!}


<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Categories
                        </div> <!--/.panel-heading--> 
                        <div class="table-buttons-top"> 
                            @if(Auth::check()) @if(Auth::user()->hasRole('Company'))
                            <button type="button" class="btn btn-primary btn-outline" onclick="window.location.href='{{ route('show_create_food_category') }}'">Create new category</button>
                            @endif @endif
                            <!--<button type="button" class="btn btn-outline btn-primary">Primary</button>-->

                        </div>
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="menu_table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Category</th>
                                        <th>Created at</th>
                                        <th>Updated at</th>
                                            @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company']) )
                                        <th>Edit</th>  
                                        <th>Delete</th> 
                                            @endif @endif 
                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($categories as $category)
                                        <tr>
                                            <td>  {{ $category->id }} </td>
                                            <td>  {{ $category->category }} </td>
                                            <td>  {{ $category->created_at }} </td>
                                            <td>  {{ $category->updated_at }} </td>
                                            
                                            @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company'])) <td> <a href="/edit_category/{{$category->id}}"> 
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> Edit </a> </td>
                                            
                                            <td>
                                            {{ Form::open(array('route' => ['delete_food_cat', $category->id], 'id' => 'delete-category-form')) }}
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