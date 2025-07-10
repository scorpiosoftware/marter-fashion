<div class="space-y-6">
        <script>
        window.addEventListener('toast:addedToCart', event => {
            Swal.fire({
                toast: true,
                position: 'top',
                icon: event.detail[0].icon || 'success',
                title: event.detail[0].message || 'Item added to cart!',
                showConfirmButton: false,
                timer: 3000
            });
        });
    </script>
    <!-- Color and Size Selection Section -->
    <div class="bg-white/90 backdrop-blur-sm p-6 rounded-xl shadow-lg">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Color Selection -->
            <div class="space-y-4">
                <h3 class="text-lg font-semibold text-[#2B3467]">
                    {{ session('lang') == 'en' ? 'Pick Color' : 'اختر اللون' }}
                </h3>
                <div class="flex flex-wrap gap-3">
                    @foreach ($record->colors as $color)
                        <div class="relative">
                            <input type="radio" 
                                   wire:model.live="selectedColor" 
                                   name="color_selection"
                                   value="{{ $color->id }}" 
                                   id="color_{{ $color->id }}"
                                   required
                                   class="peer sr-only" />
                            <label for="color_{{ $color->id }}"
                                   class="block w-10 h-10 rounded-full cursor-pointer transition-all duration-300 
                                          peer-checked:ring-2 peer-checked:ring-[#2B3467] peer-checked:ring-offset-2
                                          hover:scale-110 hover:shadow-md"
                                   style="background-color: {{ $color->hex_code }}">
                            </label>
                        </div>
                    @endforeach
                </div>

            </div>

            <!-- Size Selection -->
            <div class="space-y-4">
                <h3 class="text-lg font-semibold text-[#2B3467]">
                    {{ session('lang') == 'en' ? 'Pick Size' : 'اختر قياس' }}
                </h3>
                <div class="flex flex-wrap gap-3">
                    @foreach ($record->sizes as $size)
                        <div class="relative">
                            <input type="radio" 
                                   wire:model.live="selectedSize" 
                                   name="size_selection"
                                   value="{{ $size->id }}" 
                                   id="size_{{ $size->id }}"
                                   required
                                   class="peer sr-only" />
                            <label for="size_{{ $size->id }}"
                                   class="flex items-center justify-center w-12 h-12 rounded-lg cursor-pointer
                                          bg-white border-2 border-gray-200 transition-all duration-300
                                          peer-checked:border-[#2B3467] peer-checked:bg-[#2B3467] peer-checked:text-white
                                          hover:border-[#2B3467] hover:shadow-md">
                                {{ $size->name }}
                            </label>
                        </div>
                    @endforeach
                </div>

            </div>
        </div>
    </div>



    <!-- Quantity and Add to Cart Section -->
    <div class="bg-white/90 backdrop-blur-sm p-6 rounded-xl shadow-lg">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- Quantity Selector -->
            <div class="space-y-4">
                <h3 class="text-lg font-semibold text-[#2B3467]">
                    {{ session('lang') == 'en' ? 'Quantity' : 'الكمية' }}
                </h3>
                <div class="flex items-center border-2 border-gray-200 rounded-lg overflow-hidden w-full max-w-xs">
                    <button type="button"
                        class="px-6 py-3 bg-gray-50 text-[#2B3467] hover:bg-gray-100 transition-colors duration-300"
                        wire:click="decreaseQuantity">
                        −
                    </button>
                    <input type="number" wire:model.live="quantity" min="{{ $record->minimum_quantity }}"
                        max="{{ $record->maximum_quantity }}"
                        class="flex-1 text-center border-x border-gray-200 bg-white text-[#2B3467] focus:ring-0 focus:border-[#2B3467] py-3"
                        aria-label="Quantity">
                    <button type="button"
                        class="px-6 py-3 bg-gray-50 text-[#2B3467] hover:bg-gray-100 transition-colors duration-300"
                        wire:click="increaseQuantity">
                        +
                    </button>
                </div>
                <p class="text-sm text-gray-500">
                    {{ session('lang') == 'en' ? 'Maximum quantity:' : 'الحد الأقصى:' }}
                    {{ $record->maximum_quantity }}
                </p>
            </div>

            <!-- Add to Cart Button -->
            <div class="space-y-4">
                <h3 class="text-lg font-semibold text-[#2B3467]">
                    {{ session('lang') == 'en' ? 'Add to Cart' : 'أضف إلى السلة' }}
                </h3>
                <button type="button" wire:click="addToCart"
                    class="w-full bg-[#2B3467] text-white px-8 py-3 rounded-lg 
                           hover:bg-[#1a1f3d] transition-all duration-300 transform hover:scale-105 
                           hover:shadow-lg flex items-center justify-center space-x-2">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 576 512">
                        <path
                            d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
                    </svg>
                    <span>{{ session('lang') == 'en' ? 'Add to Cart' : 'أضف إلى السلة' }}</span>
                </button>
            </div>
        </div>
    </div>
</div>