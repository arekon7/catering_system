    function splitMenuContent(){
//   ------ split menu content to 3 equal parts ------------
            var cont1Height = $('.content_1').height();
//            console.log(cont1Height);
            var cont_height = Math.ceil(cont1Height / 3);
//            console.log('cont_height = '+cont_height);
            var masyvas_su_htmlu = ['', '', ''];
            var page = 0;
            var total_height = 0;


            $(".food_category").each(function(){
//                console.log($(this).height());
                total_height += $(this).height();
//                console.log('total_height = '+total_height);

                if(total_height > cont_height){
//                    console.log('total_height = '+total_height );
                    total_height = 0;
                    page += 1;
                }
                masyvas_su_htmlu[page] += $(this).prop('outerHTML');

            });
//            console.log(masyvas_su_htmlu);
            $(".content_1").html(masyvas_su_htmlu[0]);
            $(".content_2").html(masyvas_su_htmlu[1]);
            $(".content_3").html(masyvas_su_htmlu[2]);
//            console.log(masyvas_su_htmlu[0]);

            $(".rm-cover").height(cont_height + cont_height * 0.33);
            $(".rm-middle").height(cont_height + cont_height * 0.33);
            $(".rm-right").height(cont_height + cont_height * 0.33);
//                --------------------------------
        }
        
        splitMenuContent(); //run the function defined above
        
         // Create a new list item when clicking on the "Add" button
    function newElement(order) {
        var li = document.createElement("li");
//        var inputValue = '\<div> '+order.title+ ' </div> <div> Quantity: '+order.food_quantity+' </div>';
        var inputValue =    "<div id='order_title' class='order_title'> "+order.title+"</div> \n\
                            <div id='order_qty'> Quantity: "+order.food_quantity+" </div> \n\
                            <div id='order_price'> Price: "+order.price+" EUR</div> \n\
                            <input id='order_food_id' type='number' value='" + order.food_id + "' hidden> \n\
                            <input id='order_c_id' type='number' value='" + order.c_id + "' hidden> \n\
                            <input id='order_item_id' type='number' value='" + order.order_item_id + "' hidden> \n\
                            </div>";
//        var t = document.createTextNode(inputValue);
//        li.appendChild(t);
        li.innerHTML = inputValue;
        if (inputValue === '') {
          alert("You must write something!");
        } else {
          document.getElementById("myUL").append(li);
        }
//        document.getElementById("myInput").value = "";

        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);

        
        createCloseButtons();
    }
    
    



var Menu = (function() {
	
        var order = [];
        var i = 0;
	var $container = $( '#rm-container' ),						
		$cover = $container.find( 'div.rm-cover' ),
		$middle = $container.find( 'div.rm-middle' ),
		$right = $container.find( 'div.rm-right' ),
		$open = $cover.find('a.rm-button-open'),
		$close = $right.find('span.rm-close'),
		$details = $container.find( 'a.rm-viewdetails' ),

		init = function() {

			initEvents();

		},
		initEvents = function() {

			$open.on( 'click', function( event ) {

				openMenu();
				return false;

			} );

			$close.on( 'click', function( event ) {

				closeMenu();
				return false;

			} );

			$details.on( 'click', function( event ) {

				$container.removeClass( 'rm-in' ).children( 'div.rm-modal' ).remove();
				viewDetails( $( this ) );
				return false;

			} );
			
		},
		openMenu = function() {

			$container.addClass( 'rm-open' );

		},
		closeMenu = function() {

			$container.removeClass( 'rm-open rm-nodelay rm-in' );

		},
		viewDetails = function( recipe ) {

			var     title = recipe.text(),
				img = recipe.data( 'thumb' ),
				description = recipe.parent().next().text(),
				url = recipe.attr( 'href' ),
                                food_id = recipe.attr('id'),
                                c_id = recipe.attr('c_id'),
                                price = recipe.parent().next().next().text();
                                
                                var lastIndexPrice = price.lastIndexOf(" EUR");
                                price = price.substring(0, lastIndexPrice);

			var $modal = $( '<div class="rm-modal centred">\n\
                                        <div class="rm-thumb" style="background-image: url(/imgs/food_images/3.jpg); width:100px; height: 100px;"></div>\n\
                                        <h5>' + title + '</h5>\n\
                                        <p>' + description + '</p> \n\
                                        <p> Quantity: </p> \n\
                                        <input name="food_quantity" id="food_quantity" type="number" min="1" max="5" class="form-control" style="width:20%; display:inline;"> \n\
                                        <button type="button" class="btn_order btn btn btn-outline btn-warning btn" id="btn_order" style="display:inline;">Add to order</button> \n\
                                        <p class="modal_price">' + price + ' EUR</p> \n\
                                        <input id="food_id" type="number" value="' + food_id + '" hidden>\n\
                                        <input id="c_id" type="number" value="' + c_id + '" hidden> \n\
                                        <span class="rm-close-modal">x</span>\n\
                                        </div>' );
                    
//                                       <a href="' + url + '">See the recipe</a>\n\

			$modal.appendTo( $container );

			var h = $modal.outerHeight( true );
			$modal.css( 'margin-top', -h / 2 );
			
			//calculate modal distance from top
			var win_h = $( window ).height();
			var h_from_top = $(window).scrollTop();
			win_h = win_h / 4;
			$modal.css('top', h_from_top + win_h);

			setTimeout( function() {

				$container.addClass( 'rm-in rm-nodelay' );

				$modal.find( 'span.rm-close-modal' ).on( 'click', function() {

					$container.removeClass( 'rm-in' );

				} );
			
			}, 0 );
                        
                        
                        
                        $('#btn_order').on('click', function(){
                            
                            var food_quantity = $('#food_quantity').val();
                            var food_id = $('#food_id').val();
                            var c_id  = $('#c_id').val();
//                            var portion = $('#portion').val();
                            var title = recipe.text();
                            
                            
                            if(food_quantity === ''){
                                alert('Quantity should be at least 1 to make order!');
                                return false;
                            }
                           
                           ord = {title: title, food_quantity: food_quantity, price:price, food_id: food_id, c_id: c_id, order_item_id: i};
                            
                            var found = 0;
                            var first_item = 0;
                            if(order.length === 0){
                                order.push(ord);
                                newElement(ord);
                                first_item = 1;
                            }else{
                                for(var j = 0; j < order.length; j++){
                                if(order[j].food_id === food_id  ){
                                    found = 1;
                                    order[j].food_quantity = food_quantity * 1 + order[j].food_quantity * 1;
                                    $('li').find('#order_food_id:input[value="'+order[j].food_id+'"]').parent().find('#order_qty').html('Quantity: '+order[j].food_quantity);
                                    $('li').find('#order_food_id:input[value="'+order[j].food_id+'"]').parent().find('#order_price').html('Price: ' +order[j].food_quantity+' x '+order[j].price+' = '+order[j].food_quantity * order[j].price+ ' EUR');
                                    }
                                }
                            }
                            
                           if((found === 0) & (first_item === 0)){
                                order.push(ord);
                                newElement(ord);
                                i++;  
                           }
                           
                           showSnackbarOrderNotification(title, food_quantity);
                           $('#rm-container').removeClass( 'rm-in' );
                        });

		};
                
                $('#make_order').on('click', function(){
                    
                    if(order.length !== 0){
                        var create_ord = confirm('Are you sure want to make order?');
                        if(create_ord){

                            $.ajax({  
                                data: { order:order
                                },
                                type: "POST",
                                url: $('.createorder_url').val(), 
                                beforeSend: function (xhr) {
                                    var token = $('meta[name="csrf-token"]').attr('content');
                                    if (token) { return xhr.setRequestHeader('X-CSRF-TOKEN', token); }
                                },
                                success: function(result) {
//                                    console.log('Ok');
//                                    console.log(result);
                                },
                                error: function(result) {
                                    console.log('Error');
                                    console.log("Error: " + JSON.stringify(result));
                                }

                            });
                        clearOrderList();
                        showSnackbarOrderComplete();
                        order = [];
//                        console.log(order);
                    }
                        
                    } else alert("Order is empty!");
                   
                });

	
    
    
    
    return { init : init };
        
   

})();

//--------------------------

 // Click on a close button to hide the current list item
        var close = document.getElementsByClassName("close");
        var i;
        for (i = 0; i < close.length; i++) {
          close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
          }
        }
        
       // Create a "close" button and append it to each list item
        function createCloseButtons(){
            var myNodelist = document.getElementsByTagName("LI");
            var i;
            for (i = 0; i < myNodelist.length; i++) {
              var span = document.createElement("SPAN");
              var txt = document.createTextNode("\u00D7");
              span.className = "close";
              span.appendChild(txt);
              myNodelist[i].appendChild(span);
            }
            
            for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                    var div = this.parentElement;
                    div.remove();
              }
            }
        }
        
        function clearOrderList(){
            var close = document.getElementsByClassName("close");
            for (var j = 0; j < close.length; j++) {
                var div = close[j].parentElement;
                div.remove();
            }
            var close = document.getElementsByClassName("close");
            for (var j = 0; j < close.length; j++) {
                var div = close[j].parentElement;
                div.remove();
            }
            
        }
        
        createCloseButtons();
        
        function showSnackbarOrderNotification(title, qty) {
            var x = document.getElementById("snackbar");
            x.innerHTML = qty+ ' x ' +title+' added to your order. Check it above.';
            x.className = "show";
            setTimeout(function(){ x.className = x.className.replace("show", ""); }, 6000);
        }
        
        function showSnackbarOrderComplete() {
            var x = document.getElementById("snackbar");
            x.innerHTML = 'Order successfully placed!';
            x.className = "show";
            setTimeout(function(){ x.className = x.className.replace("show", ""); }, 6000);
        }


//----------------------------


