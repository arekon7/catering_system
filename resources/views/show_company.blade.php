@extends('layouts.master')


@section('content')

<?php
    $session_data = Session::all();
    Log::info($session_data);
?>

@include('partials.flash_message')

<h1></h1>

<hr/>


<!---------------------------------------------->


<!-- GRID START -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3>{{ $company->co_name .' information' }}</h3> <br>
                            <!--<p>See how aspects of the Bootstrap grid system work across multiple devices with a handy table.</p>-->
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Company name</th>
                                            <td>{{$company->co_name}}</td>
                                        </tr>
                                        <tr>
                                            <th>Responsible person</th>
                                            <td>{{$company->resp_person}}</td>
                                        </tr>
                                        <tr>
                                            <th>Telephone</th>
                                            <td>
                                                {{$company->tel_no}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Web page</th>
                                            <link rel="stylesheet" type="text/css" href="theme.css">
                                            <td>{{$company->web_p}}</td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td>{{$company->address}}</td>
                                        </tr>
                                        <tr>
                                            <th>Town</th>
                                            <td>{{ucfirst($company->town)}}</td>
                                        </tr>
                                        <tr>
                                            <th>Work hours</th>
                                            <td>{{$company->wh_from . ' - ' . $company->wh_to}}</td>
                                        </tr>
                                        <tr>
                                            <th>Created</th>
                                            <td>{{$company->created_at}}</td>
                                        </tr>
                                        <tr>
                                            <th>Updated</th>
                                            <td>{{$company->updated_at}}</td>
                                        </tr>
                                        <tr>
                                            <th>Table schemas</th>
                                            <td><a class="btn btn-outline btn-primary" href="{{ route('show_all_schemas_list_order', ['id' =>  $company->id]) }}"> Table schemas </a></td>
                                        </tr>
                                        <tr>
                                            <th>Menu</th>
                                            <td> <a class="btn btn-outline btn-primary" href="{{ route('food_menu', ['id' => $company->id]) }}"> Menu </a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p>{{$company->notes}}</p>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->



<!---------------------------------------------->



<div>Photos</div> <br>




<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 600px; height: 400px;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    @for ($i = 0; $i < count($images); $i++)
        <li data-target="#myCarousel" data-slide-to="{{ $i }}" class=" @if($i == 0) active @endif"></li>
    @endfor
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
      
    @foreach($images as $image)

        <div class="item @if($image->image_no == 1) active @endif" style="width: 600px; height: 400px; overflow: hidden;">
            <img src="{{ URL::to('/imgs/companies/') }}/{{ $image->image_name . '.' . $image->image_extension . '?'. 'time='. time() }}" style="width: 600px; height: 400px; overflow: hidden;">
        </div>

    @endforeach

      
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br>
<button class="btn btn-danger" onclick="window.history.back();">Back</button>


@endsection