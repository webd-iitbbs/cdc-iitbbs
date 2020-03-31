@extends('layouts.app')

@section('content')

<div class="container">
 <form action="/regpf" method="get">
        <h3>REGISTER for <?php echo "$table"; ?></h3><br>
        @foreach($data as $key => $data)
        @if($key>0)
        @if ( ! $loop->last)
        <div class="form-row">
            <label for="{{ $data }}" class="col-12 col-sm-2 col-form-label">{{ $data }}:</label>
            <div class="col-12 col-sm-4"->
                <input type="text" class="form-control" name="{{ $data }}" placeholder="{{ $data }}" >
            </div>
        </div><br>
        @endif
        @endif
        @endforeach
        <div class="form-row">
            <div class="offset-sm-2"></div>
                <button class="btn btn-primary" type="submit">Submit</button>
        </div>
        <input type="hidden" name="company_id" value="<?php echo "$id"; ?>"/>
        <input type="hidden" name="created_at" value=""/>
        <input type="hidden" name="id" value="{{Auth::user()->id}}"/> 
        <input type="hidden" name="user_id" value="{{Auth::user()->id}}"/> 
  </form>
</div>
@endsection