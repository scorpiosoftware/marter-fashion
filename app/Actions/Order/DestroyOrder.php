<?php
namespace App\Actions\Order;

use App\Models\Order;

class DestroyOrder {
    public static function execute($id) {
        $record = Order::find($id);
        return $record->delete();
    }
}