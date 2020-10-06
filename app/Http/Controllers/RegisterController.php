<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class RegisterController extends Controller
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
    public function placement()
    {   
        $id = $_GET['id'];

        $resume = $_GET['resume'];
        
        $result= DB::table('placements')->where('id',$id)->value('company_name');

        $r = $result.'resume';

        DB::update("UPDATE `fourthyear` SET `$result` = '1', `$r` = '$resume'");
        
        echo "<script> alert('Registered successfully'); </script>";

        header("Refresh: 1; url=/placement");
    }

    public function internship()
    {   
        $id = $_GET['id'];

        $resume = $_GET['resume'];
        
        $result= DB::table('internships')->where('id',$id)->value('company_name');

        $r = $result.'resume';

        DB::update("UPDATE `thirdyear` SET `$result` = '1', `$r` = '$resume'");

        echo "<script> alert('Registered successfully'); </script>";

        header("Refresh: 1; url=/internship");
    }
}