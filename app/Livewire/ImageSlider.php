<?php

namespace App\Livewire;

use Livewire\Component;

class ImageSlider extends Component
{
    public $images;
    public $show = false;
    protected $listeners = ['openGallery' => 'open'];
    public function mount($images = [])
    {
        $this->images = $images;
    }
    public function open()
    {
        $this->show = true;
        $this->dispatch('swiperUpdated', show: true); // Trigger Swiper initialization
    }
    public function close(){
        $this->show = false;
    }
    public function render()
    {
        return view('livewire.image-slider');
    }
}
