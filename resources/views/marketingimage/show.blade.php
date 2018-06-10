@extends('layouts.master')


@section('content')



   {!! Breadcrumb::withLinks(['Home'   => '/',
   'marketing images' => '/marketingimage',
   "show $marketingImage->image_name.$marketingImage->image_extension"
   ]) !!}

      <!--@include('flash::message')-->
   
   @if (session()->has('flash_notification.message'))
    <div class="alert alert-{{ session('flash_notification.level') }}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

        {!! session('flash_notification.message') !!}
    </div>
    @endif
    

    
    <div>

{{ $marketingImage->image_name }} :  <br>

        <img src="/imgs/marketing/{{ $marketingImage->image_name . '.' .
         $marketingImage->image_extension . '?'. 'time='. time() }}">

    </div>

    <div>

       {{ $marketingImage->image_name }} - thumbnail :  <br>

        <img src="/imgs/marketing/thumbnails/{{ 'thumb-' . $marketingImage->image_name . '.' .
    $marketingImage->image_extension . '?'. 'time='. time() }}">

    </div>

    <div>

       {{ $marketingImage->mobile_image_name }} - mobile :  <br>

        <img src="/imgs/marketing/mobile/{{ $marketingImage->mobile_image_name . '.' .
         $marketingImage->mobile_extension . '?'. 'time='. time() }}">

    </div>

@endsection

@section('scripts')
    <script>
        $('#flash-overlay-modal').modal();
//        $('div.alert').not('.alert-important').delay(0).hide();
    </script>


@endsection