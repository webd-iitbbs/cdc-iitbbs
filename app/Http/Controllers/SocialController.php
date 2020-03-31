<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Socialite;
use Auth;
use Exception;



class SocialController extends Controller
{
    public function redirect()
    {
        return Socialite::driver('google')->redirect();
    }


    public function callback()
    {            
        
        $getInfo = Socialite::driver('google')->user();
     
        $user = $this->createUser($getInfo,'google');
     
        auth()->login($user);
     
        return redirect()->to('/home');
 
    }

    function createUser($getInfo,$provider)
    {
         
        $user = User::where('provider_id', $getInfo->id)->first();
         
        if (!$user) {
            $user = User::create([
                'name'     => $getInfo->name,
                'email'    => $getInfo->email,
                'provider' => 'google',
                'provider_id' => $getInfo->id,
                // 'avatar'   => $getInfo->,
            ]);
        }
        return $user;
    }
}