<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Category;
use App\Models\ProductView;
use App\Models\StoreSections;
use Illuminate\Http\Request;

class ProductViewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = new ProductView();
        $records = $records->orderBy("id", "desc")->paginate(10);
        return view("dashboard.productView.index", compact("records"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        $sections = StoreSections::all();
        $branches = Branch::all();
        return view('dashboard.productView.create', compact('categories', 'sections', 'branches'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $inputs = $request->all();
        if(!empty($inputs['selected'])){
            $inputs['selected'] = $inputs['selected'] == 'on' ? 1 : 0;
        }
        $record = ProductView::create($inputs);

        if ($record) {
            return redirect()->back()->with('success', 'record created successfuly');
        } else {
            return redirect()->back()->with('error', 'Error on create record');
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
        $record = ProductView::find($id);
        $categories = Category::all();
        $sections = StoreSections::all();
        $branches = Branch::all();
        return view('dashboard.productView.edit', compact('record','categories', 'sections', 'branches'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $inputs = $request->all();
        $record = ProductView::find($id);
        if(!empty($inputs['selected'])){
            $inputs['selected'] = $inputs['selected'] == 'true' ? 1 : 0;
        }
        else{
            $inputs['selected'] = $record->selected;
        }
        if ($record->update($inputs)) {
            return redirect()->back()->with('success', 'record updated successfuly');
        } else {
            return redirect()->back()->with('error', 'Error on update');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $record = ProductView::find($id);
        if ($record->delete()) {
            return redirect()->back()->with('success', 'record deleted successfuly');
        } else {
            return redirect()->back()->with('error', 'Error on delete');
        }
    }
}
