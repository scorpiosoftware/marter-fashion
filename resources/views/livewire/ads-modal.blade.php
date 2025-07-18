<div>
    @if ($showModal && count($records) > 0 )
        <!-- Modal Backdrop -->
        <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-[9999] p-4">
            <!-- Modal Container -->
            <div class="bg-white rounded-xl shadow-2xl relative md:top-0 -top-24  max-w-2xl w-full mx-4 max-h-[90vh] flex flex-col">
                <!-- Header -->
                <div class="flex items-center justify-between p-4 md:p-6 border-b border-gray-200">
                    <h2 class="text-xl font-semibold text-gray-800">
                        {{ $title }}
                    </h2>
                    <div class="flex items-center space-x-4">
                        @if(count($records) > 0)
                            <button wire:click="toggleAutoSwap" 
                                    class="text-gray-400 hover:text-gray-600 transition-colors"
                                    title="{{ $autoSwap ? 'Pause slideshow' : 'Play slideshow' }}">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    @if($autoSwap)
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 9v6m4-6v6m7-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    @else
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    @endif
                                </svg>
                            </button>
                        @endif
                        <button wire:click="closeModal" class="text-gray-400 hover:text-gray-600 transition-colors">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Carousel Content -->
                <div class="flex-1 overflow-hidden">
                    @if (count($records) > 0)
                        <div class="relative h-full">
                            <!-- Carousel Slides -->
                            <div class="relative h-96 overflow-hidden">
                                @foreach ($records as $index => $record)
                                    <div class="absolute inset-0 w-full h-full transition-opacity duration-300 ease-in-out {{ $index === $currentIndex ? 'opacity-100' : 'opacity-0' }}"
                                        wire:key="offer-{{ $index }}">
                                        <img src="{{ asset($record) }}" 
                                            class="w-full h-full object-contain p-4"
                                            alt="Offer image {{ $index + 1 }}">
                                    </div>
                                @endforeach
                            </div>

                            <!-- Navigation Buttons -->
                            @if(count($records) > 0)
                                <button type="button"
                                    class="absolute top-1/2 left-4 z-30 flex items-center justify-center w-10 h-10 bg-white/30 rounded-full hover:bg-white/50 focus:outline-none transition-colors"
                                    wire:click="prevImage">
                                    <svg class="w-6 h-6 text-gray-800" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="M5 1 1 5l4 4" />
                                    </svg>
                                    <span class="sr-only">Previous</span>
                                </button>
                                <button type="button"
                                    class="absolute top-1/2 right-4 z-30 flex items-center justify-center w-10 h-10 bg-white/30 rounded-full hover:bg-white/50 focus:outline-none transition-colors"
                                    wire:click="nextImage">
                                    <svg class="w-6 h-6 text-gray-800" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="m1 9 4-4-4-4" />
                                    </svg>
                                    <span class="sr-only">Next</span>
                                </button>
                            @endif

                            <!-- Indicators -->
                            @if(count($records) > 0)
                                <div class="absolute bottom-4 left-0 right-0 flex justify-center space-x-2">
                                    @foreach ($records as $index => $record)
                                        <button type="button"
                                            class="w-3 h-3 rounded-full {{ $index === $currentIndex ? 'bg-blue-600' : 'bg-gray-300' }}"
                                            wire:click="goToImage({{ $index }})">
                                            <span class="sr-only">Go to slide {{ $index + 1 }}</span>
                                        </button>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    @else
                        <div class="p-6 text-center text-gray-500">
                           {{ __('admin-panel.no_ads') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>

        <!-- Auto-swap JavaScript -->
        @script
        <script>
            let swapTimer = null;
            const swapInterval = @js($swapInterval);

            Livewire.on('start-auto-swap', () => {
                stopAutoSwap();
                swapTimer = setTimeout(() => {
                    @this.nextImage();
                    Livewire.dispatch('start-auto-swap');
                }, swapInterval);
            });

            Livewire.on('stop-auto-swap', () => {
                stopAutoSwap();
            });

            Livewire.on('restart-auto-swap', () => {
                stopAutoSwap();
                if (@this.autoSwap) {
                    Livewire.dispatch('start-auto-swap');
                }
            });

            function stopAutoSwap() {
                if (swapTimer) {
                    clearTimeout(swapTimer);
                    swapTimer = null;
                }
            }

            // Start auto-swap when modal opens if enabled
            document.addEventListener('livewire:initialized', () => {
                if (@this.autoSwap && @js(count($records) > 1)) {
                    Livewire.dispatch('start-auto-swap');
                }
            });
        </script>
        @endscript
    @endif
</div>