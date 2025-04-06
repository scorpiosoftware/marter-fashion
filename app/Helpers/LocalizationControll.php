<?php

namespace App\Helpers;

class LocalizationControll
{

    public static function setLocal(){
        $locale = session()->get('lang');
        if($locale == 'en'){
            session()->forget('lang');
            session()->put('lang','en');
        }else if($locale == 'ar'){
            session()->forget('lang');
            session()->put('lang','ar');
        }
        else{
            session()->forget('lang');
            session()->put('lang','ar');
        }
    }

}
