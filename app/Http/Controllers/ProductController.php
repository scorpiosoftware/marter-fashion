<?php

namespace App\Http\Controllers;

use App\Actions\Brand\ListBrand;
use App\Actions\Category\ListCategory;
use App\Actions\DeleteMedia;
use App\Actions\Product\DestroyProduct;
use App\Actions\Product\GetProduct;
use App\Actions\Product\ListProduct;
use App\Actions\Product\StoreProduct;
use App\Actions\Product\UpadateProduct;
use App\Actions\StoreMedia;
use App\Models\Branch;
use App\Models\Color;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\StoreSections;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Symfony\Component\Console\Input\Input;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $inputs = $request->all();
        $records = ListProduct::execute($inputs);

        return view("dashboard.product.index", compact("records", 'inputs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ListCategory::execute();
        $brands = ListBrand::execute();
        $sections = StoreSections::all();
        $colors = Color::all();
        return view("dashboard.product.create", compact('categories', 'brands','sections','colors'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
        'section_id' => 'required',
        'branch_id'  => 'required',
        'name_en' => 'required',
        'brand_id' => 'required',
        'price' => 'required',
        'description_en' => 'required'
        ]);

        $inputs = $request->all();

        $record = StoreProduct::execute($inputs);
        if ($record) {

            // add main product image and attach categories
            if($request->has('categories')){
                $record->categories()->attach($inputs['categories']);
            }
            if($request->has('colors')){
                $record->colors()->attach($inputs['colors']);
            }
         
            if (!empty($request->file('main_image_url'))) {
                $main_image = StoreMedia::execute(
                    $request->file('main_image_url'),
                    'product/'. $record->id . '/main',
                    'public'
                );
                $record->main_image_url = $main_image;
            }
            $record->save();

            // add other product images
            if(!empty($request->file('images'))){
                foreach ($request->file('images') as $imagefile) {
                    $image = new ProductImage();
                    $path = StoreMedia::execute(
                        $imagefile,
                        'product/'. $record->id . '',
                        'public'
                    );
                    $image->image_url = $path;
                    $image->product_id = $record->id;
                    $image->save();
                }
            }


            return redirect()->back()->with("success", "Append Record Success !");
        } else {
            return redirect()->back()->with("error", "Check requirments error on validation !");
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $record = GetProduct::execute($id);
        return view("dashboard.product.show", compact("record"));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = GetProduct::execute($id);
        $categories = ListCategory::execute();
        $brands = ListBrand::execute();
        $sections = StoreSections::all();
        $branches = Branch::all();
        $colors = Color::all();
        return view("dashboard.product.edit", compact("record", "categories", "brands",'colors','sections','branches'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'section_id' => 'required',
            'branch_id'  => 'required',
            'name_en' => 'required',
            'brand_id' => 'required',
            'price' => 'required',
            'description_en' => 'required'
        ]);

        $inputs = $request->all();

        $record = Product::find($id);

        if($request->has('categories')){
            $record->categories()->detach();
            $record->categories()->attach($inputs['categories']);
        }
        if($request->has('colors')){
            $record->colors()->detach();
            $record->colors()->attach($inputs['colors']);
        }


        // add new image and delete old
        if ($request->has('main_image_url')) {
            $inputs['main_image_url'] = StoreMedia::execute(
                $request->file('main_image_url'),
                'product/'. $record->id . '/main',
                'public'
            );
            DeleteMedia::execute($record->main_image_url);
            $record->main_image_url =  $inputs['main_image_url'];
            $record->save();
        }
           
        // delete images and add new images
        if ($request->has('images')) {
            $record = GetProduct::execute($id);
            foreach($record->images as $image){
                DeleteMedia::execute($image->image_url);
            }
            $record->images()->delete();
            $record->save();
            // add other product images
            foreach ($request->file('images') as $imagefile) {
                $image = new ProductImage();
                $path = StoreMedia::execute(
                    $imagefile,
                    'product/' . $record->id . '',
                    'public'
                );
                $image->image_url = $path;
                $image->product_id = $record->id;
                $image->save();
            }
            //
        }
        if ($record->update($inputs)) {
            return redirect()->back()->with("success", "Append Record Success !");
        } else {
            return redirect()->back()->with("error", "Check requirments error on validation !");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $record = GetProduct::execute($id);

        $items = OrderItem::where('product_id',$record->id)->get();
        if($items->count() <= 0){
            File::deleteDirectory('storage/'.$record->id);
            $record = DestroyProduct::execute($id);
            if ($record) {
                return redirect()->back()->with("success", "Record deleted");
            } else {
                return redirect()->back()->with("error", "Error on delete record");
            }
        }else{
            return redirect()->back()->with("error", "Cannot delete ordered products instead change status to [out of stock] or update product fields");
        }

    }
}
