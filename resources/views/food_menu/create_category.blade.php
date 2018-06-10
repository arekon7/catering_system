@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('tables.scripts')            

{!! Breadcrumb::withLinks(['Main Page' => route('main'), 'Menu management' => route('menu_management'), 'Categories' => route('food_category_management') , 'Create new category']) !!}

     <h1>New food category</h1>

     <hr/>

     @include('flash::message')
     @include('errors.errors')

    {!! Form::open(array('class' => 'form', 'files' => true)) !!}
    
    <div class="form-group">
        {!! Form::label('food_category', 'Category name:') !!}
        {!! Form::text('food_category', null, ['class' => 'form-control', 'required']) !!}
    </div>
    
     <div class="form-group">
        <!--{!! Form::submit('Save', array('class'=>'btn btn-primary', 'id' => 'save_category')) !!}-->
        <input type="button" id="save_category" value="Save" class="btn btn-primary">
        <input type="button" id="back_from_update" value="Back" class="btn btn-danger" onclick="window.history.back();"> &nbsp;&nbsp;&nbsp;
     </div>
    {!! Form::close() !!}

              
      <script>           
//------------------- Save cat ----------------------
    $('#save_category').on('click', function(){

        var food_category = $('#food_category').val();
           if (food_category === ''){
               alert('Enter category name');
               return false;
           }

           $.ajax({  
               data: {  food_category: food_category
               },
               type: "POST",
               url: $('.create_food_category_url').val(),
               beforeSend: function (xhr) {
                   var token = $('meta[name="csrf-token"]').attr('content');
                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
               },
               success: function(result) {
                   console.log('Ok');
                   console.log(result);
                   window.location.replace(resut['route']);
               },
               error: function(result) {
                   console.log('Error');
//                               console.log(data);
                   console.log("Error: " + JSON.stringify(result));
               }
           });
               
//                flash('Successfully created!', 'success');

       }); 



    </script>
                
@endsection
