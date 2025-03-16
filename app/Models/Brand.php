<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;
    protected $guard = [];
    protected $fillable = ['name_en','name_ar','image_url'];
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
