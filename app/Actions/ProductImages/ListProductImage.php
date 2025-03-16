<?php
namespace App\Actions\ProductImages;

use App\Models\ProductImage;

class ListProductImage {
    public static function execute($inputs = []) {
     
        $record = ProductImage::all();

        if(isset($inputs['search'])){
            $record->where('name','LIKE','%'. $inputs['search'] .'%');
        }

        $record = $record->orderBy('id','desc');

        return $record->get();
    }
}