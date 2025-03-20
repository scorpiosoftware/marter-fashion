<?php
namespace App\Actions\Product;

use App\Models\Product;

class ListProduct {
    public static function execute($inputs = []) {
     
        $records = new Product();

        if(!empty($inputs['status'])){
            $records = $records->where('status',$inputs['status']);
        }else{
            $records = $records->where('status','!=','out_of_stock');
        }
      
        if (!empty($inputs['search'])) {
            $records = $records->where('name_en','LIKE',"%{$inputs['search']}%")
            ->orWhere('name_ar','LIKE',"%{$inputs['search']}%")
            ->orWhere('code','LIKE',"%{$inputs['search']}%")
            ->orWhere('stock_quantity','==',"%{$inputs['search']}%");
        }

        if (!empty($inputs['categories'])) {
            $categoriesArray = $inputs['categories'];
            session(['category' => $categoriesArray]);
            $records = $records->whereHas('categories', function ($query) use ($categoriesArray) {
                $query->whereIn('category_id', $categoriesArray);
            });
        }
        if (!empty($inputs['min_price']) && !empty($inputs['max_price'])) {
            $records = $records->whereBetween('price', [$inputs['min_price'], $inputs['max_price']]);
        }
        if (!empty($inputs['brands'])) {
            $brandsArray = $inputs['brands'];
            $records = $records->whereIn('brand_id', $brandsArray);
        }
        if (!empty($inputs['sections'])) {
            $sectionsArray = $inputs['sections'];
            $records = $records->whereIn('section_id', $sectionsArray);
        }
        if (!empty($inputs['branch'])) {
            $branch = $inputs['branch'];
            $records = $records->where('branch_id', $branch);
        }
        if (!empty($inputs['color_id'])) {
            $colorIds = $inputs['color_id'];
            $records = $records->whereHas('colors', function ($query) use ($colorIds) {
                $query->whereIn('colors.id', $colorIds);
            });
        }
        if(!empty($inputs['sorting'])) {
            switch ($inputs['sorting']) {
                case 'asc': $records = $records->orderBy('id','ASC');break;
                case 'desc': $records = $records->orderBy('id','DESC');break;
                case 'low_price': $records = $records->orderBy('price','ASC');break;
                case 'high_price': $records = $records->orderBy('price','DESC');break;
            }
        }
        else{
            $records = $records->orderBy('id','DESC');
        }
        
        $records = $records->paginate(5);
        return $records;
    }
}