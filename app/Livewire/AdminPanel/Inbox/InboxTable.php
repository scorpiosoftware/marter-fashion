<?php

namespace App\Livewire\AdminPanel\Inbox;

use App\Models\Inbox;
use Livewire\Component;

class InboxTable extends Component
{
    public $search = '';
    public function getRecords($inputs = [])
    {

        $records = new Inbox();

        if (!empty($inputs['search'])) {
            $records = $records->where('name', 'like', '%' . $inputs['search'] . '%');
        }

        return $records->paginate(10);
    }
    public function delete($id)
    {
        $record = Inbox::find($id);
        $record->delete();

        $this->dispatch('recordDeleted'); // optional feedback
    }
    #[\Livewire\Attributes\On('deleteConfirmed')]
    public function deleteConfirmed($id)
    {
        $this->delete($id);
    }
    public function render()
    {
        return view('livewire.admin-panel.inbox.inbox-table',['records' => $this->getRecords(['search' => $this->search])]);
    }
}
