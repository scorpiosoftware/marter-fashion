<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Product;
use Livewire\Attributes\On;

class QuickViewProduct extends Component
{
    public $product;
    public $showModal = false;
    public $selectedImage;
    public $quantity = 1;

    protected $listeners = ['openQuickView'];

    public function openQuickView($productId)
    {
        $this->product = Product::find($productId);
        $this->selectedImage = $this->product->main_image_url;
        $this->showModal = true;
    }

    public function closeModal()
    {
        $this->showModal = false;
        $this->reset(['product', 'selectedImage', 'quantity']);
    }

    public function selectImage($imageUrl)
    {
        $this->selectedImage = $imageUrl;
    }

    public function incrementQuantity()
    {
        $this->quantity++;
    }

    public function decrementQuantity()
    {
        if ($this->quantity > 1) {
            $this->quantity--;
        }
    }

    #[On('add-item-to-cart')]
    public function addItemToCart($id, $quantity = 1)
    {
        $product = Product::find($id);
        if (!$product) {
            abort(404);
        }

        // Add to cart logic here
        $this->dispatch('toast:added', [
            'message' => session('lang') == 'en' ? 'Product added to cart!' : 'تمت إضافة المنتج إلى السلة!',
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
        $this->closeModal();
        return null;
    }

    public function render()
    {
        return view('livewire.quick-view-product');
    }
}
