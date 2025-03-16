<?php
namespace App\Actions\Brand;

use App\Models\Brand;

class ListBrand {
    public static function execute($inputs = []) {
     
        $record = new Brand();

        if(isset($inputs['search'])){
            $record->where('name_en','LIKE','%'. $inputs['search'] .'%');
        }

        $record = $record->orderBy('id','desc');
        $record = $record->paginate(10);
        return $record;
    }
}