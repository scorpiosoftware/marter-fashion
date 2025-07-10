<?php

namespace App\Livewire\AdminPanel\Product;

use App\Models\Branch;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use App\Models\StoreSections;
use Livewire\Component;
use Livewire\WithFileUploads;

class ProductForm extends Component
{
    use WithFileUploads;
    public $form = [
        'sizes' => [] // Ensure this is initialized as array
    ];
    public $newSize = '';
    public $images = [];
    public $record;
    protected $listeners = ['createSize'];
    protected $rules = [
        'form.sizes' => 'unique:sizes,name',
        'form.sizes.*' => 'numeric'
    ];
    public function createSize($name)
    {
        // 
        // Validate name first
        // $validatedName = $this->validate(
        //     ['newSize' => 'required|string|max:255'],
        //     [],
        //     ['newSize' => $name]
        // )['newSize'];
        // Create size
        $size = Size::create(['name' => $name]);
        // Safely add to array
        $this->form['sizes'] = [
            $this->form['sizes'],
            // $size->id // Ensure string type to match select values
        ];
        // dd($this->form['sizes']);
        $this->dispatch('sizeCreated', $size);
    }
    public function updatedFormSizes($value)
    {
        // Force array conversion
        $this->form['sizes'] = (array)$value;
    }
    public function mount()
    {
        if (!empty($this->record)) {
            $this->form = [
                'name_en' => $this->record->name_en,
                'name_ar' => $this->record->name_ar,
                'code' => $this->record->code,
                'section_id' => $this->record->section_id,
                'branch_id' => $this->record->branch_id,
                'status' => $this->record->status,
                'price' => $this->record->price,
                'offer_price' => $this->record->offer_price,
                'decription_en' => $this->record->decription_en,
                'decription_ar' => $this->record->decription_ar,
                'main_image_url' => $this->record->main_image_url,
                'brand_id' => $this->record->brand_id,
            ];
        }
        $this->form['status'] = 'in_stock';
        $this->form['decription_en'] = '';
        $this->form['decription_ar'] = '';
        $this->form['brand_id'] = Brand::first()?->id;
        $this->form['section_id'] = StoreSections::first()?->id;
        $this->form['branch_id'] = Branch::first()?->id;
        // $this->form['colors'] = Color::first()?->id;
        $this->form['sizes'] = (array)$this->form['sizes'];
    }
    public function save()
    {

        $this->validate([
            'form.name_en' => 'required',
            'form.name_ar' => 'required',
            'form.code' => 'required',
            'form.section_id' => 'required',
            'form.branch_id' => 'required',
            'form.status' => 'required',
            'form.price' => 'required',
            'form.offer_price' => 'required',
            'form.decription_en' => 'required',
            'form.decription_ar' => 'required',
            // 'form.main_image_url' => 'required',
            'form.brand_id' => 'required',
        ]);

        $newRecord = Product::updateOrCreate(
            ['id' => $this->record?->id ?? 0],
            [
                'nam_en' => $this->form['name_en'],
                'name_ar' => $this->form['name_ar'],
                'section_id' => $this->form['section_id'] ?? null,
                'branch_id' => $this->form['branch_id'] ?? null,
                'status' => $this->form['status'],
                'code' => $this->form['code'],
                'price' => $this->form['price'],
                'offer_price' => $this->form['offer_price'],
                'decription_en' => $this->form['decription_en'] ?? '',
                'decription_ar' => $this->form['decription_ar'] ?? '',
                'main_image_url' => $this->form['main_image_url'] ?? '',
                'brand_id' => $this->form['brand_id'],
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
        $colors = Color::all();
        $sizes = Size::all();
        $brands = Brand::all();
        return view('livewire.admin-panel.product.product-form', [
            'sections' => $sections,
            'branches' => $branches,
            'colors' => $colors,
            'sizes' => $sizes,
            'brands' => $brands,
            'categories' => $categries,
        ]);
    }
}
