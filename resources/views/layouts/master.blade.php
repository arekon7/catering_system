<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="apple-touch-icon" sizes="76x76" href="material_dashboard/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="material_dashboard/assets/img/favicon.png" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Konstantinas">
    
    <title>Catering system</title>
    
    <!-----------material dashboard------------------------>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<!-- Custom Fonts -->
    
    <!-----------Bootstrap Original -------------------->
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
    
    <!------------ Custom CSS ----------------------->
    
    <link rel="stylesheet" href="{{ URL::to('src/css/main.css') }}">
    <link rel="stylesheet" href="{{ URL::to('css/app.css') }}">
    
    
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    
    <!------- Custom Scripts --------------->
    <!--<script src="https://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>-->
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
   
    @yield('css')
    
</head>
<body>

@include('partials.urls')    
    
@if(!Auth::check())
    @include('nav_bars.navbar_top_user')
@endif

@if(Auth::check())
    @if(Auth::user()->hasRole('Admin'))   
        @include('nav_bars.navbar_top_adm_cmp')
    @elseif(Auth::user()->hasRole('Company'))   
        @include('nav_bars.navbar_top_adm_cmp')
    @elseif(Auth::user()->hasRole('User'))
        @include('nav_bars.navbar_top_user')
    @endif
    
    
    
@endif
    
<div class="wrapper">

        <div class="main">
            @yield('content')

        </div>

    <!--</div>-->  
 </div>   
</body>

<!---------------------------------->

<!-- DataTables JavaScript -->
    <script src="{{ URL::to('sb_admin/vendor/datatables/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ URL::to('sb_admin/vendor/datatables-plugins/dataTables.bootstrap.min.js') }}"></script>
    <script src="{{ URL::to('sb_admin/vendor/datatables-responsive/dataTables.responsive.js') }}"></script>

<!--<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>-->
    
    <!-- Bootstrap original / Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

   @yield('scripts')

</html>