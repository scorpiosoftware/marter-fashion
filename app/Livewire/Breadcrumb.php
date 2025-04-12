<?php

namespace App\Livewire;

use Livewire\Component;

class Breadcrumb extends Component
{
    public $links;

    public function mount($links){

        $this->links = $links;
    }
    public function render()
    {
        return view('livewire.breadcrumb');
    }
}
