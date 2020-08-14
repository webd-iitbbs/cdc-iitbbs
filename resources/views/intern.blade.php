@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        @foreach(array_reverse($data) as $data)
        <?php $department = explode('"', $data->department);  ?>       
            @foreach($department as $department)
            @if(substr(Auth::user()->roll, 2, 2) == $department )

            <div class="bor">
              <form action="regi" method="get">
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
                        <button class="btn btn-primary btn-sm" type="submit"> Register </button>
                        <input type="hidden" name="id" value="{{ $data->id }}"/> 
                    </div><br>
                    <?php }else { ?>  
                        <a href="#" class="btn btn-primary btn-sm disabled" role="button" aria-disabled="true">Registered</a>
                    <?php } ?>
                    </form>
                </div>
                
            </div>
            
            @endif
            @endforeach
        @endforeach
    </div>
</div>
@endsection