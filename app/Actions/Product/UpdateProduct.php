<?php
namespace App\Actions\Product;

use App\Models\Product;

class UpadateProduct {
    public static function execute($id,$inputs) {
        $record = Product::find($id);
        return $record->update($inputs);
    }
}