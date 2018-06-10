@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('tables.scripts')            
           
		<!-- drag container -->
		<div id="redips-drag">

                        <div class="row"style="display: flex; align-items: center; justify-content: center; margin-top: 1%;">   
                            <div class="col-md-7" style="text-align: center;">
                            <div class="form-group label-floating">
                                <label for="schema_name">Schema name</label><nbsp>
                                <input type="text" id="schema_name" value="" class="form-control">
                            </div>
                        </div>
                        </div>
                    
                        
                            
			<table id="table1">
				<colgroup>
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
                                        <tr><td></td><td></td><td></td><td id="lastCell"></td></tr>
				</tbody>
			</table>
                
                    <div class="row"style="display: flex; align-items: center; justify-content: center; margin-top: 3%;">   
                        <div class="col-md-7" style="text-align: center;">      
                            <input type="button" id="save_schema" value="Save schema" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;
                            <input type="button" id="back_from_update" value="Back" onclick="window.history.back();" class="btn btn-danger"> &nbsp;&nbsp;&nbsp;
                        </div>
                    </div> 
                </div>
		<!-- jQuery dialog -->
		<div id="dialog" title="jQuery dialog">Please choose action!</div>
                
                <?php
//                $session_data = Session::all();
//                dd($session_data);
                ?>
                
                
                <script>

                    redips.targetTable = document.getElementById('table2');
//                    attachImagesToCells(13);
                    for(i = 1; i <= 13; i++){
                        $('.table_cr'+i).prepend($('<img>',{id:'theImg',src:'{{ URL::to("/imgs/") }}/tables_types/table_cr'+i+'.jpg', height:'70', width:'70'}));
                    } 
                    
                    $("#show_coord").on('click', function(){
                        var table_content = $.parseJSON(REDIPS.drag.saveContent('table2', 'json'));
//                        var table_content = REDIPS.drag.saveContent('table2');
                        console.log(table_content);
 
                    });
                    
                    $("#load_content").on('click', function (){ 
                        // prepare JSON data to place to the HTML table
//                        var table_content = $.parseJSON(REDIPS.drag.saveContent('table2', 'json'));
                        var table_content = document.getElementById('load_content_text').value;
                        // place content to the table
                        REDIPS.drag.loadContent('table2', table_content);
                    });
                    
                    
//------------------- Save schema ----------------------
                $('#save_schema').on('click', function(){

                        var table_content = $.parseJSON(REDIPS.drag.saveContent('table2', 'json'));
                        table_content = JSON.stringify(table_content);
                        var schema_name = $('#schema_name').val();

                           if(table_content === 'null'){
                               alert('Table schema is empty! Nothing to save.');
                               return false;
                           }  else if (schema_name === ''){
                               alert('Enter schema name');
                               return false;
                           }

                           $.ajax({  
                               data: {  table_content: table_content, 
                                        schema_name: schema_name 
                               },
                               type: "POST",
                               url: $('.createschema_url').val(), 
                               beforeSend: function (xhr) {
                                   var token = $('meta[name="csrf-token"]').attr('content');
                                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                               },
                               success: function(result) {
                                   console.log('Ok');
                                   console.log(result);
//                                   window.location.replace(route);
                                    window.location.replace(result['route']);
                               },
                               error: function(result) {
                                   console.log('Error');
                                   console.log("Error: " + JSON.stringify(result));
                               }
                           });
//                           window.location.replace('{{ route("all_my_schemas") }}');

                       }); 
                       
       
       
                    
                </script>
                
@endsection
