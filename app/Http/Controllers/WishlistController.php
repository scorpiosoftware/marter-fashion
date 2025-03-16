<?php

namespace App\Http\Controllers;

use App\Models\Carousel;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::all();
        $carousel = Carousel::with('images')->first();
        return view('wishlist.index',compact('categories','carousel'));
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
        //
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
        $wishlist = session()->get('wishlist');

        if (isset($wishlist[$id])) {

            unset($wishlist[$id]);

            session()->put('wishlist', $wishlist);
        }

        session()->flash('success', 'Product removed successfully');
        return redirect()->back();
    }

    public function addFav($id, Request $request)
    {
        $inputs = $request->all();
        $product = Product::find($id);

        if (!$product) {

            abort(404);
        }
        $wishlist = session()->get('wishlist');

        if (!$wishlist) {
            $wishlist = [
                $id => [
                    "name" => $product->name_en,
                    "price" => empty($product->offer_price) ?  $product->price : $product->offer_price ,
                    "photo" => $product->main_image_url
                ]
            ];
            session()->put('wishlist', $wishlist);
            // return redirect()->back()->with('success', 'Product added to wishlist successfully!');
            return redirect(url()->previous().'#'.$product->id);
        }

        $wishlist[$id] =
            [
                "name" => $product->name_en,
                "price" => empty($product->offer_price) ?  $product->price : $product->offer_price ,
                "photo" => $product->main_image_url
            ];

        session()->put('wishlist', $wishlist);

        if (request()->wantsJson()) {
            return response()->json(['message' => 'Product added to cart successfully!']);
        }

        return redirect(url()->previous().'#'.$product->id);
    }
}
