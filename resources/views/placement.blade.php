@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            @foreach(array_reverse($data) as $data)
                <div class="card">  
                    <div class="card-body">  
                     <form method="get" action="/regp">
                        <div class="container-fluid">
                            <div class="row">
                            <div class="col-md-6">
                                <img src="{{ $data->logo }}" height="30" width="30"><br>
                                <b>Company :</b> {{ $data->company_name }}<br>
                                <b>Role offered :</b>{{ $data->profile}}<br>
                                <b>Website :</b><a href=" {{ $data->site}}"> {{ $data->site}}</a>
                            </div>
                            <div class="col-md-6">
                                <b>Department(s) allowed :</b>{{ $data->department }}<br>
                                <b>Exam Date :</b>{{ $data->exam_date }}<br>
                                <b>Interview date :</b>{{ $data->interview_date }}<br>
                                <b>Important Details:</b>{{ $data->more }}<br>
                            </div>
                            </div>
                            <div class="justify-content-center">    
                                <a href=""><button class="btn btn-primary btn-sm" type="submit"> Register </button></a>
                            </div>
                            <input type="hidden" name="id" value="{{ $data->id }}"/> 
                        </div> 
                      </form>
                    </div>  
                </div><br>
              @endforeach
        </div>
    </div>
</div>
@endsection