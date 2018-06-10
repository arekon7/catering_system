@extends('layouts.master')

@section('content')

    {!! Breadcrumb::withLinks(['Main Page' => route('main'), 'Menu management' => route('menu_management'), 'Create new menu item']) !!}

     <h1>New menu item</h1>


     <hr/>

     @include('flash::message')
     @include('errors.errors')


    {!! Form::open(array('action' => 'FoodMenuCtrl@createMenuEntry', 'class' => 'form', 'files' => true)) !!}

     <!-- image name Form Input -->
     <div class="form-group">
        {!! Form::label('item_name', 'Item name:') !!}
        {!! Form::text('item_name', null, ['class' => 'form-control', 'required']) !!}
     </div>

     <div class="form-group">
        <label>Food category</label>
        <select id="category" name="category" class="form-control" required="true">
            @foreach($categories as $category)
                <option value="{{ $category->id }}"> {{ $category->category }}</option>
            @endforeach
        </select>
    </div>
     
     <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" rows="3" name="description" id="description"></textarea>
    </div>
     
     <div class="form-group">
        {!! Form::label('item_price', 'Price EUR :') !!}
        <!--<span class="input-group-addon"><i class="fa fa-eur"></i></span>-->
        {!! Form::number('item_price', null, ['class' => 'form-control', 'min' => '0', 'value' => '0', 'step' => '.01', 'required']) !!}
     </div>


     <div class="form-group">

        {!! Form::submit('Save', array('class'=>'btn btn-primary')) !!}

     </div>

    {!! Form::close() !!}

@endsection 