<?php
namespace App\Actions\Product;

use App\Models\Product;

class StoreProduct {
    public static function execute($inputs) {
        $record = new Product();
        return $record->create($inputs);
    }
}