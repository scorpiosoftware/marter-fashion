<?php

namespace App\Livewire\AdminPanel\Branch;

use App\Models\Branch;
use App\Models\StoreSections;
use Livewire\Component;

class BranchForm extends Component
{
    public $selectedSectionId;
    public $record;
    public $form = [];
    public function mount()
    {
        if (!empty($this->record)) {
            $this->form = [
                'name' => $this->record->name,
                'name_ar' => $this->record->name_ar,
                'section_id' => $this->record->section_id,
            ];
        }
        if ($this->selectedSectionId != 0) {
            $this->form['section_id'] = $this->selectedSectionId;
        } else {
            $this->form['section_id'] = StoreSections::first()->id;
        }
    }

    public function save()
    {
        $this->validate([
            'form.name' => 'required',
            'form.name_ar' => 'required',
            'form.section_id' => 'required'
        ]);
        $newRecord = Branch::updateOrCreate(
            ['id' => $this->record?->id ?? 0],
            [
                'name' => $this->form['name'],
                'name_ar' => $this->form['name_ar'],
                'section_id' => $this->form['section_id'] ?? null,
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
        $sections = StoreSections::all();
        return view('livewire.admin-panel.branch.branch-form', ['sections' => $sections]);
    }
}
