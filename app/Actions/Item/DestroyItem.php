<?php
namespace App\Actions\Item;


use App\Models\Item;

class DestroyItem {
    public static function execute($id) {
        $record = Item::find($id);
        return $record->delete();
    }
}