<?php

namespace App\Livewire;

use App\helpers\TranslationHelper;
use App\Models\Product as ModelsProduct;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Log;
use Livewire\Attributes\On;
use Livewire\Component;

class Product extends Component
{
    public $item;
    public function mount() {}


    public function addToCart($id, $quantity = 1)
    {
        \Log::info('addToCart called', [
            'id' => $id,
            'quantity' => $quantity,
            'time' => now()->toDateTimeString()
        ]);

        $product = ModelsProduct::find($id);
        if (!$product) {
            abort(404);
        }
        $success = session('lang') == 'en' ? 'Product added to cart!' : 'تمت إضافة المنتج إلى السلة!';
        $this->dispatch('toast:added', [
            'message' => $success,
            'icon' => 'success'
        ]);

        $cart = session()->get('cart');
        $price = $product->price;
        $color = $product->colors->first();
        $size = $product->sizes->first();

        if (!empty($product->offer_price) || $product->offer_price > 0) {
            $price = $product->offer_price;
        }

        $p_name = session('lang') == 'en' ? $product->name_en : $product->name_ar;

        if (!$cart) {
            $cart = [
                $id => [
                    "product_id" => $product->id,
                    "name" => $p_name,
                    "quantity" => (int)$quantity,
                    "price" => $price * (int)$quantity,
                    "color" => $color,
                    "size" => $size,
                    "photo" => $product->main_image_url
                ]
            ];
            session()->put('cart', $cart);
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return null;
        }

        if (isset($cart[$id])) {
            $cart[$id]['quantity'] = (int)$cart[$id]['quantity'] + (int)$quantity;
            $cart[$id]['price'] = $cart[$id]['quantity'] * $price;
            session()->put('cart', $cart);
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return null;
        }

        $cart[$id] = [
            "product_id" => $product->id,
            "name" => $p_name,
            "quantity" => (int)$quantity,
            "price" => $price * (int)$quantity,
            "color" => $color,
            "size" => $size,
            "photo" => $product->main_image_url
        ];

        session()->put('cart', $cart);
        $this->dispatch('refreshCart');
        $this->dispatch('addTocart');
        return null;
    }

    public function addToWishlist()
    {
        $success = session('lang') == 'en' ? 'Product added to wishlist!' : 'تمت اضافة المنتج';
        $this->dispatch('toast:wishlistAdd', [
            'message' => $success,
            'icon' => 'success'
        ]);
    }
    public function render()
    {
        return view('livewire.product');
    }
}
