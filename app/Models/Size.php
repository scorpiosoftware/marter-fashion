<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\Cache;

class Size extends Model
{
    protected $fillable = ['name'];


      public function products() : BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'product_size', 'size_id', 'product_id');
    }
}
