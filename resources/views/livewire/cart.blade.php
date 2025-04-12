<div class="" x-data="{ open: false }">
    <button id="myCartDropdownButton1" data-dropdown-toggle="myCartDropdown1" type="button" @click="open = !open"
        class="inline-flex items-center justify-center p-2 bg-white rounded-full text-sm font-medium leading-none text-[#ec5793] transition duration-300 ease-in-out transform  focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
        <span class="sr-only">
            Cart
        </span>
        <svg class="w-5 h-5 lg:me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
            fill="none" viewBox="0 0 24 24">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5 4h1.5L9 16m0 0h8m-8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-8.5-3h9.25L19 7H7.312" />
        </svg>
        <svg class="hidden sm:flex w-4 h-4 text-[#ec5793] ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
            width="24" height="24" fill="none" viewBox="0 0 24 24">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="m19 9-7 7-7-7" />
        </svg>
    </button>

    <div id="myCartDropdown1" x-show="open" x-transition:enter="transition ease-in duration-300"
        x-transition:enter-start="opacity-0 scale-90" x-transition:enter-end="opacity-100 scale-100"
        x-transition:leave="transition ease-out duration-200" x-transition:leave-start="opacity-100 scale-100"
        x-transition:leave-end="opacity-0 scale-90" @click.away="open = false"
        style="display: none;"
        class="hidden z-10 mx-auto max-w-sm w-full overflow-hidden rounded-lg bg-[#ec5793] p-4 shadow-lg  antialiased">
        <livewire:cart-items />
    </div>
</div>
