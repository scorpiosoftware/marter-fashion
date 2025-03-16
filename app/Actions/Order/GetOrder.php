<?php
namespace App\Actions\Order;

use App\Models\Order;

class GetOrder {
    public static function execute($id) {
        $record = Order::find($id);
        return $record;
    }
}