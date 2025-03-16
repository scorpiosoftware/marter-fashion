<?php
namespace App\Actions\Brand;

use App\Models\Brand;

class StoreBrand {
    public static function execute($inputs) {
        $record = new Brand();
        return $record->create($inputs);
    }
}