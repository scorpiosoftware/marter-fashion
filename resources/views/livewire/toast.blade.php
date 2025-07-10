<div 
    x-data="{ visible: @entangle('visible') }" 
    x-show="visible" 
    x-init="
        window.addEventListener('start-toast-timer', () => {
            setTimeout(() => visible = true, 3000)
        });
    "
    x-transition
    class="fixed top-5 right-5 bg-green-600 text-white px-4 py-2 rounded shadow-lg z-50"
>
    {{ $message }}
</div>