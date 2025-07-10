<?php

namespace App\Livewire\AdminPanel\StoreSection;

use App\Models\StoreSections;
use Livewire\Component;

class StoreForm extends Component
{
    public $form = [];
    public $record;
    public function mount()
    {
        if (!empty($this->record)) {
            $this->form = [
                'name' => $this->record->name,
                'name_ar' => $this->record->name_ar,
            ];
        }
    }

    public function save()
    {
        $this->validate([
            'form.name' => 'required',
            'form.name_ar' => 'required',
        ]);
        $newRecord = StoreSections::updateOrCreate(
            ['id' => $this->record?->id ?? 0],
            [
                'name' => $this->form['name'],
                'name_ar' => $this->form['name_ar'],
            ]
        );

        if ($newRecord) {
            $this->dispatch('record-created', [
                'title' => 'Success!',
                'text' => 'Files uploaded successfully.',
                'type' => 'success',
            ]);
        }
        if (empty($this->record))
            $this->form = [];
    }
    public function render()
    {
        return view('livewire.admin-panel.store-section.store-form');
    }
}
