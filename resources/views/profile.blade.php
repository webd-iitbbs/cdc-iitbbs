@extends('layouts.app')

@section('content')

<div class="container">
 <form action="/user/profile/update" method="get">
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
            @if ((Auth::user()->roll))
                <input type="text" class="form-control" name="roll" value="{{Auth::user()->roll}}" readonly/>
            @else
                <input type="text" class="form-control" name="roll" required/>
            @endif 
            </div>
        </div><br>

        <div class="form-row">
            <label for="phone" class="col-12 col-sm-2 col-form-label">Phone no:</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->phone))
                <input type="text" class="form-control" name="phone" value="{{Auth::user()->phone}}" readonly/>
            @else 
                <input type="text" class="form-control" name="phone" required />
            @endif
            </div>
        </div><br>
                      
        <div class="form-row">
            <label for="category" class="col-12 col-sm-2 col-form-label">CGPA</label>
            <div class="col-12 col-sm-3">
            @if ((Auth::user()->cgpa))
                <input type="text" class="form-control" name="cgpa" value="{{Auth::user()->cgpa}}" readonly/>   
            @else 
                <input type="text" class="form-control" name="cgpa" required/>
            @endif
            </div> 
        </div><br>

        <div class="form-row">
            <label for="category" class="col-12 col-sm-2 col-form-label">Tenth Score</label>
            <div class="col-12 col-sm-3">
            @if ((Auth::user()->TenthScore))
                <input type="text" class="form-control" name="tenth" value="{{Auth::user()->TenthScore}}" readonly/>   
            @else 
                <input type="text" class="form-control" name="tenth" required/>
            @endif
            </div> 
        </div><br>

        <div class="form-row">
            <label for="category" class="col-12 col-sm-2 col-form-label">Twelfth Score</label>
            <div class="col-12 col-sm-3">
            @if ((Auth::user()->TwelfthScore))
                <input type="text" class="form-control" name="twelfth" value="{{Auth::user()->TwelfthScore}}" readonly/>   
            @else 
                <input type="text" class="form-control" name="twelfth" required/>
            @endif
            </div> 
        </div><br>

        <div class="form-row">
            <div class="offset-sm-2"></div>
            @if (!(Auth::user()->cgpa))
                <button class="btn btn-primary" type="submit">Submit</button>
            @endif    
            </div>    
        </div>
  </form>
</div>
@endsection