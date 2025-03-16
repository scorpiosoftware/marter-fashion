<?php

namespace App\Actions\Product;

use App\Models\Category;
use App\Models\Product;

class ListProductsByCategory
{
    public static function execute($category_id)
    {
        $category = Category::with('products')->find($category_id);
        $records = new Product();
        if($category){
            $records = $category->products()->where('status','!=','out_of_stock')->get();
        }
        else{
            $records = Product::where('status','!=','out_of_stock')->get();
        }
        return $records;
    }
}
