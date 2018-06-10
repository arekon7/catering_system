
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Menu</title>
        <!-------- bootstrap for modal ------------------>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-------------------------->
        
        <!--<link rel="shortcut icon" href="../favicon.ico">--> 
        <link rel="stylesheet" type="text/css" href="{{ URL::to('css/food_menu/food_menu.css') }}" />
        <link href='http://fonts.googleapis.com/css?family=Raleway:300,500|Arvo:700' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="{{ URL::to('js/food_menu/modernizr.custom.79639.js') }}"></script> 
    </head>
    <body>

        <div class="container">
            
        @include('partials.urls')  
		
			<div style="float: left; ">
                            
                        </div>
			<header>
                                
                                <div id="snackbar">Menu item added to your order. Check it above.</div>
                                 <!--// --------- Order modal---------------->
                                <div class="container order_modal">
                                    
                                    
                                  <h2>Your order</h2>
                                  <!-- Trigger the modal with a button -->
                                      <button type="button" id="back_from_menu" class="btn btn-primary btn-lg" onclick="window.history.go(-1);">
                                          <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Go back
                                      </button>
                                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Order</button>
                                    @if(!Auth::check()) 
                                        <a type="button" class="btn btn-warning btn-lg" href="{{ route('signin') }}">Log In</a>
                                    @endif
                                    <!-- Modal -->
                                  <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog">

                                      <!-- Modal content-->
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                                          <h4 class="modal-title">Your order</h4>
                                        </div>
                                        <div class="modal-body">
                                          <!--<p>Some text in the modal.</p>-->
                                            
                                            @if(!Auth::check())  
                                                <div class="alert alert-warning">
                                                    <h3>Pelase log in to make the order! :)</h3>
                                                </div>
                                            @endif
                                          <ul id="myUL">
                                          
                                          </ul>
                                          
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-success" id="make_order" data-dismiss="modal">Make order</button>
                                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                      </div>

                                    </div>
                                  </div>

                                </div>

                                <!--// ------------------------------->
				
			</header>
			
			<section class="main">

				<div id="rm-container" class="rm-container">
                                    
					<div class="rm-wrapper">

						<div class="rm-cover">

							<div class="rm-front">
								<div class="rm-content">
                                                                    @if(count($menu) < 1) <h1> Menu is empty for now</h1>     @endif
									<div class="rm-logo"></div>
									<h2>{{ $company->co_name }}</h2>
                                                                        
									<h3>Fine Dining &amp; Gourmet Takeaway</h3>

									<a href="#" class="rm-button-open">View the Menu</a>
									<div class="rm-info">
                                                                            <p>
                                                                                <strong>{{ $company->co_name }}</strong><br>
                                                                                <strong>Address </strong>{{ $company->address }}<br>
                                                                                <strong>Phone </strong> {{ $company->tel_no }}<br>
                                                                            </p>
									</div>

								</div><!-- /rm-content -->
							</div><!-- /rm-front -->

							<div class="rm-back" style="min-height: 650px;">
								<div class="rm-content">
                                                                    <div class="content_1"> 
                                                                        @foreach($food_categories as $category)
                                                                            <div class="food_category">
                                                                                 <h4>{{ $category->category }}</h4>
                                                                                 @foreach ($menu as $menu_item)

                                                                                         @if($category->id == $menu_item->category_id)
                                                                                             <dl class="menu_item">
                                                                                                 <dt><a id="{{ $menu_item->id }}" c_id="{{ $menu_item->company_id }}" href="#" class="rm-viewdetails" data-thumb="images/1.jpg">{{ $menu_item->item }}</a></dt>
                                                                                                 <dd id="" class="description">{{ $menu_item->description }}</dd>
                                                                                                 <dd id="" class="price">{{ $menu_item->price }} EUR</dd>
                                                                                             </dl>
                                                                                         @endif

                                                                                 @endforeach
                                                                            </div>
                                                                        @endforeach
                                                                
                                                                    
                                                                    </div>  <!--/content_1-->
								</div><!-- /rm-content -->
								<div class="rm-overlay"></div>

							</div><!-- /rm-back -->

						</div><!-- /rm-cover -->

						<div class="rm-middle" style="min-height: 650px;">
							<div class="rm-inner">
								<div class="rm-content">
                                                                    <div class="content_2">  
                                                                    <!-- place your dishes here-->
                                                                   
                                                                    
                                                                    </div>
								</div><!-- /rm-content -->
								<div class="rm-overlay"></div>
							</div><!-- /rm-inner -->
						</div><!-- /rm-middle -->

						<div class="rm-right" style="min-height: 650px;">
							<div class="rm-front">
								
							</div>

							<div class="rm-back">
								<span class="rm-close">Close</span>
                                                         
								<div class="rm-content">
                                                                    <div class="content_3">  
									<!-- place your dishes here-->
                                                                    
                                                                    </div>
								</div><!-- /rm-content -->
							</div><!-- /rm-back -->

						</div><!-- /rm-right -->
					</div><!-- /rm-wrapper -->

				</div><!-- /rm-container -->

			</section>
			
        </div>
          
		<!-- jQuery if needed -->
        <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>-->
                <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

        <script type="text/javascript">
                $(function() {
                        Menu.init();
                });
                
        
       
        

        </script>
        
        
        
        <script type="text/javascript" src="{{ URL::to('js/food_menu/menu.js') }}"></script> 
        
       @if(!Auth::check())    
        <script>
            $( document ).delay(250).queue(function() {
            $(".rm-viewdetails" ).unbind( "click");
            $('.rm-viewdetails').on('click', function(){
                var x = document.getElementById("snackbar");
                x.innerHTML = 'Please LOGIN to make the order! :)';
                x.className = "show";
                setTimeout(function(){ x.className = x.className.replace("show", ""); }, 6000);

                    $('.rm-modal').empty();
                    $('.rm-modal').html('Please LOGIN to make the order! :)');
            });
            
            $('.rm-front').css('min-height', '650px');
            $('.rm-front').css('min-rm-back', '650px');
            $('.rm-front').css('min-rm-middle', '650px');
        
        });
        
        </script>
        @endif
        
    </body>
</html>


