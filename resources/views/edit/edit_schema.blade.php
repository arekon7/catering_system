@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('tables.scripts')     
		<!-- drag container -->
                <!--<h3 align="center">Schema name: {{ $schema->schema_name }}</h3>-->
                <div class="form-group center_div">
                    <label for="smth">Schema name: {{ $schema->schema_name }}</label>
                </div>
                
                <div class="form-group center_div">
                    {!! Form::label('new_schema_name', 'New schema name:', ['class' => 'horizontal_lable']) !!}
                    {!! Form::text('new_schema_name', null, ['id' => 'new_schema_name', 'class' => 'form-control', 'placeholder' => 'Leave empty if no changes needed', 'style' => 'width: 276px']) !!}
                </div>
                
		<div id="redips-drag">
                            
			<table id="table1">
				<colgroup>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
                                        <col width="100"/>
                                        <col width="100"/>
				</colgroup>
				<tbody>
					@include('tables.table_types')
				</tbody>
			</table>
                        <table id="trash-table">
                            <tr>
                                <td class="redips-trash">Trash</td>
                            </tr>

                        </table>
			<!-- table2 -->
			<table id="table2">
				<colgroup>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<tbody>
					@for($i = 0; $i < 7; $i++)
					<tr>
                                            @for($j = 0; $j < 7; $j++)
                                                <td></td>
                                            @endfor
                                        </tr>
                                        @endfor
                                        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td id="lastCell"></td></tr>
				</tbody>
			</table>
                    <div id="buttons_bottom" style="margin: 5% 0 0 20%">        
                        <input type="button" id="update_schema" value="Update schema" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;
                        <input type="button" id="back_from_update" value="Back" class="btn btn-danger" onclick="window.history.back();">
                    </div>
		</div>
                
                 
                
		<!-- jQuery dialog -->
		<div id="dialog" title="jQuery dialog">Please choose action!</div>
		<!-- instructions -->
		
                <?php // var_dump($schema); ?>
                <?php // echo 'ok'; ?>
                
                <script>
                    
                    redips.targetTable = document.getElementById('table2');
                    var table_content = <?php echo json_encode($schema); ?>;
                    
//                    console.log(table_content);
//                    var schema_id = table_content['id'];
//                    console.log(schema_id);
                    
                     //on load (page)    
                    $(function() {
                        // place content to the table
                        REDIPS.drag.loadContent(redips.targetTable, table_content['table_coord']);
//                        console.log(table_content);
                     });
                    
                    $("#show_coord").on('click', function(){
                        var table_content = $.parseJSON(REDIPS.drag.saveContent(redips.targetTable, 'json'));
//                        var table_content = REDIPS.drag.saveContent('table2');
                        
 
                    });
                    
                    $("#load_content").on('click', function (){ 
                        // prepare JSON data to place to the HTML table
//                        var table_content = $.parseJSON(REDIPS.drag.saveContent('table2', 'json'));
                        var table_content = document.getElementById('load_content_text').value;
                        // place content to the table
                        REDIPS.drag.loadContent(redips.targetTable, table_content);
                    });
                    
                    
                //------------------- Update schema ----------------------
                $('#update_schema').on('click', function(){

                        var table_content_to_save = $.parseJSON(REDIPS.drag.saveContent(redips.targetTable, 'json'));
                        table_content_to_save = JSON.stringify(table_content_to_save);
                        var schema_id = table_content['id'];
//                        console.log(table_content_to_save);
                        var new_schema_name = $('#new_schema_name').val();
                        console.log(new_schema_name);

                           if(table_content_to_save === 'null'){
                               alert('Table schema is empty! Nothing to save.');
                               return false;
                           }

                           $.ajax({  
                               data: {  table_content: table_content_to_save,
                                        schema_id: schema_id,
                                        new_schema_name: new_schema_name
                //                        item_id: item_id, 
                               },
                               type: "POST",
                               url: $('.updateschema_url').val(),  
                               beforeSend: function (xhr) {
                                   var token = $('meta[name="csrf-token"]').attr('content');
                                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                               },
                               success: function(result) {
                                   console.log('Ok');
                                   console.log(result);
                                   window.location.replace(result['route']);
                               },
                               error: function(result) {
                                   console.log('Error');
                                   console.log("Error: " + JSON.stringify(result));
                               }

                           });
                           
                           window.location.replace('{{ route("all_my_schemas") }}');
                     });
                     
                     
                    
                    
                    
                </script>
                
	</body>
</html>

@endsection