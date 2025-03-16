<?php
namespace App\Actions\Category;


use App\Models\Category;

class UpadateCategory {
    public static function execute($id,$inputs) {
        $record = Category::find($id);
        return $record->update($inputs);
    }
}