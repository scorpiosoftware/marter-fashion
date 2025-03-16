<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Branch extends Model
{
    protected $fillable = ['name','section_id'];
    public function section():BelongsTo
    {
        return $this->belongsTo(StoreSections::class);
    }

    public function products():HasMany{
        return $this->hasMany(Product::class);
     }
}
