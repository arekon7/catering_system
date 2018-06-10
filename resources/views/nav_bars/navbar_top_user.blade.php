
    <link rel="stylesheet" href="{{ URL::to('css/navbar_user_style.css') }}">

 <header>
  <div class="container navbar_top_user">

    <nav>
    <ul>
        <li><a href="{{ route('main') }}">Catering companies</a></li>
        @if(Auth::check())
            <!--<li><a href="{{ route('profile') }}">My profile</a></li>-->
            <li><a href="{{ route('orders_user') }}">My orders</a></li>
            <li><a href="{{ route('bookings_user') }}">My bookings</a></li>
        @endif
        <!--<span id="separator"></span>-->
        @if(!Auth::check())
            <li><a href="{{ route('signin') }}">Log In</a></li>
            <li><a href="{{ route('signup') }}">Registration</a></li>
           
        @else
            <li><a href="{{ route('logout') }}">Logout</a></li>
        @endif  
        @if(Session::get('user_email'))
        <li style="float:right;"><small><a href="{{ route('profile') }}">  Logged in as: {{ Session::get('user_email') }}  
                <!--Role:--> 
                @foreach( Session::get('user_roles') as $user_role)
                    {{ $user_role }}
                @endforeach
            </a> </small></li>
        @endif
      
      
      
   </ul>
  </nav>
  </div>
</header>
  

