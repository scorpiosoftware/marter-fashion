<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $guard = [];
    protected $fillable = [
        'auto_nb',
        'customer_name',
        'customer_email',
        'phone',
        'street',
        'apartment',
        'country',
        'city',
        'zip'
    ];
    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }
}
