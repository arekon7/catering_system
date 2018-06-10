
      <link rel="stylesheet" href="{{ URL::to('css/navbar_adm_cmp_top.css') }}">
  
<div id="main">
  <div class="container">
    
    <nav>
      <div class="nav-fostrap">
        <ul>
            <!---Company nav bar-------------------->
            @if(Auth::check())
                @if(Auth::user()->hasRole('Company'))
                    
                    <li><a href="#">Catering companies<span class="arrow-down"></span></a>
                        <ul class="dropdown">
                            <li><a href="{{ route('main') }}">All companies</a></li>
                            <li><a href="{{ route('show_all_my_companies') }}">My companies</a></li>
                            <li><a href="{{ route('profile') }}">My Profile</a></li>
                        </ul>
                    </li>
                    
                    <li><a href="#">Orders<span class="arrow-down"></span></a>
                        <ul class="dropdown">
                            <li><a href="{{ route('orders') }}">Company orders</a></li>
                            <li><a href="{{ route('table_bookings_cmp') }}">Table bookings</a></li>
                            <li><a href="{{ route('orders_user') }}">My personal orders</a></li>
                            <li><a href="{{ route('bookings_user') }}">My personal bookings</a></li>
                        </ul>
                    </li> 
                    <li><a href="#">Table schemas<span class="arrow-down"></span></a>
                        <ul class="dropdown">
                            <li><a href="{{ route('all_my_schemas') }}">My table schemas</a></li>
                            <li><a href="{{ route('tables_map') }}">Create new table schema</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Food menu<span class="arrow-down"></span></a>
                        <ul class="dropdown">
                            <li><a href="{{ route('menu_management') }}">Menu management</a></li>
                            <li><a href="{{ route('food_category_management') }}">Food categories</a></li>
                        </ul>
                    </li> 
                    
                
                @endif
            @endif
            
          <!-----Admin nav bar------------------------->  
          @if(Auth::check())
             @if(Auth::user()->hasRole('Admin'))
                <li><a href="#">All companies management<span class="arrow-down"></span></a>
                    <ul class="dropdown">
                      <li><a href="{{ route('main') }}">All Companies</a></li>
                      <li><a href="{{ route('orders_all') }}">All orders</a></li>
                      <li><a href="{{ route('bookings_all') }}">All bookings</a></li>
                    </ul>
                </li>
                <li><a href="{{ route('admin') }}">Users management</a></li>
                <li><a href="#">Orders / bookings<span class="arrow-down"></span></a>
                    <ul class="dropdown">
                      <li><a href="{{ route('orders_user') }}">My orders</a></li>
                 <li><a href="{{ route('bookings_user') }}">My bookings</a></li>
                    </ul>
                </li>
                 
             
             
          
            @endif
          @endif
          <!---- log in / log out------------------------->  
          
          @if(!Auth::check())
                <li><a href="{{ route('signup') }}">Sign Up</a></li>
                <li><a href="{{ route('signin') }}">Sign In</a></li>
            @else
                <li><a href="{{ route('logout') }}">Logout</a></li>
            @endif
            @if(Session::get('user_email'))
            <li style="float: right; z-index: 1;">  <a href="{{ route('profile') }}"><small> Logged in as: {{ Session::get('user_email') }} 
                    <!--Role:-->
                    @foreach( Session::get('user_roles') as $user_role)
                        {{ $user_role }}
                    @endforeach
                    {{ Session::get('cmp_mng_name') }}
                </small></a></li>
            @endif
            
            <!------------------------------>
        </ul>
      </div>
      <div class="nav-bg-fostrap">
        <div class="navbar-fostrap"> <span></span> <span></span> <span></span> </div>
        <a href="#" class="title-mobile">Catering system</a>
      </div>
    </nav>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

<script  src="{{ URL::to('js/navbar_adm_cmp_top.js') }}"></script>

