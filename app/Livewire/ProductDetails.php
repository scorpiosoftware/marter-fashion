<?php

namespace App\Livewire;

use App\Models\Product;
use Livewire\Component;
use Livewire\Attributes\On;

class ProductDetails extends Component
{
    public $record;
    public $quantity = 1;
    public $selectedColor;
    public $selectedSize;

    public $size;

    public function increaseQuantity()
    {
        $this->quantity++;
    }
    public function decreaseQuantity()
    {
        $this->quantity--;
    }
    public function mount($record)
    {
        $this->record = $record;
        $this->selectedColor = $record->colors->first()?->id;
        $this->selectedSize = $record->sizes->first()?->id;
    }

    public function addToCart()
    {
        $product = Product::find($this->record->id);
        if (!$product) {
            abort(404);
        }

        $this->dispatch('toast:addedToCart', [
            'message' => session('lang') == 'en' ? 'Product added to cart!' : 'تمت إضافة المنتج إلى السلة!',
            'icon' => 'success'
        ]);

        $cart = session()->get('cart');
        $price = $product->price;
        $color = $product->colors->where('id', $this->selectedColor)->first();
        $size = $product->sizes->where('id', $this->selectedSize)->first();

        if (!empty($product->offer_price) || $product->offer_price > 0) {
            $price = $product->offer_price;
        }

        $p_name = session('lang') == 'en' ? $product->name_en : $product->name_ar;

        if (!$cart) {
            $cart = [
                $this->record->id . $size->id . $color->id => [
                    'product_id' => $this->record->id,
                    "name" => $p_name,
                    "quantity" => (int)$this->quantity,
                    "price" => $price * (int)$this->quantity,
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

        if (isset($cart[$this->record->id . $size->id . $color->id])) {
            $cart[$this->record->id . $size->id . $color->id]['quantity'] = (int)$cart[$this->record->id . $size->id . $color->id]['quantity'] + (int)$this->quantity;
            $cart[$this->record->id . $size->id . $color->id]['price'] = $cart[$this->record->id . $size->id . $color->id]['quantity'] * $price;
            session()->put('cart', $cart);
            $this->dispatch('refreshCart');
            $this->dispatch('addTocart');
            return null;
        }

        $cart[$this->record->id . $size->id . $color->id] = [
            'product_id' => $this->record->id,
            "name" => $p_name,
            "quantity" => (int)$this->quantity,
            "price" => $price * (int)$this->quantity,
            "color" => $color,
            "size" => $size,
            "photo" => $product->main_image_url
        ];

        session()->put('cart', $cart);
        $this->dispatch('refreshCart');
        $this->dispatch('addTocart');
    }

    public function render()
    {
        return view('livewire.product-details');
    }
}
