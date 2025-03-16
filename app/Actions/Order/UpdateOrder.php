<?php
namespace App\Actions\Order;

use App\Models\Order;

class UpadateOrder {
    public static function execute($id,$inputs) {
        $record = Order::find($id);
        return $record->update($inputs);
    }
}