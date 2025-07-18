<?php

namespace App\Livewire;

use App\Helpers\LocalizationControll;
use App\Models\AdsModel;
use Illuminate\Support\Facades\App;
use Livewire\Attributes\Validate;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;

class AdsManager extends Component
{
    use WithFileUploads;

    public $showModal = false;
    public $ads = [];
    public $editingAd = null;
    public $filterStatus = 'all'; // all, active, inactive

    public $images = [];

    public $title = "";
    public function mount()
    {
        $this->loadAds();
    }
    public function toggleAdStatus($adId)
    {
        $ad = AdsModel::find($adId);
        $ad->toggleStatus();
        $this->loadAds();
        $setlocal = new LocalizationControll();
        $setlocal->setLocal();
        
        $status = $ad->is_active ? 'enabled' : 'disabled';
        session()->flash('message', "Ad {$status} successfully!");
    }
    public function updatedFilterStatus()
    {
        $this->loadAds();
    }
    public function loadAds()
    {
        $query = AdsModel::latest();

        if ($this->filterStatus === 'active') {
            $query->active();
        } elseif ($this->filterStatus === 'inactive') {
            $query->inactive();
        }

        $this->ads = $query->get();
    }

    public function openModal($adId = null)
    {
        $this->reset(['images', 'title']);
        $this->editingAd = $adId;
        if ($this->editingAd) {
            $ad = AdsModel::find($this->editingAd);
            $this->title = $ad->title;
            // $this->images = $ad->images ?? [];
        }
        $this->showModal = true;
    }

    public function closeModal()
    {
        $this->showModal = false;
        $this->reset(['images', 'editingAd']);
        $this->resetValidation();
    }

    public function saveAd()
    {
        $this->validate([
            // 'images'=>'required|array|min:1',
            'images.*' => 'image|max:5120',
        ]);

        $imageUrls = [];

        foreach ($this->images as $image) {
            // Store each image and get the path
            $path = $image->store('ads', 'public');
            $imageUrls[] = '/storage/' . $path;
        }

        if ($this->editingAd) {
            // Update existing ad - append new images
            $ad = AdsModel::find($this->editingAd);
            $existingImages = $ad->images ?? [];
            $ad->update([
                'images' => array_merge($existingImages, $imageUrls),
                'title' => $this->title,
            ]);
        } else {
            // Create new ad
            AdsModel::create([
                'images' => $imageUrls,
                'is_active' => true,
                'title' => $this->title,
            ]);
        }

        $this->closeModal();
        $this->loadAds();

        $success = session('lang') == 'en' ? 'Ad saved successfully!' : 'تم اضافى \ تعديل الاعلان';
        session()->flash('message',$success );
    }

    public function deleteAd($adId)
    {
        $ad = AdsModel::find($adId);

        // Delete physical files
        foreach ($ad->images ?? [] as $imagePath) {
            $fullPath = public_path($imagePath);
            if (file_exists($fullPath)) {
                unlink($fullPath);
            }
        }

        $ad->delete();
        $this->loadAds();

        session()->flash('message', 'Ad deleted successfully!');
    }

    public function removeImageFromAd($adId, $imageIndex)
    {
        $ad = AdsModel::find($adId);
        $images = $ad->images;

        // Delete physical file
        $imagePath = $images[$imageIndex];
        $fullPath = public_path($imagePath);
        if (file_exists($fullPath)) {
            unlink($fullPath);
        }

        // Remove from array
        unset($images[$imageIndex]);
        $ad->update(['images' => array_values($images)]);

        $this->loadAds();
    }
    public function render()
    {
        return view('livewire.ads-manager');
    }
}
