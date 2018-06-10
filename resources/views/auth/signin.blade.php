@extends('layouts.master')

@section('content')

@include('partials.flash_message')

    <form action="{{ route('signin') }}" method="post">
    <!--        <div class="row">
        <div class="col-md-3">
        <div class="form-group label-floating">
            <label class="control-label">Username</label>
            <input type="text" class="form-control" >
        </div>
        </div>
    </div>-->
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="email" class="control-label">E-Mail</label>
                    <input class="form-control" type="email" id="email" name="email" value="{{ old('email') }}">
                </div>
            </div>
        </div>
    
    
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="password" class="control-label">Password</label>
                    <input class="form-control" type="password" id="password" name="password" value="{{ old('password') }}">
                </div>
            </div>
        </div>
        {!! csrf_field() !!}
        <button type="submit">Log In</button>
    </form>
@endsection