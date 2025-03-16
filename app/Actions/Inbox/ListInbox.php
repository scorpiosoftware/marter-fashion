<?php

namespace App\Actions\Inbox;

use App\Models\Inbox;

class ListInbox
{
    public static function execute($inputs = []) {
     
        $records = new Inbox();

        if (!empty($inputs['search'])) {
            $records = $records->where('email','LIKE',"%{$inputs['search']}%");
        }

        $records = $records->orderBy('id','desc');
        $records = $records->paginate(10);
        return $records;
    }
}
