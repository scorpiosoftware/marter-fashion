<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'code',
        'name_en',
        'name_ar',
        'price',
        'offer_price',
        'description_en',
        'description_ar',
        'stock_quantity',
        'minimum_quantity',
        'maximum_quantity',
        'main_image_url',
        'status',
        'brand_id',
        'section_id',
        'branch_id'
    ];
    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function comments()
    {
        return $this->hasMany(ProductComments::class);
    }

    public function categories() : BelongsToMany
    {
        return $this->belongsToMany(Category::class, 'product_category', 'product_id', 'category_id');
    }

    public function brand()
    {
        return $this->belongsTo(Order::class);
    }

    public function items() : BelongsTo
    {
        return $this->belongsTo(OrderItem::class);
    }

    public function section() : BelongsTo
    {
        return $this->belongsTo(StoreSections::class);
    }
    public function branch() : BelongsTo
    {
        return $this->belongsTo(Branch::class);
    }

    public function colors(): BelongsToMany
    {
        return $this->belongsToMany(Color::class, 'color_product', 'product_id', 'color_id');
    }
}
