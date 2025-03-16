<?php

namespace App\Actions\Dashboard;

use App\Models\Order;

class AppliedOrders
{

    public static function execute()
    {
        $orders = new Order();

        $orders = $orders->where('status', 'delivered');
        return $orders;
    }
}
