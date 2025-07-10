<?php

namespace App\Livewire\AdminPanel\ProductView;

use App\Livewire\Product;
use App\Models\ProductView;
use Livewire\Component;
use Livewire\WithPagination;

class PvTable extends Component
{
    use WithPagination;
    public string $search = '';

    public function updatedSearch($value)
    {

        $inputs = [
            'search' => $value,
        ];
        $this->getRecords($inputs);
    }
    public function changeStatus($id){

        $record = ProductView::find($id);

        $record->selected = ! $record->selected;
        $record->save();

        $this->getRecords(['search' => $this->search]);
        $this->dispatch('status-updated');
    }
    public function getRecords($inputs = [])
    {

        $records = new ProductView();

        if (!empty($inputs['search'])) {
            $records = $records->where('name', 'like', '%' . $inputs['search'] . '%');
        }

        return $records->paginate(10);
    }

    public function delete($id)
    {
        $record = ProductView::find($id);
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
        return view('livewire.admin-panel.product-view.pv-table', ['records' => $this->getRecords(['search' => $this->search])]);
    }
}
