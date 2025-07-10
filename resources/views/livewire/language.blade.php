  {{-- Blade-based dynamic language session integration --}}
  <div 
    x-data="{
      open: false,
      selected: {
        code: '{{ session('lang', 'en') }}',
        label: '{{ session('lang') === 'ar' ? 'العربية' : 'English' }}',
        flag: '{{ session('lang') === 'ar' ? '🇸🇦' : '🇺🇸' }}',
        src: '{{ session('lang') === 'ar' ? asset('media/flag/iraq.png') : asset('media/flag/english.png') }}'
      }
    }"
    class="relative"
    x-cloak
  >
    <!-- Toggle Button -->
    <button
      @click="open = !open"
      class="w-48 bg-white border border-gray-300 rounded-lg shadow-sm px-4 py-2 flex items-center justify-between focus:outline-none focus:ring-2 focus:ring-indigo-500"
    >
      <span class="flex items-center space-x-2">
        <span  class="text-xl"><img :src="selected.src" alt=""></span>
        <span x-text="selected.label" class="text-gray-700"></span>
      </span>
      <svg 
        class="w-4 h-4 text-gray-500 transform transition-transform" 
        :class="{ 'rotate-180': open }" 
        fill="none" stroke="currentColor" viewBox="0 0 24 24"
      >
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
      </svg>
    </button>

    <!-- Dropdown Menu -->
    <div
      x-show="open"
      @click="open = false"
      x-transition:enter="transition ease-out duration-200"
      x-transition:enter-start="opacity-0 scale-95"
      x-transition:enter-end="opacity-100 scale-100"
      x-transition:leave="transition ease-in duration-150"
      x-transition:leave-start="opacity-100 scale-100"
      x-transition:leave-end="opacity-0 scale-95"
      class="absolute mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg z-50"
    >
      <ul>
        <li>
          <button
            wire:click="setEnglish"
            @click="selected = { code: 'en', label: 'English', flag: '🇺🇸' }; open = false"
            class="w-full text-left px-4 py-2 hover:bg-gray-100 flex items-center space-x-2"
          >
            <span class="text-xl"><img src="{{ asset('media/flag/english.png') }}" alt=""></span>
            <span>English</span>
          </button>
        </li>
        <li>
          <button
            wire:click="setArabic"
            @click="selected = { code: 'ar', label: 'العربية', flag: '🇸🇦' }; open = false"
            class="w-full text-left px-4 py-2 hover:bg-gray-100 flex items-center justify-start space-x-2"
          >
            <span class="text-xl"><img src="{{ asset('media/flag/iraq.png') }}" alt=""></span>
            <span>العربية</span>
          </button>
        </li>
      </ul>
    </div>
  </div>