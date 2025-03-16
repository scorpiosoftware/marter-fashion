<?php

namespace App\Actions\Inbox;

use App\Models\Inbox;

class DestroyInbox
{
    public static function execute($id) {
        $record = Inbox::find($id);
        return $record->delete();
    }
}
