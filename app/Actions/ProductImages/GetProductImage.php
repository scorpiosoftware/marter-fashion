<?php
namespace App\Actions\ProductImages;

use App\Models\ProductImage;

class GetProductImage {
    public static function execute($id) {
        $record = ProductImage::find($id);
        return $record;
    }
}