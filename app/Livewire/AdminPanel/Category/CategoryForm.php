<?php

namespace App\Livewire\AdminPanel\Category;

use App\Models\Category;
use Livewire\Component;

class CategoryForm extends Component
{
    public $form = [];
    public $record;
    public function mount()
    {
        if (!empty($this->record)) {
            $this->form = [
                'name_en' => $this->record->name_en,
                'name_ar' => $this->record->name_ar,
                'parent_id' => $this->record->parent_id,
            ];
        }
    }
    public function save()
    {
        $this->validate([
            'form.name_en' => 'required',
            'form.name_ar' => 'required',
        ]);
        $newRecord = Category::updateOrCreate(
            ['id' => $this->record?->id ?? 0],
            [
                'name_en' => $this->form['name_en'],
                'name_ar' => $this->form['name_ar'],
                'parent_id' => $this->form['parent_id'] ?? null,
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
        $categories = Category::all();
        return view('livewire.admin-panel.category.category-form',['categories'=>$categories]);
    }
}
