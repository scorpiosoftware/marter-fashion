<?php

namespace App\Livewire;

use Livewire\Component;

class AddItemMessage extends Component
{
    protected $listeners = ['addTocart' =>'$refresh'];
    public function render()
    {
        return view('livewire.add-item-message');
    }
}
