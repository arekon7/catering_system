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
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>E-Mail</th>
                                        <th>User</th>
                                        <th>Company</th>
                                        <th>Admin</th>
                                        <th>Assign</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                            @foreach($users as $user)
                                            <tr>
                                                <form action="{{ route('admin.assign') }}" method="post">
                                                    <td>{{ $user->first_name }}</td>
                                                    <td>{{ $user->last_name }}</td>
                                                    <td>{{ $user->email }} <input type="hidden" name="email" value="{{ $user->email }}"></td>
                                                    <td><input type="radio" name="role" {{ $user->hasRole('User') ? 'checked' : '' }} value="role_user"></td>
                                                    <td><input type="radio" name="role" {{ $user->hasRole('Company') ? 'checked' : '' }} value="role_company"></td>
                                                    <td><input type="radio" name="role" {{ $user->hasRole('Admin') ? 'checked' : '' }} value="role_admin"></td>
                                                    {{ csrf_field() }}
                                                    <td><button type="submit" class="btn btn-primary btn-sm">Assign Role</button></td>
                                                </form>
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
</script>





@endsection


<!------------------------------------->

