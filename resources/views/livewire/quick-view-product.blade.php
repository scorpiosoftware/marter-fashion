<div>
    <!-- Modal Backdrop -->
    <div x-data="{ show: @entangle('showModal') }"
         x-show="show"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         class="fixed inset-0 z-50 bg-black bg-opacity-50 backdrop-blur-sm"
         @click="show = false">
    </div>

    <!-- Modal Content -->
    <div x-data="{ show: @entangle('showModal') }"
         x-show="show"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0 transform scale-95"
         x-transition:enter-end="opacity-100 transform scale-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100 transform scale-100"
         x-transition:leave-end="opacity-0 transform scale-95"
         class="fixed inset-0 z-50 flex items-center justify-center p-4"
         @click.self="show = false">
        
        @if($product)
        <div class="relative w-full max-w-4xl bg-white rounded-2xl shadow-2xl overflow-hidden">
            <!-- Close Button -->
            <button @click="show = false" class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors duration-200">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>

            <div class="grid md:grid-cols-2 gap-8 p-8">
                <!-- Product Images -->
                <div class="space-y-4">
                    <!-- Main Image -->
                    <div class="aspect-square w-full overflow-hidden rounded-xl bg-gray-100">
                        <img src="{{ URL::to('storage/' . $selectedImage) }}" 
                             alt="{{ session('lang') == 'en' ? $product->name_en : $product->name_ar }}"
                             class="w-full h-full object-contain p-4">
                    </div>

                    <!-- Thumbnail Gallery -->
                    <div class="grid grid-cols-4 gap-2">
                        <button wire:click="selectImage('{{ $product->main_image_url }}')"
                                class="aspect-square rounded-lg overflow-hidden border-2 {{ $selectedImage === $product->main_image_url ? 'border-indigo-500' : 'border-transparent' }}">
                            <img src="{{ URL::to('storage/' . $product->main_image_url) }}" 
                                 alt="{{ session('lang') == 'en' ? $product->name_en : $product->name_ar }}"
                                 class="w-full h-full object-cover">
                        </button>
                        @foreach($product->images as $image)
                            <button wire:click="selectImage('{{ $image->image_url }}')"
                                    class="aspect-square rounded-lg overflow-hidden border-2 {{ $selectedImage === $image->url ? 'border-indigo-500' : 'border-transparent' }}">
                                <img src="{{ URL::to('storage/' . $image->image_url) }}" 
                                     alt="{{ session('lang') == 'en' ? $product->name_en : $product->name_ar }}"
                                     class="w-full h-full object-cover">
                            </button>
                        @endforeach
                    </div>
                </div>

                <!-- Product Details -->
                <div class="flex flex-col">
                    <!-- Product Name -->
                    <h2 class="text-2xl font-bold text-gray-900 mb-2">
                        @if (session('lang') == 'en')
                            {{ $product->name_en }}
                        @else
                            {{ $product->name_ar }}
                        @endif
                    </h2>

                    <!-- Product Description -->
                    <p class="text-gray-600 mb-4 line-clamp-3">
                        @if (session('lang') == 'en')
                            {!! $product->description_en !!}
                        @else
                        {!! $product->description_ar !!}
                        @endif
                    </p>

                    <!-- Pricing -->
                    <div class="flex items-center gap-4 mb-6">
                        @if($product->offer_price)
                            <span class="text-2xl font-bold text-indigo-600">
                                {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }} {{ $product->offer_price }}
                            </span>
                            <span class="text-lg text-gray-500 line-through">
                                {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }} {{ $product->price }}
                            </span>
                        @else
                            <span class="text-2xl font-bold text-indigo-600">
                                {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }} {{ $product->price }}
                            </span>
                        @endif
                    </div>

                    <!-- Quantity Selector -->
                    <div class="flex items-center gap-4 mb-6">
                        <span class="text-gray-700">{{ session('lang') == 'en' ? 'Quantity' : 'الكمية' }}:</span>
                        <div class="flex items-center border border-gray-300 rounded-lg">
                            <button wire:click="decrementQuantity" 
                                    class="px-3 py-1 text-gray-600 hover:bg-gray-100 transition-colors duration-200">
                                -
                            </button>
                            <span class="px-4 py-1 text-gray-900">{{ $quantity }}</span>
                            <button wire:click="incrementQuantity"
                                    class="px-3 py-1 text-gray-600 hover:bg-gray-100 transition-colors duration-200">
                                +
                            </button>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex flex-col gap-3">
                        <button x-data
                                @click="$dispatch('add-item-to-cart', { id: {{ $product->id }}, quantity: {{ $quantity }} })"
                                class="w-full bg-gradient-to-r from-indigo-600 to-indigo-500 text-white font-semibold py-3 px-6 rounded-lg shadow-md hover:from-indigo-700 hover:to-indigo-600 transition-all duration-300">
                            🛒 {{ session('lang') == 'en' ? 'Add to Cart' : 'أضف إلى السلة' }}
                        </button>
                        <a href="{{ route('shop.show', ['id' => $product->id, 'slug' =>Str::slug($product->name_en)]) }}"
                           class="w-full text-center border border-gray-300 text-gray-700 font-semibold py-3 px-6 rounded-lg shadow-sm hover:bg-gray-50 transition-all duration-300">
                            🔍 {{ session('lang') == 'en' ? 'View Full Details' : 'عرض التفاصيل الكاملة' }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
        @endif
    </div>
</div>
