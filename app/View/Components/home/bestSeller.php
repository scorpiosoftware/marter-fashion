<?php

namespace App\View\Components\home;

use App\Models\Product;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class bestSeller extends Component
{
    public  $products;
    /**
     * Create a new component instance.
     */
    public function __construct(public $bestSeller, public $view , public $title)
    {
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

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.home.best-seller');
    }
}
