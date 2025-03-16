<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Color extends Model
{
    protected $fillable = ['name','hex_code'];
    public function products() : BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'color_product', 'color_id', 'product_id');
    }
}
