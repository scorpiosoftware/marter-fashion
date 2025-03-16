<?php
namespace App\Actions\Item;

use App\Models\Item;

class GetItem {
    public static function execute($id) {
        $record = Item::find($id);
        return $record;
    }
}