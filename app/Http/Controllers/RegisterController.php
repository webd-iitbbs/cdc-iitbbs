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
        
        $result= DB::table('placements')->where('id',$id)->value('company_name');

        DB::update("UPDATE `fourthyear` SET `$result` = '1'");
        
        echo "Registered successfully";

        header("refresh:2, url=/placement");
    }

    public function internship()
    {   
        $id = $_GET['id'];
        
        $result= DB::table('internships')->where('id',$id)->value('company_name');

        DB::update("UPDATE `thirdyear` SET `$result` = '1'");

        echo "Registered successfully";

        header("refresh:2, url=/internship");
    }
}