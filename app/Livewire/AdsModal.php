<?php

namespace App\Livewire;

use App\Models\AdsModel;
use Livewire\Component;
use Livewire\Attributes\On;

class AdsModal extends Component
{
    public $showModal = true;
    public $currentIndex = 0;
    public $records = [];
    public $title = "";
    public $autoSwap = true;
    public $swapInterval = 2000; // 5 seconds
    public $swapTimer = null;

    public function mount()
    {
        $ads = AdsModel::where('is_active',true)->first();
        $this->title = $ads->title ?? "";
        $this->records = $ads->images ?? [];
    }

    public function closeModal()
    {
        $this->showModal = false;
        $this->stopAutoSwap();
    }

    public function nextImage()
    {
        if (count($this->records)) {
            $this->currentIndex = ($this->currentIndex + 1) % count($this->records);
        }
        $this->restartAutoSwap();
    }

    public function prevImage()
    {
        if (count($this->records)) {
            $this->currentIndex = ($this->currentIndex - 1 + count($this->records)) % count($this->records);
        }
        $this->restartAutoSwap();
    }

    public function goToImage($index)
    {
        $this->currentIndex = $index;
        $this->restartAutoSwap();
    }

    public function toggleAutoSwap()
    {
        $this->autoSwap = !$this->autoSwap;
        if ($this->autoSwap) {
            $this->startAutoSwap();
        } else {
            $this->stopAutoSwap();
        }
    }

    public function startAutoSwap()
    {
        if (count($this->records) > 1) {
            $this->dispatch('start-auto-swap');
        }
    }

    public function stopAutoSwap()
    {
        $this->dispatch('stop-auto-swap');
    }

    public function restartAutoSwap()
    {
        if ($this->autoSwap) {
            $this->dispatch('restart-auto-swap');
        }
    }

    public function render()
    {
        return view('livewire.ads-modal');
    }
}