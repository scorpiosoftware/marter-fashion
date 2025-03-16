<?php
namespace App\Actions\Order;

use App\Models\Order;

class StoreOrder {
    public static function execute($inputs) {
        $record = new Order();
        return $record->create($inputs);
    }
}