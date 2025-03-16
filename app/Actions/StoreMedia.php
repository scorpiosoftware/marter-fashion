<?php

namespace App\Actions;

use Illuminate\Support\Facades\Storage;

class StoreMedia
{
    public static function execute($file, $root = '', $disk = 'public')
    {
        return Storage::disk($disk)->put($root, $file);
    }
}
