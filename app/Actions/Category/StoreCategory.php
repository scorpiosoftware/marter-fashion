<?php
namespace App\Actions\Category;


use App\Models\Category;

class StoreCategory {
    public static function execute($inputs) {
        $record = new Category();
        return $record->create($inputs);
    }
}