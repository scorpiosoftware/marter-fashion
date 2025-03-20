<?php

namespace App\helpers;
use Stichoza\GoogleTranslate\GoogleTranslate;
class TranslationHelper
{
    public static function translate($text, $targetLang = 'ar')
    {        
        return GoogleTranslate::trans($text, $targetLang);
    }
}
