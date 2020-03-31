<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;


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
    
    public function reg()
    {
        return view('register1');
    }

    public function internship()
    {
        $data = \DB::select('select * from internships');
        
        return view('intern',['data'=>$data]);
        
    }
    public function placement()
    {
        $data = \DB::select('select * from placements');

        return view('placement',['data'=>$data]);
    }

    public function profile()
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

        return view('profile');
    }

    public function profileedit()
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

        return view('profileedit');
    }

    public function profileupdate(Request $request)
    {   
        $id = Auth::user()->id;

        $user = DB::table('users')->where('id', '$id')->first();

            $s = 'updated successfully';
            $roll = $request['roll'];
            $phone = $request['phone'];
            $cgpa = $request['cgpa'];
        
        DB::update("UPDATE `users` SET `roll` = '$roll' , `phone` = '$phone' , `cgpa` = '$cgpa'  WHERE `users`.`id` = '$id'");

        echo "$s";
        header("refresh:2, url=/user/profile");
    }
}
