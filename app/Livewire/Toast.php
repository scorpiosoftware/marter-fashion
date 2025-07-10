<?php

namespace App\Livewire;

use Livewire\Attributes\On;
use Livewire\Component;

class Toast extends Component
{
    public $message;
    public $visible = false;
    protected $listeners = ['showToast'];

    #[On('showToast')]
    public function showToast($message)
    {
        $this->message = $message;
        $this->visible = true;
   
        // Auto-hide after 3 seconds
        $this->dispatchBrowserEvent('start-toast-timer');
    }
    public function render()
    {
        return view('livewire.toast');
    }
}
