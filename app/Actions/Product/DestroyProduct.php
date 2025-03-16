<?php
namespace App\Actions\Product;

use App\Models\Product;

class DestroyProduct {
    public static function execute($id) {
        $record = Product::find($id);
        return $record->delete();
    }
}