<?php
use App\Role;
use App\User;
use Illuminate\Support\Facades\Auth;
?>

@extends('layouts.master')


@section('content')
<?php
$session_data = Session::all();
//dd($session_data);

?>

@include('partials.flash_message')



<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Catering Companies
                        </div> <!--/.panel-heading--> 
                        <div class="table-buttons-top"> 
                            @if(Auth::check()) @if(Auth::user()->hasRole('Admin'))
                            <a type="button" class="btn btn-primary btn-outline" href="{{ route('create_company') }}">Create new company</a>
                            @endif @endif
                     
                         @include('partials.towns')
                         
                        </div>
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="companies_table">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Company</th>
                                        <th>Working hours</th>
                                        <th>Address</th>
                                        @if(Auth::check()) @if(Auth::user()->hasRole('Admin')) <th>Actions</th> @endif @endif 
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($companies as $company)
                                        <tr>
                                            <td> <img src="{{ URL::to('/imgs/companies/thumbnails/') }}/thumb-{{ $company->image_name . '.' . $company->image_extension . '?'. 'time='. time() }}"> </td>
                                            <td><a href="{{ route('show_company', ['id' => $company->company_id]) }}">{{ $company->co_name }}</a></td>
                                            <td>{{ $company->wh_from }} - {{ $company->wh_to }} </td>
                                            <td>{{ $company->address }} , {{ ucfirst($company->town) }}</td>
                                            @if(Auth::check()) @if(Auth::user()->hasRole('Admin')) <td> <a href="{{ route('edit_company', ['id' => $company->company_id]) }}"> Edit </a>  <a href="{{ route('delete_company', ['id' => $company->company_id]) }}" onclick="confirm('Ar you sure want to delete this company?');"> Delete </a> </td> @endif @endif 

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
        $('#companies_table').DataTable({
            responsive: true
        });
    });
    
    $(document).ready(function() {
        $('#table_id').DataTable({
            responsive: true
        });
    });
    

$('div.alert').not('.alert-important').delay(3000).fadeOut(350);

// $('.m-r-sm').on('click', function(){
//        var town_to_show = $(this).text();
//        $('#town_to_show').html(town_to_show);
//    });

</script>





@endsection