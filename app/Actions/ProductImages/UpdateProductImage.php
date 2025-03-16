<?php
namespace App\Actions\ProductImages;

use App\Models\ProductImage;

class UpadateProductImage {
    public static function execute($id,$inputs) {
        $record = ProductImage::find($id);
        return $record->update($inputs);
    }
}