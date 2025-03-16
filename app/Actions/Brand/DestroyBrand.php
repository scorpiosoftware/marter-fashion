<?php
namespace App\Actions\Brand;

use App\Models\Brand;

class DestroyBrand {
    public static function execute($id) {
        $record = Brand::find($id);
        return $record->delete();
    }
}