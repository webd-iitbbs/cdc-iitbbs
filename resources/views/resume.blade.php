@extends('layouts.app')

@section('content')
<?php 
$id = Auth::user()->roll;
?>
<div class="container">
    <h3>RESUME</h3><br>

    <form method="post" class="md-form" enctype="multipart/form-data"  action="/user/resume/update">
      @csrf
        <div class="row">
        <?php 
        if (Storage::disk('local')->exists('Resume/'.$id.'-01.pdf')) { 
            $url = Storage::url('Resume/'.$id.'-01.pdf');?>
            <div class ="col-2">
                <p> Resume - 1</p>
                <a href="/storage/app/Resume/<?php echo $id; ?>-01.pdf"> Your Submission </a> 
            </div>
            <div class="col-10">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume1" id="resume1">
                    <label class="custom-file-label" for="customFile">Replace file</label>
                </div>
            </div>
        <?php }else { ?>
            <div class ="col-2">
                <p> Resume - 1</p>
            </div>
            <div class="col-10">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume1" id="resume1">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
        <?php }?>
        </div><br> 

        <div class="row">
        <?php 
        if (Storage::disk('local')->exists('Resume/'.$id.'-02.pdf')) { 
            $url = Storage::url('Resume/'.$id.'-02.pdf');?>
            <div class ="col-2">
                <p> Resume - 2</p>
                <a href="/storage/app/Resume/<?php echo $id; ?>-02.pdf"> Your Submission </a> 
            </div>
            <div class="col-10">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume2" id="resume2">
                    <label class="custom-file-label" for="customFile">Replace file</label>
                </div>
            </div>
        <?php }else { ?>
            <div class ="col-2">
                <p> Resume - 2</p>
            </div>
            <div class="col-10">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume2" id="resume2">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
        <?php }?>
        </div><br> 

        <div class="row">
        <?php 
        if (Storage::disk('local')->exists('Resume/'.$id.'-03.pdf')) { 
            $url = Storage::url('Resume/'.$id.'-03.pdf');?>
            <div class ="col-3">
                <p> Resume - 3</p>
                <a href="/storage/app/Resume/<?php echo $id; ?>-03.pdf"> Your Submission </a> 
            </div>
            <div class="col-9">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume3" id="resume3">
                    <label class="custom-file-label" for="customFile">Replace file</label>
                </div>
            </div>
        <?php }else { ?>
            <div class ="col-2">
                <p> Resume - 3</p>
            </div>
            <div class="col-10">
                <div class="custom-file col-12 col-sm-4">
                    <input type="file" class="custom-file-input" name ="resume3" id="resume3">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
        <?php }?>
        </div><br> 

        <div class="form-row">
            <div class="offset-sm-2">
                <button class="btn btn-primary" name="insert" id="insert" value="insert" type="submit">Submit</button>
            </div>    
        </div>
    </form>
<br><br><br>

    <script>
        $(document).ready(function() {
           $('#insert').click(function(){
               console.log("hi");
               var pdf_name = $('#resume1').val();
               if(pdf_name== ''){
                   alert('Please select atleast one resume');
                   return false;
               }
               else{
                   var extension = $('#resume1').val().split('.').pop().toLowerCase();
                   if(jQuery.inArray(extension, ['pdf']) == -1){
                       alert(' Please Upload pdf file');
                       $('#resume1').val('');
                       return false;
                   }
                   if(!$('#resume2').val()==''){
                        var extension = $('#resume2').val().split('.').pop().toLowerCase();
                        if(jQuery.inArray(extension, ['pdf']) == -1){
                            alert(' Please Upload pdf file');
                            $('#resume2').val('');
                            return false;
                        }
                   }
                   if(!$('#resume3').val()==''){
                        var extension = $('#resume3').val().split('.').pop().toLowerCase();
                        if(jQuery.inArray(extension, ['pdf']) == -1){
                            alert(' Please Upload pdf file');
                            $('#resume3').val('');
                            return false;
                        }
                   }
               }
           }); 
        });
    </script>

@endsection