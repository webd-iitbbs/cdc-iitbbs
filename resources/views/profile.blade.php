@extends('layouts.app')

@section('content')

<div class="container">
 <form action="/user/profile/edit" method="get">
        <h3>PROFILE</h3><br>
        <div class="form-row">
            <label for="name" class="col-12 col-sm-2 col-form-label">Name:</label>
            <div class="col-12 col-sm-4"->
                <input type="text" class="form-control" name="name" value="{{Auth::user()->name}}" readonly/>
            </div>
        </div><br>

        <div class="form-row">
            <label for="email" class="col-12 col-sm-2 col-form-label">Email:</label>
            <div class="col-12 col-sm-4"->
                <input type="text" class="form-control" name="email" value="{{Auth::user()->email}}" readonly/>
            </div>
        </div><br>

        <div class="form-row">
            <label for="roll" class="col-12 col-sm-2 col-form-label">Roll no:</label>
            <div class="col-12 col-sm-4"->
                <input type="text" class="form-control" name="roll" value="{{Auth::user()->roll}}" readonly/>
            </div>
        </div><br>

        <div class="form-row">
            <label for="phone" class="col-12 col-sm-2 col-form-label">Phone no:</label>
            <div class="col-12 col-sm-4"->
                <input type="text" class="form-control" name="phone" value="{{Auth::user()->phone}}" readonly/>
            </div>
        </div><br>
                      
        <div class="form-row">
            <label for="category" class="col-12 col-sm-2 col-form-label">CGPA</label>
            <div class="col-12 col-sm-3">
                <input type="text" class="form-control" name="cgpa" value="{{Auth::user()->cgpa}}" readonly/>
            </div> 
        </div><br>

        <div class="form-row">
            <div class="offset-sm-2"></div>
                <button class="btn btn-primary" type="submit">Edit</button>
            </div>    
        </div>
  </form>
</div>
@endsection