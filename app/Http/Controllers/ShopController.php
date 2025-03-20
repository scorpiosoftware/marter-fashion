<?php

namespace App\Http\Controllers;

use App\Actions\Brand\ListBrand;
use App\Actions\Category\ListCategory;
use App\Actions\Product\GetProduct;
use App\Actions\Product\ListProduct;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\Carousel;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductComments;
use App\Models\StoreSections;
use App\View\Components\home\brands;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $inputs = $request->all();
        $request->visit();
        $products = ListProduct::execute($inputs);
        $categories = ListCategory::execute();
        $brands = Brand::all();
        $sections = StoreSections::all();
        $branches = Branch::all();
        $colors = Color::all();
        $carousel = Carousel::with('images')->first();
        return view('shop.index', compact('products', 'categories', 'brands', 'inputs', 'carousel','sections','branches','colors'));
    }

    public function addComment(Request $request)
    {
        $inputs = $request->all();
        $comment = new ProductComments();
        $comment->comment = $inputs['comment'];
        $comment->product_id = $inputs['id'];
        if (!empty($inputs['rate'])) {
            $comment->rate = $inputs['rate'];
        } else {
            $comment->rate = 0;
        }
        $comment->save();
        return redirect()->back()->with('success', 'Review Added successfuly');
    }



    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $record = GetProduct::execute($id);
        $comments = new ProductComments();
        $comments = $comments->where('product_id', $record->id)->get();

        $total_rates = $comments->sum('rate');


        $product_rate = $comments->count() > 0 ? ($total_rates / $comments->count()) : 0;
        $cart = session()->get('cart');
        $categories = Category::all();
        $carousel = Carousel::with('images')->first();
        return view("shop.show", compact("record", 'categories', 'cart', 'comments', 'product_rate','carousel'));
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
    public function filter(Request $request)
    {
        $inputs = $request->all();
        // dd($inputs);
        $products = ListProduct::execute($inputs);
        $categories = ListCategory::execute();
        $brands = Brand::all();
        $sections = StoreSections::all();
        $colors = Color::all();
        $branches = Branch::all();
        $carousel = Carousel::with('images')->first();
        $request->visit();
        return view('shop.index', compact('products', 'categories', 'brands', 'inputs','carousel','sections','branches','colors'));
    }
}
