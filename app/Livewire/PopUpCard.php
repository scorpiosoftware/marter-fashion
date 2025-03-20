<?php

namespace App\Livewire;

use App\Models\Color;
use App\Models\Product;
use Livewire\Component;
use SebastianBergmann\CodeCoverage\Report\Html\Colors;

class PopUpCard extends Component
{
    public $colors;
    public $selectedColor = null;
    public $minPrice;
    public $maxPrice;

    public $show = true;
    public function mount(){
        $this->colors = Color::all();
        $products = Product::all();
        $this->minPrice = $products->min('price');
        $this->maxPrice = $products->max('price');
    }

    public function close(){
        $this->show = false;
    }
    public function selectedOption($value){
           $this->selectedColor = $value;
    }
    public function render()
    {
        return view('livewire.pop-up-card');
    }
}
