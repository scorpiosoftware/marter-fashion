<?php

namespace App\Http\Controllers;

use App\Actions\Carousel\GetCarousel;
use App\Actions\DeleteMedia;
use App\Actions\StoreMedia;
use App\Models\Carousel;
use App\Models\CarouselImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class CarouselController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $record = Carousel::with('images')->first();
        return view('dashboard.carousel.index',compact('record'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
      
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([]);

        $inputs = $request->all();

        $record = Carousel::find($id);

        // add new image and delete old
        if ($request->has('logo_url')) {
            $inputs['logo_url'] = StoreMedia::execute(
                $request->file('logo_url'),
                'carousel/' . $record->id . '/logo',
                'public'
            );
            DeleteMedia::execute($record->logo_url);
            $record->logo_url =  $inputs['logo_url'];
            $record->save();
        }

        if ($request->has('images')) {
            $record = GetCarousel::execute($id);
            foreach ($record->images as $image) {
                DeleteMedia::execute($image->url);
            }
            $record->images()->delete();
            $record->save();
            // add other product images
            foreach ($request->file('images') as $imagefile) {
                $image = new CarouselImage();
                $path = StoreMedia::execute(
                    $imagefile,
                    'carousel/' . $record->id . '',
                    'public'
                );
                $image->url = $path;
                $image->carousel_id = $record->id;
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

    }
}
