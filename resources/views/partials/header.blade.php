<header id="header_green">
    <nav>
        <ul>
            <li><a href="/">Restaurants</a></li>
            <!--<li><a href="{{ route('author') }}">Company</a></li>-->
            <li><a href="{{ route('admin') }}">Users management</a></li>
            <!--<li><a href="/table">Tables</a></li>-->
            <li><a href="/marketingimage">Marketingimage</a></li>
            @if(Auth::check())
                <li><a href="/profile/{{ Auth::id() }}">Profile</a></li>
                @if(Auth::user()->hasRole('Company'))
                    <li><a href="/orders/">Company orders</a></li>
                    <li><a href="/all_my_schemas/">Tables schema</a></li>
                    <li><a href="/menu_management/">Menu management</a></li>
                    <!--<li><a href="/show_create_food_category/">New Food Cat</a></li>-->
                    
                @endif
                @if(Auth::user()->hasRole('User'))
                    <li><a href="/orders_user">My orders</a></li>
                @endif
                @if(Auth::user()->hasRole('Admin'))
                    <li><a href="/orders_all">All orders</a></li>
                @endif 
            @endif
            <span id="separator"></span>
            @if(!Auth::check())
                <li><a href="{{ route('signup') }}">Sign Up</a></li>
                <li><a href="{{ route('signin') }}">Sign In</a></li>
            @else
                <li><a href="{{ route('logout') }}">Logout</a></li>
            @endif
            @if(Session::get('user_email'))
            <li style="float: right;">   Logged in as: {{ Session::get('user_email') }}  <br>
                Roles:
                @foreach( Session::get('user_roles') as $user_role)
                    {{ $user_role }},
                @endforeach
            </li>
            @endif
        </ul>
    </nav>
</header>

<?php
//    $session_data = Session::all();
//    Log::info($session_data);
//    dd($session_data);
?>