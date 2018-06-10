@extends('layouts.master')


@section('content')

@include('partials.flash_message')
@include('tables.scripts')     
		<!-- drag container -->
                <h1 align="center">{{ $schema->schema_name }} Table booking</h1>
                <div id="redips-drag" style="">
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
                    
                @if(Auth::check())    
                <div id="table_reservation" style="">
                        <p> Choose the table by pressing on it.</p> <br>
                         
                       <label for="table_no"> Chosen table:</label>
                       <div style="display: inline" id="table_no"> None </div> <br><br>
                       
                       <div class="row">
                       <div class="col-md-3">
                       <div class="form-group label-floating">
                            <label for="time" class="control-label"> Time</label>
                            <input type="time" id="time" class="form-control">
                        </div>
                        </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label for="first_name" class="control-label">First Name</label>
                                    <input type="text" class="form-control" id="first_name" value="{{ $user->first_name }}" name="first_name" required="true">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label for="last_name" class="control-label">Last Name</label>
                                    <input type="text" class="form-control" id="last_name" value="{{ $user->last_name }}" name="last_name">
                                </div>
                            </div>    
                        </div>   
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label for="tel_no" class="control-label">Tel no</label>
                                    <input type="text" class="form-control" id="tel_no" value="{{ $user->tel_no }}" name="tel_no">
                                </div>
                            </div>

                            <div class="col-md-7">
                                <div class="form-group label-floating">
                                    <label for="email" class="control-label">Email</label>
                                    <input type="email" class="form-control" id="email" value="{{ $user->email }}" name="email">
                                </div>
                            </div>    
                        </div> 

                        
                       <div class="form-group col-lg-9" style="margin-bottom: 7%">
                            <label for="notes" >Notes</label> 
                            <textarea class="form-control" id="notes" placeholder="Leave your notes here" rows="3" ></textarea>
                        </div> 
                        
                </div>
                @endif
                @if(!Auth::check())  
                    <div class="alert alert-info">
                        <h3>Pelase <b><a href="{{ route('signin') }}">log in</a></b> to book a table! :)</h3>
                    </div>
                    
                @endif
                    <br><br>
                <div class="row">
                <div class="col-lg-6 col-xs-offset-4">
                    <button type="button" class="btn btn-danger" onclick="window.history.back();">Back</button> &nbsp
                    @if(Auth::check()) 
                    <button type="button" class="btn btn-primary" id="book_table" onclick="">Book table</button>
                    @endif
                </div>
                </div>
                    
		</div>

                

                
                <script>
                    
                    redips.targetTable = document.getElementById('table2');
                    var table_content = <?php echo json_encode($schema); ?>;
                    REDIPS.drag.loadContent(redips.targetTable, table_content['table_coord']);
                    
                    
                   
                   DisableDrag();
                   var table_bookings = <?php echo json_encode($table_bookings); ?>;
                   MarkBookedTables(table_bookings);
                   
                   // choosing table
                   $(".notreserved").click(function() {
                        var number = $(this).text();
                        $( ".notreserved" ).css("background-color", "white");
                        $(this).css("background-color", "lightblue");
                        $('#table_no').html(number);
//                        console.log(number);
                   });
                   
                    // booking table    
                    $('#book_table').on('click', function(){
                            
                            var table_no = $('#table_no').html();
                            var schema_id = table_content['id'];
                            var company_id = table_content['company_id'];
                            var time = $('#time').val();
                            var notes = $('#notes').val();
                            var first_name = $('#first_name').val();
                            var last_name = $('#last_name').val();
                            var tel_no = $('#tel_no').val();
                            var email = $('#email').val();
                            
                           if(!parseInt(table_no)){
                               alert('Choose table please!');
                               return false;
                           }
                           console.log(table_no);
                           if(time == ''){
                               alert('Choose time please!');
                               return false;
                           }
                           if(first_name == ''){
                               alert('Enter your name please!');
                               return false;
                           }
                           if(last_name == ''){
                               alert('Enter your last name please!');
                               return false;
                           }
                           if(tel_no == ''){
                               alert('Enter your phone number please!');
                               return false;
                           }
                           if(email == ''){
                               alert('Enter your email please!');
                               return false;
                           }

                           $.ajax({  
                               data: {  
                                   table_no: table_no, 
                                   schema_id: schema_id,
                                   company_id: company_id,
                                   time: time,
                                   notes: notes,
                                   first_name: first_name,
                                   last_name: last_name,
                                   tel_no: tel_no,
                                   email: email
                                        
                               },
                               type: "POST",
                               url: $('.book_table_url').val(), 
                               beforeSend: function (xhr) {
                                   var token = $('meta[name="csrf-token"]').attr('content');
                                   if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                               },
                               success: function(result) {
                                   console.log('Ok');
                                   console.log(result);
                                   $('#table_reservation').html('<div class="alert alert-info"> <b> Your booking successful! <br> If you cannot arrive please inform the company! <br> Thanks for using our catering system! <b> </div>');
                                   $('#book_table').hide();
                                   MarkOneTableAsBooked(table_no);
                                   $('.notreserved').prop('onclick',null).off('click');
                                   
                               },
                               error: function(result) {
                                   console.log('Error');
                                   console.log("Error: " + JSON.stringify(result));
                                   alert("Error! Try again!");
                               }

                           });
                        });
                   
//                   ----------------------------

                </script>
                
	</body>
</html>

@endsection