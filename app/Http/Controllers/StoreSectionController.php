<?php

namespace App\Http\Controllers;

use App\Actions\CrudActions;
use App\Models\Branch;
use App\Models\StoreSections;
use Illuminate\Http\Request;

class StoreSectionController extends Controller
{
    protected $crud;

    public function __construct(){
        $this->crud = new CrudActions(new StoreSections());
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = $this->crud->read();
        return view('dashboard.section.index',compact('records'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('dashboard.section.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $inputs = $request->validate([
            'name' => 'required'
        ]);
        $record = $this->crud->create($inputs);
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
        //
    }



    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = $this->crud->get($id);
        return view("dashboard.section.edit", compact("record"));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
        ]);
        $inputs = $request->all();
        $update = $this->crud->update($id, $inputs);
        if($update){
            return redirect()->back()->with("success","Update Record Success !");
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
        $deleted = $this->crud->delete($id);
        if($deleted){
            return redirect()->back()->with("success","Delete Record Success !");
        }else
        {
            return redirect()->back()->with("error","Check requirments error on validation !");
        }  
    }
}
