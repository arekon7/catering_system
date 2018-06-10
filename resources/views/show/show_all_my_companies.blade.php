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
                            My companies / branches 
                        </div> <!--/.panel-heading--> 
                        <div class="table-buttons-top"> 
                            @if(Auth::check()) @if(Auth::user()->hasAnyRole(['Admin', 'Company']))
                                <button type="button" class="btn btn-primary btn-outline" onclick="window.location.href='{{ route('create_company') }}'">Create new company / branch</button>
                            @endif @endif
                                
                        </div>
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="orders_table">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Company</th>
                                        <th>Actions</th>
                                        <!--<th>Working hours</th>-->
                                        <th>Address</th>
                                        <th>Responsible</th>
                                        <!--<th>Web</th>-->
                                        <th>Tel</th>
                                        @if(Auth::check()) @if(Auth::user()->hasRole('Company')) <th>Delete</th> @endif @endif 
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($companies as $company)
                                        <tr>
                                            <td> <img src="{{ URL::to('/imgs/companies/thumbnails/') }}/thumb-{{ $company->image_name . '.' . $company->image_extension . '?'. 'time='. time() }}"> </td>
                                            <td><a href="{{ route('show_company', ['id' => $company->company_id]) }}">{{ $company->co_name }}</a></td>
                                            @if(Auth::check()) @if(Auth::user()->hasRole('Company')) <td style="text-align: center;"> <a href="{{ route('edit_my_company', ['id' => $company->company_id]) }}" class="btn btn-warning btn-md" style=""> Edit </a>   
                                                <br>  <a href="{{ route('choose_cmp_mng', ['id' => $company->company_id]) }}" id="select_cmp_mng" class="btn btn-primary btn-md" title="Press to swich to this company in this system" style="margin-top: 10%;"> Manage</a></td> @endif @endif 
                                            <!--<td>{{ $company->wh_from }} - {{ $company->wh_to }} </td>-->
                                            <td>{{ $company->address }}</td>
                                            <td>{{ $company->resp_person }}</td>
                                            <!--<td>{{ $company->web_p }}</td>-->
                                            <td>{{ $company->tel_no }}</td>
                                            @if(Auth::check()) @if(Auth::user()->hasRole('Company')) <td>   <a href="{{ route('delete_company', ['id' => $company->company_id]) }}" class="btn btn-danger btn-xs" onclick="confirm('Ar you sure want to delete this company?');"> Delete </a> </td> @endif @endif 
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

<!--<table id="table_id" class="display">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
        <tr>
            <td>Row 2 Data 1</td>
            <td>Row 2 Data 2</td>
        </tr>
    </tbody>
</table>-->

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
</script>





@endsection