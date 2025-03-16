<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ProductView extends Model
{
    use HasFactory;
    protected $fillable = ['name','category_id','section_id','branch_id','selected'];

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function section() {
        return $this->belongsTo(StoreSections::class);
    }

    public function branch() {
        return $this->belongsTo(Branch::class);
    }
}
