<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingAddress extends Model
{
    use HasFactory;
    protected $guard = [];
    protected $fillable = [
        'order_id',
        'full_name',
        'email',
        'phone',
        'street',
        'apartment',
        'country',
        'city',
        'zip'
    ];
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
