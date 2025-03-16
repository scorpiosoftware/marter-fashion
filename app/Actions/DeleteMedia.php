<?php

namespace App\Actions;

use Illuminate\Support\Facades\File;

class DeleteMedia
{
    public static function execute($image_url, $path = 'storage/')
    {
        return  File::delete($path . $image_url);
    }
}
