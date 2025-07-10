<?php

namespace App\Livewire;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class ProductGroup extends Component
{
    use WithPagination;

    public $title = '';
    public $perPage = 3;
    public $view;
    public $allProducts = [];
    protected $paginationTheme = 'tailwind';

    public function mount($view)
    {
        $this->title = session('lang') == 'en' ? $view->name : $view->name_ar;
        $this->view = $view;
        $this->loadInitialProducts();
    }

    public function loadInitialProducts()
    {
        $category = $this->view->category->id;
        $section = $this->view->section->id;
        $branch = $this->view->branch->id;

        $products = Product::with('categories')
            ->whereHas('categories', function ($query) use ($category) {
                $query->where('id', $category);
            })
            ->where('section_id', $section)
            ->where('branch_id', $branch)
            ->take($this->perPage)
            ->get();

        $this->allProducts = $products;
    }

    public function loadMore()
    {
        $category = $this->view->category->id;
        $section = $this->view->section->id;
        $branch = $this->view->branch->id;

        $query = Product::with('categories')
            ->whereHas('categories', function ($query) use ($category) {
                $query->where('id', $category);
            })
            ->where('section_id', $section)
            ->where('branch_id', $branch);

        $totalProducts = $query->count();
        $currentCount = count($this->allProducts);

        if ($currentCount < $totalProducts) {
            $newProducts = $query->skip($currentCount)
                ->take($this->perPage)
                ->get();

            $this->allProducts = $this->allProducts->concat($newProducts);
        }
    }

    public function render()
    {
        return view('livewire.product-group', [
            'products' => $this->allProducts,
            'hasMoreProducts' => count($this->allProducts) < Product::where('section_id', $this->view->section->id)
                ->where('branch_id', $this->view->branch->id)
                ->whereHas('categories', function ($query) {
                    $query->where('id', $this->view->category->id);
                })
                ->count()
        ]);
    }
}
