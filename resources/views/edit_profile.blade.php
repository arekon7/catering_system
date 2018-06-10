@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('errors.errors')

    <h1>{{ 'Profile '. $user->first_name . ' ' . $user->last_name }}</h1>

<hr/>


    {!! Form::model($user, ['route' => ['profile', $user->id],
    'method' => 'PATCH',
    'class' => 'form',
    'files' => true]
    ) !!}

<div>
    
        {{ Form::label('first_name', 'First Name') }} 
        {{ Form::text('first_name', null, ['required' => 'required']) }} <br>
        
        {{ Form::label('last_name', 'Last Name') }} 
        {{ Form::text('last_name', null, ['required' => 'required']) }} <br>
        
        {{ Form::label('email', 'Email') }} 
        {{ Form::email('email', null, ['required' => 'required']) }} <br>
        
        {{ Form::label('tel_no', 'Telephone number') }} 
        {{ Form::text('tel_no', null, ['required' => 'required', 'maxlength' => '12']) }} <br>
        
        @if(!Auth::user()->hasRole('Admin'))
        {!! Form::label('acc_type', 'Your account type:'); !!}
        <p> {!! Form::radio('acc_type', 0, true, array('id'=>'acc_type')); !!} Personal
        <p> {!! Form::radio('acc_type', 1, false, array('id'=>'acc_type')); !!}  Catering company </p> <br>
        @endif
        
        <div id="company_form" class="company_form" hidden>
            
            <p> You could manage your companies and branches in "My companies" tab after saving settings! </p>
            <br>
        </div>
        
           <!--  {{-- @if($user->acc_type == 1) --}}
            {{ Form::label('co_name', 'Company name') }} 
            {{ Form::text('co_name') }} <br>

            {{ Form::label('resp_person', 'Responsible person') }} 
            {{ Form::text('resp_person') }} <br>

            {{ Form::label('tel_no', 'Telephone') }} 
            {{ Form::text('tel_no') }} <br>

            {{ Form::label('web_p', 'Web page') }} 
            {{ Form::text('web_p') }} <br>

            {{ Form::label('address', 'Address') }} 
            {{ Form::text('address') }} <br>

            {{ Form::label('wh_from', 'Work hours from') }} 
            {{ Form::text('wh_from') }} <br>

            {{ Form::label('wh_to', 'Work hours to') }} 
            {{ Form::text('wh_to') }} <br>
           {{-- @endif --}}

            {{-- @if($user->acc_type == 1) --}}
            @if(isset($images))
                <div>Photos</div> <br>

                @foreach($images as $image)

                    <div>
                        <img src="/imgs/companies/{{ $image->image_name . '.' . $image->image_extension . '?'. 'time='. time() }}" height="400" width="600">
                        {!! Form::label('main_pht', 'Make this main photo') !!}
                        {!! Form::radio('main_pht', $image->image_no) !!}
                    </div>

                    <hr/>
                @endforeach
            @endif
        </div>-->
            
        {!! Form::submit('Save', array('class'=>'btn btn-primary')) !!}

        {!! Form::close() !!}

    
    
</div>

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