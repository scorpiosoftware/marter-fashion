<?php

namespace App\Livewire;

use Livewire\Component;

class ImageSlider extends Component
{
    public $images;
    public $show = false;
    public function mount($images = [])
    {
        $this->images = $images;
    }
    public function close(){
        $this->show = false;
    }
    public function render()
    {
        return view('livewire.image-slider');
    }
}
