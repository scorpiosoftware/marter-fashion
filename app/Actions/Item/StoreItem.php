<?php
namespace App\Actions\Item;

use App\Models\Item;

class StoreItem {
    public static function execute($inputs) {
        $record = new Item();
        return $record->create($inputs);
    }
}