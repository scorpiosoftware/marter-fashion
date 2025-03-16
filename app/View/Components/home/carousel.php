<?php

namespace App\View\Components\home;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class carousel extends Component
{
    /**
     * Create a new component instance.
     */
    public function __construct(public $carousel)
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.home.carousel');
    }
}
