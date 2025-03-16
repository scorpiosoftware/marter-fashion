<?php
namespace App\Actions\Brand;

use App\Models\Brand;

class GetBrand {
    public static function execute($id) {
        $record = Brand::find($id);
        return $record;
    }
}