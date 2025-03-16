<?php
namespace App\Actions\Item;

use App\Models\Item;

class UpadateItem {
    public static function execute($id,$inputs) {
        $record = Item::find($id);
        return $record->update($inputs);
    }
}