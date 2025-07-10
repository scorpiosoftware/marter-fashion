<?php

namespace App\Livewire\AdminPanel\ProductView;

use App\Models\Branch;
use App\Models\Category;
use App\Models\ProductView;
use App\Models\StoreSections;
use App\View\Components\home\product;
use Livewire\Component;

class PvForm extends Component
{
    public $form = [];
    public $record;

    public function mount()
    {
        if (!empty($this->record)) {
            $this->form = [
                'name' => $this->record->name,
                'name_ar' => $this->record->name_ar,
                'category_id' => $this->record->category_id,
                'section_id' => $this->record->section_id,
                'branch_id' => $this->record->branch_id,
                'selected' => $this->record->selected
            ];
        }
    }

    public function save()
    {
        $this->validate([
            'form.name' => 'required',
            'form.name_ar' => 'required',
            'form.category_id' => 'required',
            'form.section_id' => 'required',
            'form.branch_id' => 'required',
        ]);
        // dd($this->form);
        $newRecord = ProductView::updateOrCreate(
            ['id' => $this->record?->id ?? 0],
            [
                'name' => $this->form['name'],
                'name_ar' => $this->form['name_ar'],
                'category_id' => $this->form['category_id'],
                'section_id' => $this->form['section_id'] ?? null,
                'branch_id' => $this->form['branch_id'] ?? null,
                'selected' => $this->form['selected'] ?? false,
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
        $categries = Category::all();
        $sections = StoreSections::all();
        $branches = Branch::all();
        return view('livewire.admin-panel.product-view.pv-form', [
            'categories' => $categries,
            'sections' => $sections,
            'branches' => $branches
        ]);
    }
}
