@extends('layouts.master')

@section('content')
    <!--<form action="{{ route('signup') }}" method="post" class="form">-->
    {!! Form::open(array('route' => 'signup', 'method' => 'post', 'class' => 'form', 'files' => true)) !!}  

        
        <div class="row">
            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="first_name" class="control-label">First Name</label>
                    <input type="text" class="form-control" id="first_name" name="first_name">
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group label-floating">
                    <label for="last_name" class="control-label">Last Name</label>
                    <input type="text" class="form-control" id="last_name" name="last_name">
                </div>
            </div>    
        </div>    
            
        <div class="input-group">
            <label for="email">E-Mail</label>
            <input type="email" id="email" name="email">
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password">
        </div>
        {!! csrf_field() !!}
        
        {!! Form::label('is_company', 'Your account type:'); !!}
        <p> {!! Form::radio('is_company', 0, true, array('id'=>'is_company')); !!} Personal
        <p> {!! Form::radio('is_company', 1, false, array('id'=>'is_company')); !!}  Company </p>
        
        
        <div id="company_form" class="company_form" hidden>
            
            {!! Form::label('company_name', 'company name') !!}
            {!! Form::text('company_name') !!}

            {!! Form::label('resp_person', 'resp person') !!}
            {!! Form::text('resp_person') !!}

            {!! Form::label('web_page', 'web page') !!}
            {!! Form::text('web_page') !!}

            {!! Form::label('tel_no', 'tel no') !!}
            {!! Form::text('tel_no') !!}

            {!! Form::label('work_hours_from', 'work hours from') !!}
            {!! Form::text('work_hours_from') !!}

            {!! Form::label('work_hours_to', 'work hours to') !!}
            {!! Form::text('work_hours_to') !!}

            {!! Form::label('address', 'address') !!}
            {!! Form::text('address') !!} <br>
            
            <div class="row">
                <div class="col-md-3">
                {!! Form::label('image1', 'Image 1') !!}
                {!! Form::file('image1', null, array('required', 'class'=>'form-control')) !!}
                </div>
                <div class="col-md-3">
                {!! Form::label('main_pht', 'Make this main photo') !!}
                {!! Form::radio('main_pht', 1, true) !!}
                </div>
             </div>
            <br>
            
            <div class="row">
                <div class="col-md-3">
                {!! Form::label('image2', 'Image 2') !!}
                {!! Form::file('image2', null, array('required', 'class'=>'form-control')) !!}
                </div>
                <div class="col-md-3">
                {!! Form::label('main_pht', 'Make this main photo') !!}
                {!! Form::radio('main_pht', 2) !!}
                </div>
             </div>
            <br>
            
            <div class="row">
                <div class="col-md-3">
                {!! Form::label('image3', 'Image 3') !!}
                {!! Form::file('image3', null, array('required', 'class'=>'form-control')) !!}
                </div>
                <div class="col-md-3">
                {!! Form::label('main_pht', 'Make this main photo') !!}
                {!! Form::radio('main_pht', 3) !!}
                </div>
             </div>
            <br>
        
        </div>
        
        <button type="submit">Sign Up</button>
        
    {!! Form::close() !!}
    </form>

<script>
$('input[type=radio][name=is_company]').change(function(){
    $is_checked = $('input[name=is_company]:checked').val();
    console.log($is_checked);
    if($is_checked == 1){
        $('#company_form').fadeIn();
    }else{
        $('#company_form').fadeOut();
    }
    
});


</script>





@endsection