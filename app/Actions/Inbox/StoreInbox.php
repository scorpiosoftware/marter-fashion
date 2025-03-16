<?php

namespace App\Actions\Inbox;

use App\Models\Inbox;

class StoreInbox
{
    public static function execute($inputs) {
        $record = new Inbox();
        return $record->create($inputs);
    }
}
