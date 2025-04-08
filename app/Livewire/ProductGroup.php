<?php

namespace App\Livewire;

use App\Models\Product;
use Livewire\Component;

class ProductGroup extends Component
{
    public  $products;
    public $title = '';
    public function mount($view){

        $category = $view->category->id;
        $section = $view->section->id;
        $branch = $view->branch->id;
        $record = new Product();
        $record = $record->with('categories');
        $record =  $record->whereHas('categories',function($query) use ($category){
            $query->where('id',$category);
        });
        $record = $record->where('section_id',$section);
        $record = $record->where('branch_id',$branch);
        $record = $record->get();
        $this->products =  $record;

    }
    public function render()
    {
        return view('livewire.product-group');
    }
}
