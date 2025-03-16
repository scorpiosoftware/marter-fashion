<?php

namespace App\Http\Controllers;

use App\Actions\Brand\DestroyBrand;
use App\Actions\Brand\GetBrand;
use App\Actions\Brand\ListBrand;
use App\Actions\Brand\StoreBrand;
use App\Actions\Brand\UpadateBrand;
use App\Actions\DeleteMedia;
use App\Actions\StoreMedia;
use App\Models\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = ListBrand::execute();
        return view("dashboard.brand.index", compact("records"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view("dashboard.brand.create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name_en' => 'required',
        ]);

        $inputs = $request->all();
        if (!empty($request->file('image_url'))) {
            $inputs['image_url'] = StoreMedia::execute(
                $request->file('image_url'),
                'brands/',
                'public'
            );
        }
        $record = StoreBrand::execute($inputs);

        if($record){
            return redirect()->back()->with("success","Append Record Success !");
        }else
        {
            return redirect()->back()->with("error","Check requirments error on validation !");
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $record = GetBrand::execute($id);
        return view("dashboard.brand.show", compact("record"));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = GetBrand::execute($id);

        return view("dashboard.brand.edit", compact("record"));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name_en' => 'required',
        ]);

        $inputs = $request->all();
        $record = Brand::find($id);
        if(!empty($request->file('image_url'))){
            DeleteMedia::execute($record->image_url);
            $inputs['image_url'] = StoreMedia::execute(
                $request->file('image_url'),
                'brands/',
                'public'
            );
        }
        $update = $record->update($inputs);
        if($update){
            return redirect()->back()->with("success","Append Record Success !");
        }else
        {
            return redirect()->back()->with("error","Check requirments error on validation !");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $record = DestroyBrand::execute($id);

        if( $record ){  
            return redirect()->back()->with("success","Record deleted");
        }else{
            return redirect()->back()->with("error","Error on delete record");
        }
    }
}
