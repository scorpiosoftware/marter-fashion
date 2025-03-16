<?php

namespace App\Livewire;

use Livewire\Component;

class Cart extends Component
{
    public $details;

    public function render()
    {
        return view('livewire.cart');
    }
}
