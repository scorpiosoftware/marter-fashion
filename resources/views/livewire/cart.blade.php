<div>
    <div x-data="{ openCart: false }" class="relative">
        <!-- Toggle Button -->
        <button id="myCartDropdownButton1" type="button" @click="openCart = !openCart"
            class="inline-flex items-center justify-center p-2 bg-white rounded-full text-sm font-medium leading-none text-[#ec5793] transition-transform duration-300 ease-in-out transform focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
            <span class="sr-only">Cart</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
            </svg>
        </button>
        <script>
            window.addEventListener('toast:remove', event => {
                Swal.fire({
                    toast: true,
                    position: 'top',
                    icon: event.detail.icon || 'success',
                    title: event.detail.message || 'Item removed!',
                    showConfirmButton: false,
                    timer: 3000
                });
            });
        </script>
        <!-- Dropdown Panel -->
        <div id="myCartDropdown1"  x-show="openCart" 
            x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0 transform -translate-y-2"
            x-transition:enter-end="opacity-100 transform translate-y-0"
            x-transition:leave="transition ease-in duration-200"
            x-transition:leave-start="opacity-100 transform translate-y-0"
            x-transition:leave-end="opacity-0 transform -translate-y-2"
            class="absolute md:right-0 mt-2 z-50 w-72 overflow-hidden rounded-lg bg-white p-4 shadow-lg antialiased">
            <livewire:cart-items />
        </div>
    </div>
</div>

