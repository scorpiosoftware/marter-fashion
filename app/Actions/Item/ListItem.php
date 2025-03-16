<?php
namespace App\Actions\Item;

use App\Models\Item;

class ListItem {
    public static function execute($inputs = []) {
     
        $record = Item::all();

        if(isset($inputs['search'])){
            $record->where('name','LIKE','%'. $inputs['search'] .'%');
        }

        $record = $record->orderBy('id','desc');

        return $record->get();
    }
}