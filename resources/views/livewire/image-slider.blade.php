<div x-data="{ visible: @entangle('show') }" x-init="$watch('visible', value => {
    if (value) Livewire.emit('swiperUpdated', true);
})">
    <div x-show="visible" x-transition:enter="transition-opacity ease-out duration-500"
        x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
        x-transition:leave="transition-opacity ease-in duration-500" x-transition:leave-start="opacity-100"
        x-transition:leave-end="opacity-0"
        class="swiper-container fixed top-0 z-50 w-full bg-black bg-opacity-70 max-w-full min-h-screen content-center"
        wire:ignore style="display: none;">
        <div class="flex justify-center w-full">
            <button wire:click="close" class="mt-2 bg-red-500 text-white px-4 py-2.5 mb-2 rounded">
                {{ session('lang') == 'en' ? 'close' : 'اغلاق' }}
            </button>
        </div>

        <div class="swiper-wrapper">
            @foreach ($images as $image)
                <div class="swiper-slide">
                    <img src="{{ URL::to('storage/' . $image->image_url) }}" class="w-full h-auto object-contain"
                        alt="Product image">
                </div>
            @endforeach
        </div>

        <!-- Navigation buttons -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>

        <!-- Pagination -->
        <div class="swiper-pagination"></div>
    </div>
</div>


@push('styles')
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css">
    <style>
        .swiper-slide img {
            max-height: 800px;
        }
    </style>
@endpush

@push('styles')
    <style>
        /* Disable selection globally for swiper elements */
        .swiper-container * {
            user-select: none !important;
            -webkit-user-select: none !important;
            -moz-user-select: none !important;
            -ms-user-select: none !important;
        }

        /* Prevent blue highlight on mobile */
        .swiper-button-next,
        .swiper-button-prev,
        .close-button {
            -webkit-tap-highlight-color: transparent;
             width: 50%;
        }
    </style>
@endpush

@push('scripts')
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
        document.addEventListener('livewire:init', () => {
            let swiperInstance = null;

            Livewire.on('swiperUpdated', (show) => {
                if (show) {
                    // Destroy existing instance if any
                    if (swiperInstance) {
                        swiperInstance.destroy();
                    }

                    // Initialize new instance
                    setTimeout(() => {
                        swiperInstance = new Swiper('.swiper-container', {
                            loop: true,
                            autoplay: {
                                delay: 3000,
                            },
                            pagination: {
                                el: '.swiper-pagination',
                                clickable: true,
                            },
                            navigation: {
                                nextEl: '.swiper-button-next',
                                prevEl: '.swiper-button-prev',
                            },
                        });
                    }, 100);
                }
            });
        });
    </script>
@endpush
