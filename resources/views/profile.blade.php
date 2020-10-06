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
            <label for="gender" class="col-12 col-sm-2 col-form-label">Gender</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->gender))
                <input type="text" class="form-control" name="gender" value="{{Auth::user()->gender}}" readonly/>
            @else
                <select class="custom-select" name="gender" id="inputGroupSelect01" required>
                    <option value="MALE" selected> MALE </option>
                    <option value="FEMALE"> FEMALE </option>
                </select>
            @endif 
            </div>
        </div><br>

        <div class="form-row">
            <label for="branch" class="col-12 col-sm-2 col-form-label">Branch</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->branch))
                <input type="text" class="form-control" name="branch" value="{{Auth::user()->branch}}" readonly/>
            @else
                <select class="custom-select" name="branch" id="inputGroupSelect01" required>
                    <option value="CS" selected>Computer Science and Engineering</option>
                    <option value="EC">Electronics and Communication Engineering</option>
                    <option value="EE">Electrical Engineering</option>
                    <option value="ME">Mechanical Engineering</option>
                    <option value="CE">Civil Engineering</option>
                    <option value="MM">Metallurgical and Materials Engineering</option>
                </select>
            @endif 
            </div>
        </div><br>

        <div class="form-row">
            <label for="degree" class="col-12 col-sm-2 col-form-label">Degree</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->degree))
                <input type="text" class="form-control" name="degree" value="{{Auth::user()->degree}}" readonly/>
            @else
                <select class="custom-select" name="branch" id="inputGroupSelect01" required>
                    <option value="01" selected> 4 Years, Bachelors Of Technology</option>
                    <option value="02">5 Years, Bachelor and Master Of Technology Dual degree</option>
                </select>
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
            <label for="email2" class="col-12 col-sm-2 col-form-label">Personal Email</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->email2))
                <input type="text" class="form-control" name="email2" value="{{Auth::user()->email2}}" readonly/>
            @else 
                <input type="text" class="form-control" name="email2" required />
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="phone" class="col-12 col-sm-2 col-form-label">Contact No 1</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->phone))
                <input type="text" class="form-control" name="phone" value="{{Auth::user()->phone}}" readonly/>
            @else 
                <input type="text" class="form-control" name="phone" required />
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="phone2" class="col-12 col-sm-2 col-form-label">Contact No 2</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->phone2))
                <input type="text" class="form-control" name="phone2" value="{{Auth::user()->phone2}}" readonly/>
            @else 
                <input type="text" class="form-control" name="phone2" required />
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="backlogs" class="col-12 col-sm-2 col-form-label">No. Of Backlogs</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->backlogs))
                <input type="text" class="form-control" name="backlogs" value="{{Auth::user()->backlogs}}" readonly/>
            @else 
                <input type="number" class="form-control" name="backlogs" required />
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="gap" class="col-12 col-sm-2 col-form-label">More than 1 Year of education gap</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->gap))
                <input type="text" class="form-control" name="gap" value="{{Auth::user()->gap}}" readonly/>
            @else 
                <select class="custom-select" name="gap" id="inputGroupSelect01" required>
                    <option value="YES" selected>YES</option>
                    <option value="NO">NO</option>
                </select>
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="address" class="col-12 col-sm-2 col-form-label">Address</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->address))
                <input type="text" class="form-control" name="address" value="{{Auth::user()->address}}" readonly/>
            @else 
                <input type="text" class="form-control" name="address" required />
            @endif
            </div>
        </div><br>

        <div class="form-row">
            <label for="state" class="col-12 col-sm-2 col-form-label">Home State</label>
            <div class="col-12 col-sm-4"->
            @if ((Auth::user()->phone2))
                <input type="text" class="form-control" name="state" value="{{Auth::user()->state}}" readonly/>
            @else 
                <input type="text" class="form-control" name="state" required />
            @endif
            </div>
        </div><br>

        
        <div class="form-row">
            <div class="offset-sm-2">
            @if (!(Auth::user()->state))
                <button class="btn btn-primary" type="submit">Submit</button>
            @endif    
            </div>    
        </div>
  </form>
</div>
@endsection