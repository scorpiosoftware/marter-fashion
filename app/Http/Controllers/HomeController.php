<?php

namespace App\Http\Controllers;

use App\Actions\Brand\ListBrand;
use App\Actions\Category\ListCategory;
use App\Actions\Product\ListProductsByCategory;
use App\Models\Carousel;
use App\Models\Color;
use App\Models\ProductView;
use Illuminate\Http\Request;
use Masoudi\Laravel\Visitors\Models\Visitor;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $request->visit();
        $visitor = Visitor::latest('created_at')->first();
        $ref =  request()->headers->get("referer") != null ? request()->headers->get("referer") : '/';
        $visitor->referer =  $ref ;
        $visitor->save();
        
        $locale = session()->get('lang');
        // session()->put('lang',$locale);
        if($locale == 'en'){
            session()->forget('lang');
            session()->put('lang','en');
        }else if($locale == 'ar'){
            session()->forget('lang');
            session()->put('lang','ar');
        }
        else{
            session()->forget('lang');
            session()->put('lang','ar');
        }
        $bestSeller = ListProductsByCategory::execute(1);
        $perfumes = ListProductsByCategory::execute(category_id: 10);
        $categories = ListCategory::execute();
        $brands = ListBrand::execute();
        $carousel = Carousel::with('images')->first();
        $colors = Color::all();
        $productViews = ProductView::where('selected',true)->get();
        return view('welcome', compact('bestSeller','perfumes','categories', 'brands','carousel','productViews','colors'));
    
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
        //
    }
}
