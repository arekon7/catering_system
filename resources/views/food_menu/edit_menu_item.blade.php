@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('flash::message')
@include('errors.errors')
@include('tables.scripts') 

<div id="form-errors"></div>


     <h1>Edit menu item</h1>
     <hr/>

     {!! Form::open(array('class' => 'form', 'files' => true)) !!}

     <div class="form-group">
        {!! Form::label('item_name', 'Item name:') !!}
        {!! Form::text('item_name', $menu_item->item, ['id' => 'item_name', 'class' => 'form-control', 'required']) !!}
     </div>

     <div class="form-group">
        <label>Food category</label>
        <select id="category" name="category" class="form-control" value="3">
            @foreach($categories as $category)
                <option value="{{ $category->id }}"> {{ $category->category }}</option>
            @endforeach
        </select>
    </div>
     
     <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" rows="3" name="description" id="description">{{ $menu_item->description }}</textarea>
    </div>
     
     <div class="form-group">
        {!! Form::label('item_price', 'Price EUR :') !!}
        <!--<span class="input-group-addon"><i class="fa fa-eur"></i></span>-->
        {!! Form::number('item_price', $menu_item->price, ['class' => 'form-control', 'id' => 'item_price', 'min' => '0', 'value' => '0', 'step' => '.01', 'required']) !!}
     </div>
     
     <div class="form-group">
         <input type="button" id="update_menu_item" class="btn btn-primary" value="Update item"> &nbsp;&nbsp;&nbsp;
        <input type="button" id="back_from_update" value="Back"class="btn btn-danger"  onclick="window.history.back();">
     </div>
     
       {!! Form::close() !!}


    <script>

        document.getElementById("category").value = <?php echo $menu_item->category_id ?>
    //------------------- Update schema ----------------------
    $('#update_menu_item').on('click', function(){

            var item_name = $('#item_name').val();
            var category = $('#category').val();
            var description = $('#description').val();
            var item_price = $('#item_price').val();
            var item_id = <?php echo $menu_item->id ?>
            

               $.ajax({  
                   data: {  item_name: item_name,
                            category: category,
                            description: description,
                            item_price: item_price,
                            item_id: item_id
                   },
                   type: "POST",
                   url: $('.updateMenuItem_url').val(), 
                   beforeSend: function (xhr) {
                       var token = $('meta[name="csrf-token"]').attr('content');
                       if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                   },
                   success: function(result) {
                       console.log('Ok');
                       console.log(result);
                       window.location.replace("{{ route('menu_management') }}");
                   },
                   error: function(result) {
                       console.log('Error');
                       console.log(JSON.stringify(result));
                       console.log($.parseJSON(result.responseText));
                       if(result.status === 422) {
                            var errors = $.parseJSON(result.responseText);
                            errorsHtml = '<div class="alert alert-danger"><ul>';

                            $.each( errors, function( key, value ) {
                                    errorsHtml += '<li>' + value + '</li>'; 	// showing errors
                            });
                            errorsHtml += '</ul></div>';

                            $( '#form-errors' ).html( errorsHtml ); 	// appending to a <div id="form-errors"></div> inside form 
                            
                        } else {
                            // Error
                            // Incorrect credentials
                             alert('Incorrect credentials. Please try again.');
                        }
                   }

               });
               
//               flash('Successfully updated!', 'success');
//               window.location.replace('/menu_management/');
         });





    </script>
                
</html>

@endsection