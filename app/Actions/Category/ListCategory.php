<?php
namespace App\Actions\Category;


use App\Models\Category;

class ListCategory {
    public static function execute($inputs = []) {
     
        $records = new Category();

        if (!empty($inputs['search'])) {
            $records = $records->where('name_en','LIKE',"%{$inputs['search']}%")
            ->orWhere('name_ar','LIKE',"%{$inputs['search']}%");
        }

        $records = $records->orderBy('id','desc');
        $records = $records->paginate(10);
        return $records;
    }
}