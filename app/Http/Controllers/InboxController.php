<?php

namespace App\Http\Controllers;

use App\Actions\Inbox\DestroyInbox;
use App\Actions\Inbox\GetInbox;
use App\Actions\Inbox\ListInbox;
use App\Actions\Inbox\StoreInbox;
use App\Models\Carousel;
use Illuminate\Http\Request;

class InboxController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = ListInbox::execute();
        return view("dashboard.inbox.index", compact("records"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $carousel = Carousel::with('images')->first();
        return view("support.contact", compact("carousel"));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // $request->validate([
        //     'name_en' => 'required',
        // ]);

        $inputs = $request->all();

        $record = StoreInbox::execute($inputs);

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
        $record = GetInbox::execute($id);
        return view("dashboard.inbox.show", compact("record"));
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
        $record = DestroyInbox::execute($id);

        if($record){  
            return redirect()->back()->with("success","Record deleted");
        }else{
            return redirect()->back()->with("error","Error on delete record");
        }
    }
}
