<?php

namespace App\Livewire;

use App\Models\Product as ModelsProduct;
use Illuminate\Support\Facades\Event;
use Livewire\Component;

class Product extends Component
{
    public $item;
    public function mount() {

    }

    public function addToCart($id)
    {
        $product = ModelsProduct::find($id);
        if (!$product) {

            abort(404);
        }
        $cart = session()->get('cart');
        $price = $product->price;
        if (!empty($product->offer_price) || $product->offer_price > 0) {
            $price = $product->offer_price;
        }
        if (!$cart) {
            $cart = [
                $id => [
                    "name" => $product->name_en,
                    "quantity" => 0,
                    "price" => $price,
                    "photo" => $product->main_image_url
                ]
            ];
            $cart[$id]['quantity']++;
            $cart[$id]['price'] = $cart[$id]['quantity'] * $price;

            session()->put('cart', $cart);
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return redirect()->back()->with('message', 'Product added to cart successfully!');
        }

        if (isset($cart[$id])) {
                $cart[$id]['quantity']++;
                $cart[$id]['price'] = $cart[$id]['quantity'] * $price;
            session()->put('cart', $cart);
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return redirect()->back()->with('message', 'Product added to cart successfully!');
        }

        $cart[$id] = [
            "name" => $product->name_en,
            "quantity" => 1,
            "price" => $price,
            "photo" => $product->main_image_url
        ];

        session()->put('cart', $cart);
        $this->dispatch('refreshCart');
        $this->dispatch('addTocart');
        if (request()->wantsJson()) {
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return response()->json(['message' => 'Product added to cart successfully!']);
        }
    }
    public function render()
    {
        return view('livewire.product');
    }
}
