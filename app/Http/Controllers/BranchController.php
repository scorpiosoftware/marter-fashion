<?php

namespace App\Http\Controllers;

use App\Actions\CrudActions;
use App\Models\Branch;
use App\Models\StoreSections;
use Illuminate\Http\Request;

class BranchController extends Controller
{

    protected $crud;
    public function __construct()
    {
        $this->crud = new CrudActions(new Branch());
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = $this->crud->read();
        $sections = StoreSections::all();
        return view('dashboard.branch.index', compact('records','sections'));
    }

    public function getBranches($id){
        $branches = Branch::with('section')->where('section_id', $id)->get();
        return response()->json(    
             $branches);
    }

    public function getAllBranches(){
        $branches = Branch::with('section')->get();
        return response()->json(    
             $branches);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $sections = StoreSections::all();
        return view('dashboard.branch.create',compact('sections'));
    }

    public function createWithSection($id)
    {
        $sections = StoreSections::all();

        return view('dashboard.branch.create',compact('sections','id'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'section_id' => 'required'
        ]);
        $inputs = $request->all();
        $record = $this->crud->create($inputs);
        if ($record) {
            return $this->index();
        } else {
            return redirect()->back()->with("error", "Check requirments error on validation !");
        }
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = $this->crud->get($id);
        $sections = StoreSections::all();
        return view('dashboard.branch.edit', compact('record','sections'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
            'section_id' => 'required'
        ]);
        $inputs = $request->all();

        $record = $this->crud->update($id, $inputs);

        if ($record) {
            return redirect()->back()->with("success", "Update Record Success !");
        } else {
            return redirect()->back()->with("error", "Check requirments error on validation !");
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
