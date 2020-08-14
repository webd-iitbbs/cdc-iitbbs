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

    public function internship()
    {
        $data = \DB::select('select * from internships');

        $year = substr(Auth::user()->roll, 0, 2);

        if ($year=='18' || Auth::user()->role_id == '1') return view('intern',['data'=>$data]);

        else return view ('noaccess');        
    }
    public function placement()
    {
        $data = \DB::select('select * from placements');

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
            $phone = $request['phone'];
            $cgpa = $request['cgpa'];
            $tenth = $request['tenth'];
            $twelfth = $request['twelfth'];
        
        DB::update("UPDATE `users` SET `roll` = '$roll' , `phone` = '$phone' , `cgpa` = '$cgpa' , `TenthScore` = '$tenth' ,`TwelfthScore` = '$twelfth'  WHERE `users`.`id` = '$id'");
        
        if (substr($roll, 0, 2) == '18'){
        DB::table('thirdyear')->insert([
            ['name' => Auth::user()->name, 'email' => Auth::user()->email, 'roll' => $roll, 'phone' => $phone ]
        ]);
        }

        if (substr($roll, 0, 2) == '17') 
        DB::table('fourthyear')->insert([
            ['name' => Auth::user()->name, 'email' => Auth::user()->email, 'roll' => $roll, 'phone' => $phone ]
        ]);

        echo "$s";
        header("refresh:2, url=/user/profile");
    }
}
