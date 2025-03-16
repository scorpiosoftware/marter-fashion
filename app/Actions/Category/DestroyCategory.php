<?php
namespace App\Actions\Category;
use App\Models\Category;

class DestroyCategory {
    public static function execute($id) {
        $record = Category::find($id);
        return $record->delete();
    }
}