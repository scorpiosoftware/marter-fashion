<div class="pt-4 max-w-screen-2xl mx-auto bg-[#fce4ec] rounded-md p-4 shadow-xl transform transition-all duration-300 hover:scale-90 hover:shadow-2xl wowDiv"  data-animation="animate__fadeInDownBig" data-delay="300">
    <div class="flex justify-start items-center px-8">
        <div class="flex justify-between items-center space-x-3">
            <div class="font-bold text-2xl text-gray-800">{{ $title }}</div>
            <div>
                <a href="{{ route('shop.index') }}"
                    class="font-bold text-green-500 hover:text-green-600 transition-all duration-300 hover:scale-110 hover:underline">
                    {{ session('lang') == 'en' ? 'view all' : 'عرض الكل' }}
                </a>
            </div>
        </div>
    </div>
    <div class="border-b-2 border-gray-300 px-8 mt-2"></div>
    @if($products->count() > 0)
    <div class="relative w-full max-w-screen-2xl mx-auto group">
        <div id="scrollContainer-{{ $products->first()->categories()->first()->id }}" 
             class="flex space-x-4 overflow-x-hidden scroll-smooth p-4"
             data-scroll-direction="forward">
            @foreach ($products as $item)
                <livewire:product :item="$item">
            @endforeach
        </div>
        
        <button id="prevBtn-{{ $products->first()->categories()->first()->id }}"
            class="absolute left-0 top-1/2 -translate-y-1/2 bg-[#fce4ec] text-white p-3 rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-300 hover:bg-gray-900 transform hover:scale-110 shadow-lg">
            ◀
        </button>
        <button id="nextBtn-{{ $products->first()->categories()->first()->id }}"
            class="absolute right-0 top-1/2 -translate-y-1/2 bg-gray-800 text-white p-3 rounded-full opacity-0 group-hover:opacity-100 transition-opacity duration-300 hover:bg-gray-900 transform hover:scale-110 shadow-lg">
            ▶
        </button>
    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const scrollContainer = document.getElementById('scrollContainer-{{ $products->first()->categories()->first()->id }}');
        const itemWidth = 250 + 16;
        let autoScrollInterval;
        let isHovering = false;
    
        // Auto-scroll functionality
        function startAutoScroll() {
            autoScrollInterval = setInterval(() => {
                if (!isHovering) {
                    const direction = scrollContainer.dataset.scrollDirection;
                    const maxScroll = scrollContainer.scrollWidth - scrollContainer.clientWidth;
                    
                    if (scrollContainer.scrollLeft >= maxScroll - 6) {
                        // Smooth reset to start
                        scrollContainer.scrollTo({
                            left: 0,
                            behavior: 'smooth'
                        });
                    } else {
                        scrollContainer.scrollBy({
                            left: itemWidth * (direction === 'forward' ? 1 : -1),
                            behavior: 'smooth'
                        });
                    }
                }
            }, 5000); // Adjust interval duration (5000ms = 5 seconds)
        }
    
        // Pause on hover
        scrollContainer.parentElement.addEventListener('mouseenter', () => {
            isHovering = true;
            clearInterval(autoScrollInterval);
        });
    
        // Resume on mouse leave
        scrollContainer.parentElement.addEventListener('mouseleave', () => {
            isHovering = false;
            startAutoScroll();
        });
    
        // Manual scroll handlers
        document.getElementById('nextBtn-{{ $products->first()->categories()->first()->id }}').addEventListener('click', () => {
            clearInterval(autoScrollInterval);
            scrollContainer.scrollBy({ left: itemWidth, behavior: 'smooth' });
            startAutoScroll();
        });
    
        document.getElementById('prevBtn-{{ $products->first()->categories()->first()->id }}').addEventListener('click', () => {
            clearInterval(autoScrollInterval);
            const maxScroll = scrollContainer.scrollWidth - scrollContainer.clientWidth;
            
            if (scrollContainer.scrollLeft <= 10) {
                // Jump to end before scrolling
                scrollContainer.scrollTo({ left: maxScroll, behavior: 'auto' });
            }
            
            scrollContainer.scrollBy({ left: -itemWidth, behavior: 'smooth' });
            startAutoScroll();
        });
    
        // Start auto-scroll initially
        startAutoScroll();
    
        // Reset scroll position when window resizes
        window.addEventListener('resize', () => {
            scrollContainer.scrollLeft = 0;
        });
    });
    </script>
    @endif
</div>