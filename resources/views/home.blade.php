@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">

     <div class="col-md-8">
        <h3> Announcements</h3>
            @foreach(array_reverse($data) as $data)
                <div class="card">
                

                
                
                    <div class="card-body">
                       <div class="row">
                            
                            {{ $data->message}}
                            

                       </div>
                    </div>
                
                </div>
             @endforeach
        </div>
    </div>
</div>
@endsection
