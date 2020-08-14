<?php

use Illuminate\Support\Facades\Route;

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

Auth::routes();
Route::get('/redirect', 'SocialController@redirect')->name('social');
Route::get('/callback', 'SocialController@callback');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    $namespacePrefix = '\\'.config('voyager.controllers.namespace').'\\';

    Route::get('/placements/{id}/list', ['uses' => $namespacePrefix.'CandidateController@placement',   'as' => 'listP']);
    Route::get('/internships/{id}/list', ['uses' => $namespacePrefix.'CandidateController@internship',   'as' => 'listI']);
});

Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware'=>'auth'],function(){
    Route::get('/regp','RegisterController@placement');
    Route::get('/regi','RegisterController@internship');    	
    Route::get('/placement','HomeController@placement');
    Route::get('/internship','HomeController@internship');
    Route::get('/user/profile','HomeController@profile');
    Route::get('/user/profile/update','HomeController@profileupdate');
});