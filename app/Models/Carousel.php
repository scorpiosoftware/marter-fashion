<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carousel extends Model
{
    use HasFactory;
    protected $fillable = ['logo_url'];

    public function images()
    {
        return $this->hasMany(CarouselImage::class);
    }
}
