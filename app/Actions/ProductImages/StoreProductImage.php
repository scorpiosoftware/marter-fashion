<?php
namespace App\Actions\ProductImages;

use App\Models\ProductImage;

class StoreProductImage {
    public static function execute($inputs) {
        $record = new ProductImage();
        return $record->create($inputs);
    }
}