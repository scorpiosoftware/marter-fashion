<?php
namespace App\Actions\Section;

use App\Models\StoreSections;

class DestroySection {
    public static function execute($id) {
        $record = StoreSections::find($id);
        return $record->delete();
    }
}