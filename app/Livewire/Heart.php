<?php

namespace App\Livewire;

use App\Http\Controllers\WishlistController;
use App\Models\Product;
use Livewire\Component;

class Heart extends Component
{
    public bool $isFavorited = false;

    public int $id;

    public function mount($record)
    {
        $this->id = $record->id;
        if (session('wishlist')) {
            foreach (session('wishlist') as $id => $details) {
                $this->isFavorited = $details['name'] == $record->name_en;
            }
        }
    }
    public function toggleFavorite()
    {
        $this->isFavorited = !$this->isFavorited;
    }

    public function addFav($id)
    {
        $product = Product::find($id);

        if (!$product) {
            abort(404);
        }
        $wishlist = session()->get('wishlist');
        if (!$this->isFavorited) {
            if (!$wishlist) {
                $wishlist = [
                    $id => [
                        "name" => $product->name_en,
                        "price" => empty($product->offer_price) ?  $product->price : $product->offer_price,
                        "photo" => $product->main_image_url
                    ]
                ];
                session()->put('wishlist', $wishlist);
                $this->isFavorited = true;
            }

            $wishlist[$id] =
                [
                    "name" => $product->name_en,
                    "price" => empty($product->offer_price) ?  $product->price : $product->offer_price,
                    "photo" => $product->main_image_url
                ];
            $this->isFavorited = true;
            $this->dispatch('toast:added', [
                'message' => 'Product added to wishlist!',
                'icon' => 'success'
            ]);
            session()->put('wishlist', $wishlist);
        } else {
            if (isset($wishlist[$id])) {

                unset($wishlist[$id]);

                session()->put('wishlist', $wishlist);
                $this->isFavorited = false;
                $this->dispatch('toast:removed', [
                    'message' => 'Product removed from wishlist!',
                    'icon' => 'success'
                ]);
            }
        }
    }
    public function render()
    {
        return view('livewire.heart');
    }
}
