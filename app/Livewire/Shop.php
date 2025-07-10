<?php

namespace App\Livewire;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Eloquent\Collection;
use Livewire\Attributes\On;
use Livewire\Component;

class Shop extends Component
{
    // Sort options constants
    public const SORT_ASC = 'asc';
    public const SORT_DESC = 'desc';
    public const SORT_LOW_PRICE = 'low_price';
    public const SORT_HIGH_PRICE = 'high_price';

    public ?string $sort = null;
    public array $category = [];
    public ?float $minPrice = null;
    public ?float $maxPrice = null;

    public Collection $products;
    public Collection $categories;

    /**
     * Initialize the component
     */
    public function mount(): void
    {
        $this->categories = Category::all();
        $this->listProducts();
    }

    /**
     * List products based on filters
     */
    #[On('apply')]
    public function listProducts(): void
    {
        $query = $this->buildProductQuery();
        $this->products = $query->get();
    }

    /**
     * Build the product query with all filters
     */
    private function buildProductQuery()
    {
        $query = Product::query();

        // Apply category filter
        if (!empty($this->category)) {
            $query->whereHas('categories', function ($subQuery) {
                $subQuery->whereIn('categories.id', $this->category);
            });
        }

        // Apply sorting
        $query = $this->applySorting($query);

        // Apply price range filter
        if ($this->isValidPriceRange()) {
            $query->whereRaw("
                CASE 
                    WHEN offer_price IS NOT NULL THEN offer_price 
                    ELSE price 
                END BETWEEN ? AND ?
            ", [$this->minPrice, $this->maxPrice]);
        }

        return $query;
    }

    /**
     * Apply sorting to the query
     */
    private function applySorting($query)
    {
        if (empty($this->sort)) {
            return $query->orderBy('created_at', 'desc'); // Default sorting
        }

        return match ($this->sort) {
            self::SORT_ASC => $query->orderBy('name_en', 'asc'),
            self::SORT_DESC => $query->orderBy('name_en', 'desc'),
            self::SORT_LOW_PRICE => $query->orderByRaw('COALESCE(offer_price, price) ASC'),
            self::SORT_HIGH_PRICE => $query->orderByRaw('COALESCE(offer_price, price) DESC'),
            default => $query->orderBy('created_at', 'desc')
        };
    }

    /**
     * Validate price range
     */
    private function isValidPriceRange(): bool
    {
        if (empty($this->minPrice) || empty($this->maxPrice)) {
            return false;
        }

        return is_numeric($this->minPrice) 
            && is_numeric($this->maxPrice) 
            && $this->minPrice >= 0 
            && $this->maxPrice >= $this->minPrice;
    }

    /**
     * Render the component
     */
    public function render()
    {
        return view('livewire.shop');
    }
}
