<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::post('/', function(Request $request){
    DB::table('contactforms')->insert([
        ['name' => $request['name'], 'email' => $request['email'], 'subject' => $request['subject'], 'message' => $request['message'] ]
    ]);
    echo '<script type="text/javascript">alert("Message sent successfully ")</script>';
    return view('welcome');
});


Auth::routes();
Route::get('/redirect', 'SocialController@redirect')->name('social');
Route::get('/callback', 'SocialController@callback');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    event(new Routing());
    $namespacePrefix = '\\'.config('voyager.controllers.namespace').'\\';

    Route::get('/placements/{id}/list', ['uses' => $namespacePrefix.'CandidateController@placement',   'as' => 'listP']);
    Route::get('/internships/{id}/list', ['uses' => $namespacePrefix.'CandidateController@internship',   'as' => 'listI']);

    event(new RoutingAfter());
});

Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware'=>'auth'],function(){
    Route::get('/regp','RegisterController@placement');
    Route::get('/regi','RegisterController@internship');    	
    Route::get('/placement','HomeController@placement');
    Route::get('/internship','HomeController@internship');
    Route::get('/user/profile','HomeController@profile');
    Route::get('/user/profile/update','HomeController@profileupdate');
    Route::get('/user/resume','HomeController@resume');
    Route::post('/user/resume/update','HomeController@resumeupdate');
});