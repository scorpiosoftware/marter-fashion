<?php

namespace App\Livewire\AdminPanel\Size;

use App\Models\Size;
use Livewire\Component;

class SizeForm extends Component
{
    public $records;
    public $name;
    public $rec;

    public function save()
    {
        $this->validate([
            'name' => 'required',
        ]);

        $this->rec = Size::updateOrCreate(
            ['id' => $this->rec?->id ?? 0],
            [
                'name' => $this->name,
            ]
        );

        if ($this->rec) {

            $this->dispatch('record-created', [
                'title' => 'Success!',
                'text' => 'Record uploaded successfully.',
                'type' => 'success',
            ]);
        }
        $this->records = Size::all();

        $this->reset('name', 'rec');
    }

    public function delete($id)
    {
        $this->rec = Size::find($id);
        if (!$this->rec->products()->exists()) {
            $this->rec->delete();
            $this->dispatch('record-deleted', [
                'title' => 'Success!',
                'text' => 'Record deleted successfully.',
                'type' => 'success',
            ]);
        } else {
            $this->dispatch('delete-error', [
                'title' => 'Faild !',
                'text' => 'Cannot Delete This Record.',
                'type' => 'success',
            ]);
            $this->reset('name', 'rec');
        }

        $this->records = Size::all();
    }
    public function edit($id)
    {
        $this->rec = Size::find($id);
        $this->name = $this->rec->name;
    }
    public function render()
    {
        return view('livewire.admin-panel.size.size-form');
    }
}
