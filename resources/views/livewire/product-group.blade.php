<div x-data="{ show: true }" class="md:mx-auto w-full md:max-w-4xl px-4">
    <div @click="show = !show"
        class="group flex items-center justify-between p-4 mb-6 rounded-lg bg-gradient-to-r from-slate-100 to-slate-200 shadow-sm hover:shadow-md transition-all duration-300 cursor-pointer">
        <h2 class="text-2xl font-bold text-gray-800">{{ $title }}</h2>
        <div class="transform transition-transform duration-300" :class="{ 'rotate-180': !show }">
            <svg class="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
            </svg>
        </div>
    </div>
    
    <div x-show="show" 
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0 transform scale-95"
         x-transition:enter-end="opacity-100 transform scale-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100 transform scale-100"
         x-transition:leave-end="opacity-0 transform scale-95"
         class="grid md:grid-cols-3 grid-cols-1 gap-4 justify-items-center">
        @foreach ($products as $item)
            <div class="">
                <livewire:product :item="$item" wire:key="product-{{ $item->id }}">
            </div>
        @endforeach
    </div>

    @if($hasMoreProducts)
        <div x-data="{ 
            observe() {
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            @this.loadMore()
                        }
                    })
                }, { threshold: 0.5 })
                
                observer.observe(this.$el)
            }
        }" x-init="observe" class="w-full h-10 flex items-center justify-center my-4">
            <div wire:loading wire:target="loadMore" class="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
        </div>
    @else
        <div class="w-full text-center text-gray-500 my-4">
            {{ session('lang') == 'en' ? 'No more products to load' : 'لا توجد منتجات أخرى للتحميل' }}
        </div>
    @endif

    <!-- Quick View Modal -->
    <livewire:quick-view-product />
</div>
