<?php

namespace App\Http\Controllers;

use App\Actions\Category\DestroyCategory;
use App\Actions\Category\GetCategory;
use App\Actions\Category\ListCategory;
use App\Actions\Category\StoreCategory;
use App\Actions\Category\UpadateCategory;
use App\Actions\DeleteMedia;
use App\Actions\StoreMedia;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $inputs = $request->all();
        $records = ListCategory::execute($inputs);
        return view('dashboard.category.index', compact('records'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ListCategory::execute();
        return view('dashboard.category.create', compact('categories'));
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
                'categories/',
                'public'
            );
        }
        $record = StoreCategory::execute($inputs);

        if($record){
            return redirect()->back()->with("success", "Append Record Success !");
        }else{
            return redirect()->back()->with("error", "Check requirments error on validation !");
        }
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
        $record = GetCategory::execute($id);
        $categories = ListCategory::execute();
        return view("dashboard.category.edit", compact("record", "categories"));
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
        $record = GetCategory::execute($id);
        if(!empty($request->file('image_url'))){
            DeleteMedia::execute($record->image_url);
            $inputs['image_url'] = StoreMedia::execute(
                $request->file('image_url'),
                'categories/',
                'public'
            );
        }

        $update = $record->update($inputs);
        if($update){
            return redirect()->back()->with("success", "Append Record Success !");
        }else{
            return redirect()->back()->with("error", "Check requirments error on validation !");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $record = GetCategory::execute($id);
        $delete_image = DeleteMedia::execute($record->image_url);
        $record = DestroyCategory::execute($record->id);
        if($record){
            return redirect()->back()->with("success", "Append Record Success !");
        }else{
            return redirect()->back()->with("error", "Error On delete Record !");
        }
        // if($delete_image){

        // }else{
        //     return redirect()->back()->with("error", "Error On delete Record !");
        // }
    }
}
