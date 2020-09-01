@extends('layouts.app')

@section('content')
<div class="error pb-5 pt-2 text-center" id="price">
    <div class="container pb-xl-5 pb-lg-3">
        <img src="{{ URL::to('/') }}/images/error.png" alt="" class="img-fluid" />
        <h3 class="title-w3 text-bl my-3 font-weight-bold text-capitalize">Oops! You cannot access this page.</h3>
        <p class="sub-tittle text-center4">Please contact spcs, if you are an eligible person to view this</p>
        <a href="{{ URL::to('/home') }}" class="btn btn-info mt-5" style="color:white;">Back To Home</a>
    </div>
</div>
@endsection