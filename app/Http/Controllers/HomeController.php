<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Storage;


class HomeController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {   
        $data  = \DB::select('select * from announcements');

        return view('home',['data'=>$data]);
    }

    public function internship(Request $request)
    {
        
        if($request->has('sort')&& $request->has('dir')){
            $sortby = $request['sort'];
            $sortdir = $request['dir'];
        }
        else {
            $sortby = 'created_at';
            $sortdir = 'Desc';
        }

        $data = DB::table('internships')->orderBy($sortby, $sortdir)->get();

        $year = substr(Auth::user()->roll, 0, 2);

        if ($year=='18' || Auth::user()->role_id == '1') return view('intern',['data'=>$data]);

        else return view ('noaccess');        
    }
    public function placement(Request $request)
    {
        if($request->has('sort')&& $request->has('dir')){
            $sortby = $request['sort'];
            $sortdir = $request['dir'];
        }
        else {
            $sortby = 'created_at';
            $sortdir = 'Desc';
        }

        $data = DB::table('placements')->orderBy($sortby, $sortdir)->get();

        $year = substr(Auth::user()->roll, 0, 2);

        if ($year=='17' || Auth::user()->role_id == '1') return view('placement',['data'=>$data]);

        else return view ('noaccess');
    }

    public function profile()
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

        return view('profile');
    }

    public function profileupdate(Request $request)
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

            $s = 'updated successfully';
            $roll = $request['roll'];
            $branch = $request['branch'];
            $degree = $request['degree'];
            $gender = $request['gender'];
            $cgpa = $request['cgpa'];
            $tenth = $request['tenth'];
            $twelfth = $request['twelfth'];
            $phone = $request['phone'];
            $phone2 = $request['phone2'];
            $email2 = $request['email2']; 
            $backlogs = $request['backlogs'];
            $gap = $request['gap']; 
            $address = $request['address'];          
            $state = $request['state'];

        DB::update("UPDATE `users` SET `roll` = '$roll' , `branch` = '$branch' ,`degree` = '$degree' , `gender` = '$gender' ,
        `phone` = '$phone' ,`phone2` = '$phone2', `email2` = '$email2' , `cgpa` = '$cgpa' , `TenthScore` = '$tenth' ,`TwelfthScore` = '$twelfth',
        `backlogs` = '$backlogs' , `gap` = '$gap' , `address` = '$address' , `state` = '$state'  WHERE `users`.`id` = '$id'");
        
        if (substr($roll, 0, 2) == '18' && ($degree == 01 || $degree == 02) ){
        DB::table('thirdyear')->insert([
            ['name' => Auth::user()->name, 'email' => Auth::user()->email]
        ]);
        }

        if ((substr($roll, 0, 2) == '17' && $degree == 01) || (substr($roll, 0, 2) == '16' && $degree == 02) ) 
        DB::table('fourthyear')->insert([
            ['name' => Auth::user()->name, 'email' => Auth::user()->email]
        ]);

        echo "<script> alert('updated successfully') </script>";
        header("Refresh: 1; url= /user/profile");
    }

    public function resume()
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

        return view('resume');
    }

    public function resumeupdate(Request $request)
    {
        $id = Auth::user()->roll;
        
        if($request->file('resume1')){
            if (Storage::disk('local')->exists('Resume/'.$id.'-01.pdf'))
                Storage::disk('local')->delete('Resume/'.$id.'-01.pdf');
            $file1 = $request->file('resume1');
            $filename1 = $id . '-01.' . $file1->getClientOriginalExtension();
            $path1 = $file1->storeAs('Resume', $filename1);
            $count = 1;
        }    

        if($request->file('resume2')){
            if (Storage::disk('local')->exists('Resume/'.$id.'-02.pdf'))
                Storage::disk('local')->delete('Resume/'.$id.'-02.pdf');
            $file2 = $request->file('resume2');
            $filename2 = $id . '-02.' . $file2->getClientOriginalExtension();
            $path2 = $file1->storeAs('Resume', $filename2);
            $count++;
        }

        if($request->file('resume3')){
            if (Storage::disk('local')->exists('Resume/'.$id.'-03.pdf'))
                Storage::disk('local')->delete('Resume/'.$id.'-03.pdf');
            $file3 = $request->file('resume3');
            $filename3 = $id . '-03.' . $file3->getClientOriginalExtension();
            $path3 = $file1->storeAs('Resume', $filename3);
            $count++;
        }
       
        echo '<script type="text/javascript">alert("'.$count.' File(s) uploaded successfully ")</script>';
        header("Refresh: 1; url= /user/profile");
    }
}
