<?php

namespace App\Actions\Carousel;

use App\Models\Carousel;

class GetCarousel
{
    public static function execute($id) {
        $record = Carousel::find($id);
        return $record;
    }
}
