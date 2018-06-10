@extends('layouts.master')


@section('content')

<h1> Create new company / branch </h1>

<hr/>
    @include('flash::message')
    @include('errors.errors')

    {!! Form::open(array('action' => 'MainController@postCreateCompany', 'class' => 'form', 'id' => 'create_company' , 'method' => 'post', 'files' => true)) !!}

<div>
    
         
        {{ Form::label('co_name', 'Company name') }} 
        {{ Form::text('co_name', null, ['class' => 'form-control', 'required']) }} <br>
        
        {{ Form::label('co_email', 'Email') }} 
        {{ Form::email('co_email', null, ['class' => 'form-control', 'required']) }} <br>
        
        {{ Form::label('resp_person', 'Responsible person') }} 
        {{ Form::text('resp_person', null, ['class' => 'form-control', 'required']) }} <br>
        
        {{ Form::label('tel_no', 'Telephone') }} 
        {{ Form::text('tel_no', null, ['class' => 'form-control', 'required', ' maxlength' => '12']) }} <br>
        
        {{ Form::label('web_p', 'Web page') }} 
        {{ Form::text('web_p', null, ['class' => 'form-control', 'id' => 'web_p']) }} <br>
        
        {{ Form::label('address', 'Address') }} 
        {{ Form::text('address', null, ['class' => 'form-control', 'required']) }} <br>  
        
        {{ Form::label('town', 'Town') }} 
        <div style="display: inline-block;">
            @include('partials.towns_create_cmp')
        </div>
        <div id="town_to_show" style="display: inline-block;"> Select the town</div>
        <input hidden="true" value="{{ old('town') }}" id="town" name="town"/>
        <br><br>
        
        {{ Form::label('wh_from', 'Work hours from') }} 
        {{ Form::time('wh_from','10:00', ['class' => 'form-control', 'required']) }} <br>
        
        {{ Form::label('wh_to', 'Work hours to') }} 
        {{ Form::time('wh_to','22:00', ['class' => 'form-control', 'required']) }} <br>
        
        {{ Form::label('notes', 'Notes') }} 
        {{ Form::textarea('notes'), ['class' => 'form-control']}} <br>
        
    
</div>

<div>Photos</div> <br>
            
<input id="img_q" name="img_q" value="1" hidden="true">

<div id="images_upload_container">
        <div class="row">
           <div class="col-md-3">
           {!! Form::label('image1', 'Image 1') !!}
           {!! Form::file('image1', null, array('required', 'class'=>'form-control file_1')) !!}
           </div>
        </div>
       <br>

       
    </div>
    
<a id="add_image_upload" class="btn btn-info" value="add_img" style="margin-bottom: 20px"> Add one more image</a> <br>

{!! Form::submit('Save', array('class'=>'btn btn-primary')) !!}

{!! Form::close() !!}



<script>
    


    var img_q = 1;
    $('#add_image_upload').on('click', function(){
        
        if(img_q < 10){
            img_q ++;
            console.log(img_q);

            $('#images_upload_container').append('<div class="row" id="row-' + img_q + '">  <div class="col-md-3">{!! Form::label("image' + img_q + '", "Image", array("class" => "label_1")) !!}{!! Form::file("image", null, array("required", "class"=>"form-control file_1")) !!}  </div></div> <br><br>');
            $('#row-'+img_q).find('.label_1').html('Image '+img_q);
            $('#row-'+img_q).find("input[name='image']").attr('name', 'image'+img_q);
            $('#row-'+img_q).find("input[name='main_pht']").attr('value', img_q);
            $('#img_q').attr('value', img_q);
            
        }else{
//            $('#images_upload_container').append('Max 10 images allowed!');
            alert('Max 10 images allowed!');
        }
        
    });
    
    $('.m-r-sm').on('click', function(){
	var town = $(this).parent().attr('href').replace('#', '');
        var town_to_show = $(this).text();
	$('#town').attr('value', town);
        $('#town_to_show').html(town_to_show);
        });
        
       


</script>




@endsection