<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdsModel extends Model
{
    use HasFactory;

    protected $fillable = [
        'images',
        'is_active',
        'title',
    ];

    /**
     * Cast images to array for easy manipulation
     */
    protected $casts = [
        'images' => 'array',
        'is_active' => 'boolean',
    ];

    /**
     * Add a new image URL to the ad
     */
    public function addImage(string $imageUrl): void
    {
        $images = $this->images ?? [];
        $images[] = $imageUrl;
        $this->images = $images;
        $this->save();
    }

    /**
     * Remove an image URL from the ad
     */
    public function removeImage(string $imageUrl): void
    {
        $images = $this->images ?? [];
        $this->images = array_values(array_filter($images, fn($img) => $img !== $imageUrl));
        $this->save();
    }

    /**
     * Get the first image URL
     */
    public function getFirstImageAttribute(): ?string
    {
        return $this->images[0] ?? null;
    }
    /**
     * Scope to get only active ads
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope to get only inactive ads
     */
    public function scopeInactive($query)
    {
        return $query->where('is_active', false);
    }

    /**
     * Toggle ad status
     */
    public function toggleStatus(): void
    {
        $this->update(['is_active' => !$this->is_active]);
    }
}
