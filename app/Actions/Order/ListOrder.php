<?php
namespace App\Actions\Order;

use App\Models\Order;

class ListOrder {
    public static function execute($inputs = []) {
     
        $record = Order::all();

        if(isset($inputs['search'])){
            $record->where('auto_nb','LIKE','%'. $inputs['search'] .'%');
        }

        if(isset($inputs['status'])){
            $record->where('status',$inputs['status']);
        }

        $record = $record->orderBy('id','desc');

        return $record->get();
    }
}