@extends('layouts.master')

@section('content')

@include('partials.errors_messages')

<h1>{{ 'Registration'}}</h1> <br>

    <!--<form action="{{ route('signup') }}" method="post" class="form">-->
    {!! Form::open(array('route' => 'signup', 'method' => 'post', 'class' => 'form', 'files' => true)) !!}  

        
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="first_name" class="control-label">First Name</label>
                    <input type="text" class="form-control" id="first_name" value="{{ old('first_name') }}" name="first_name" required="ture">
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="last_name" class="control-label">Last Name</label>
                    <input type="text" class="form-control" id="last_name" value="{{ old('last_name') }}" name="last_name" required="ture">
                </div>
            </div>    
        </div>    
        
        <div class="row">   
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="email">E-Mail</label>
                    <input type="email" id="email" name="email" class="form-control" value="{{ old('email') }}" required="true" required="ture">
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" value="{{ old('password') }}" required="ture">
                </div>

            </div> 
        </div> 
    
         <!-------------------------->
         
          <div class="row">   
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="tel_no">Telephone number</label>
                    <input type="text" id="tel_no" name="tel_no" class="form-control" value="{{ old('tel_no') }}" maxlength="12" required="ture">
                </div>
            </div>
            
        </div> 
         
         <!-------------------------->
        {!! csrf_field() !!}
        
          <br>  
            
        {!! Form::label('acc_type', 'Your account type:'); !!}
        <p> {!! Form::radio('acc_type', 0, true, array('id'=>'acc_type')); !!} Personal
        <p> {!! Form::radio('acc_type', 1, false, array('id'=>'acc_type')); !!}  Catering company </p> <br>
       
        <div id="company_form" class="company_form" hidden>
            <div class="alert alert-info">
                You will be able to create your company after completing registration in <b>My companies tab</b> ! 
            </div>
            <br>
        </div>
        
        
        <button class="btn btn-primary" type="submit">Register</button>
        
    {!! Form::close() !!}
    </form>

<script>
$('input[type=radio][name=acc_type]').change(function(){
    $is_checked = $('input[name=acc_type]:checked').val();
    console.log($is_checked);
    if($is_checked == 1){
        $('#company_form').fadeIn();
    }else{
        $('#company_form').fadeOut();
    }
    
});


</script>





@endsection