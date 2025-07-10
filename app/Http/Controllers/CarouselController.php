<?php

namespace App\Http\Controllers;

use App\Actions\Carousel\GetCarousel;
use App\Actions\DeleteMedia;
use App\Actions\StoreMedia;
use App\Models\Carousel;
use App\Models\CarouselImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\Image;
use Intervention\Image\ImageManager;

class CarouselController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $record = Carousel::with('images')->first();
        return view('dashboard.carousel.index', compact('record'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request) {}

    /**
     * Display the specified resource.
     */
    public function show(string $id) {}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id) {}

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
             $request->validate([]);
        $manager = new ImageManager(new Driver());
        $inputs = $request->except(['photos', 'logo_url']);
        $record = Carousel::find($id);

        // Handle logo upload
        if ($request->hasFile('logo_url')) {
            $inputs['logo_url'] = StoreMedia::execute(
                $request->file('logo_url'),
                'carousel/' . $record->id . '/logo',
                'public'
            );
            DeleteMedia::execute($record->logo_url);
            $record->logo_url = $inputs['logo_url'];
            $record->save();
        }

        // Handle photos upload only if files are present
        if ($request->hasFile('photos')) {
            // Log how many photos we received
            // Delete existing images
            $record = GetCarousel::execute($id);
            foreach ($record->images as $image) {
                DeleteMedia::execute($image->url);
            }
            $record->images()->delete();

            foreach ($request->file('photos') as $imagefile) {
                $image = new CarouselImage();

                // Process the image
                $myImage = $manager->read($imagefile->getPathname());
                $compressedImage = $myImage->scaleDown(1920, 1080);

                // Define the storage path
                $storagePath = 'carousel/' . $record->id;

                // Generate a unique filename
                $filename = uniqid() . '.png';

                // Store the image in public/storage
                $compressedImage->save(storage_path('app/public/' . $storagePath . '/' . $filename));

                // The public URL would be accessible at /storage/carousel/{id}/{filename}
                $publicUrl = '/' . $storagePath . '/' . $filename;
                info($publicUrl);
                $image->url = $publicUrl;
                $image->carousel_id = $record->id;
                $image->save();
            }
        }

        if ($record->update($inputs)) {
            return redirect()->back()->with("success", "Record updated successfully!");
        } else {
            return redirect()->back()->with("error", "Check requirements error on validation!");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id) {}
}
