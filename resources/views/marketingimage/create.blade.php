@extends('layouts.master')

@section('content')

    {!! Breadcrumb::withLinks(['Home' => route('main'), 'marketing images' => '/marketingimage', 'create']) !!}

     <h1>Upload a Photo </h1>


     <hr/>

     @include('flash::message')
     @include('errors.errors')


    {!! Form::open(array('route' => 'marketingimage.store', 'class' => 'form', 'files' => true)) !!}

     <!-- image name Form Input -->
     <div class="form-group">
        {!! Form::label('image name', 'Image name:') !!}
        {!! Form::text('image_name', null, ['class' => 'form-control']) !!}
     </div>


     <!-- mobile_image_name Form Input -->
     <div class="form-group">
        {!! Form::label('mobile_image_name', 'Mobile Image Name:') !!}
        {!! Form::text('mobile_image_name', null, ['class' => 'form-control']) !!}
     </div>


     <!-- is_something Form Input -->
     <div class="form-group">
        {!! Form::label('is_active', 'Is Active:') !!}
        {!! Form::checkbox('is_active') !!}
     </div>

     <!-- is_featured Form Input -->
     <div class="form-group">
        {!! Form::label('is_featured', 'Is Featured:') !!}
        {!! Form::checkbox('is_featured') !!}
     </div>

    <!-- form field for file -->
    <div class="form-group">
       {!! Form::label('image', 'Primary Image') !!}
       {!! Form::file('image', null, array('required', 'class'=>'form-control')) !!}
    </div>

     <!-- form field for file -->
     <div class="form-group">
        {!! Form::label('mobile_image', 'Mobile Image') !!}
        {!! Form::file('mobile_image', null, array('required', 'class'=>'form-control')) !!}
     </div>

     <div class="form-group">

        {!! Form::submit('Upload Photo', array('class'=>'btn btn-primary')) !!}

     </div>

    {!! Form::close() !!}

@endsection