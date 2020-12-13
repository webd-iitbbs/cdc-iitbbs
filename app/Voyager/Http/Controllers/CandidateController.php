<?php

namespace App\Voyager\Http\Controllers;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CandidateController extends Controller
{
    public function placement (Request $request){
        $id = $request->route('id');        ;
        $company = \DB::table('placements')->where('id', $id)->value('company_name');
        $data = \DB::table('fourthyear')->where($company, '1')->get();

        return Voyager::view('voyager::bread.list',compact('data', 'company') );
 
    }

    public function internship (Request $request){
        $id = $request->route('id');        ;
        $company = \DB::table('internships')->where('id', $id)->value('company_name');
        $data = \DB::table('thirdyear')->where($company, '1')->get();

        return Voyager::view('voyager::bread.list',compact('data', 'company') );
 
    }

}
