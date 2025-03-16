<?php
namespace App\Actions\ProductImages;

use App\Models\ProductImage;

class DestroyProductImage {
    public static function execute($id) {
        $record = ProductImage::find($id);
        return $record->delete();
    }
}