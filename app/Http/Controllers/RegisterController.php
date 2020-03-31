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

        $profile=DB::table('placements')->where('id',$id)->value('profile');

        return view('register1')->with('result',$result)
                                ->with('id' ,$id)
                                ->with('profile' ,$profile);
	}

    public function placement2()
    {   
        $id = $_GET['id'];

        $table = DB::table('placements')->where('id',$id)->value('company_name');

        $table = strtolower($table);

        $data = DB::getSchemaBuilder()->getColumnListing("$table");

        return view('register2')->with('data', $data)
                                ->with('id', $id)
                                ->with('table', $table);
    }

    public function placementf()
    {
        $company_id = $_GET['company_id'];

        $table = DB::table('placements')->where('id',$company_id)->value('company_name');

        $table = strtolower($table);

        $data = DB::getSchemaBuilder()->getColumnListing("$table");

        $s = 'registered successfully';

        $insertValues = [];
        foreach($data as $key => $columnName){ 
          $insertValues[$key] = $_GET[$columnName];
        }


        $columns = [];
        foreach($data as $key => $data){ 
          $columns[$key] = $data;
        }
        DB::table($table)
           ->insert(['$columns' => $insertValues,]);
        
        echo "$s";
    }
}