@extends('layouts.app')

@section('content')

<div class="container dropdown" style="display:block;">
  <button class="btn dropdown-toggle" style="display:block;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Sort By
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="/internship?sort=company_name&dir=Asc">Company Name: A to Z</a>
    <a class="dropdown-item" href="/internship?sort=company_name&dir=Desc">Company Name: Z to A</a>
    <a class="dropdown-item" href="/internship?sort=deadline&dir=Desc">Deadline: latest to oldest</a>
    <a class="dropdown-item" href="/internship?sort=deadline&dir=Asc">Deadline: oldest to latest</a>
    <a class="dropdown-item" href="/internship?sort=examdate&dir=Desc">Exam Date: latest to oldest</a>
    <a class="dropdown-item" href="/internship?sort=examdate&dir=Asc">Exam Date: oldest to latest</a>
    <a class="dropdown-item" href="/internship?sort=CTC&dir=Desc">CTC: highest to lowest</a>
    <a class="dropdown-item" href="/internship?sort=CTC&dir=Asc">CTC: lowest to highest</a>
  </div>
</div>
@foreach ($data as $data)
<?php $department = explode('"', $data->department);
    $course = explode('"', $data->course); ?>       
    @foreach($department as $department)
    @if(substr(Auth::user()->roll, 2, 2) == $department )
    @foreach($course as $course)
    @if(substr(Auth::user()->roll, 4, 2) == $course )
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="bor">
              
                <div class="row">
                <div class="col-2 co fir">
                    <img src="{{ $data->logoimage }}" width="100px" height="auto">
                    <div class="cen"><br>
                    <h5><b> {{ $data->company_name }}</b></h5><br>
                    <p class="fi"><i>{{ $data->profile}}</i><br></p>
                    <br>
                </div>

                </div>
                <div class="col-4 co sec">
                    <h6 ><span class="head"><b>Eligibility Criteria</b></span></h6>
                    <div class="para">
                    <p>X: {{ $data->TenthScore}} <br>
                    XII : {{ $data->TwelfthScore}}<br>CGPA : {{ $data->cgpa}}
                    <!-- Course(s): <b><i>{{ $data->course}}</i></b><br>Department(s): <b><i><span class="sp">{{ $data->department}}</span></i></b>  -->
                    </p>
                    <p><i>Active backlog allowed : <span class="back">{{ $data->activebacklog}} </span> <br>
                    Total backlog allowed : <span class="back">{{ $data->totalbacklog}}</span></i></p>
                    </div>


                </div>
                <div class="col-3 co">
                    <h6 ><span class="head"><b>Details</b></span></h6>
                    <p>Exam Date : {{ $data->examdate}}<br>Interview Date : {{ $data->interviewdate}}<br>Status : {{ $data->status}}<br>Deadline : <br><i>{{ $data->deadline}}</i></p>

                </div>
                <div class="col-3 co">
                    <div class="tab">
                        <h6 ><span class="head"><b>Remarks</b></span></h6><br>

                        <table>
                        <tr>
                        <th>CTC</th>
                        <th>Take Home</th>
                        </tr>
                        <tr>
                        <td>{{ $data->CTC}}</td>
                        <td>{{ $data->TakeHome}}</td>
                        </tr>

                        </table>
                    </div><br><br>
                    <div class="justify-content-center">  
                    <?php $db;
                    $result = $data->company_name;
                    $db = \DB::table('thirdyear')->where($result, '=', 1)
                                                 ->where('name', '=', Auth::user()->name)
                                                 ->count();
                    if(!$db) { ?>  
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Register</button>
                    </div><br>
                    <?php }else { ?>  
                        <a href="#" class="btn btn-primary btn-sm disabled" role="button" aria-disabled="true">Registered</a>
                    <?php } ?>
                    
                </div>
                
            </div>
        </div>
    </div> 

    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Choose a Resume</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form action="regi" method="get">
                    <select class="custom-select" name="resume" id="inputGroupSelect01" required>
                        <option value="1" selected>Resume-1</option>
                        <option value="2">Resume-2</option>
                        <option value="3">Resume-3</option>
                    </select>
                        <br><br>
                    <input type="submit" class="btn btn-primary" name="submit" value="submit">
                    <input type="hidden" name="id" value="{{ $data->id }}"/> 
                </form>    
            </div>
            
        </div>
    </div>
</div>

    @endif
    @endforeach
    @endif
    @endforeach
@endforeach

@endsection