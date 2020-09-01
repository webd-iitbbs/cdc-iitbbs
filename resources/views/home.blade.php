@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <h3> Announcements</h3><br>
    </div>
    @foreach(array_reverse($data) as $data)
    <?php $new_time = explode("-",$data->created_at);
    $date = $new_time[2];
    $date = explode(" ",$date);
    $date = $date[0];
    $month = $new_time[1];
    if($month=='01') $month = 'Jan';
    if($month=='02') $month = 'Feb';
    if($month=='03') $month = 'Mar';
    if($month=='04') $month = 'Apr';
    if($month=='05') $month = 'May';
    if($month=='06') $month = 'Jun';
    if($month=='07') $month = 'Jul';
    if($month=='08') $month = 'Aug';
    if($month=='09') $month = 'Sep';
    if($month=='10') $month = 'Oct';
    if($month=='11') $month = 'Nov';
    if($month=='12') $month = 'Dec';
     ?>
    <div class="card align-items-center">
        <div class="courses-container">
            <div class="course">
                <div class="course-preview">
                    <h6><?php echo $date; ?></h6>
                    <h2><?php echo $month; ?></h2>
                </div>
                <div class="course-info">
                    <h2>{{ $data->message}}</h2>
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div>
@endsection
