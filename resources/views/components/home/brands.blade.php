<div class="brands-container mx-auto">
    <h2 class="brands-title">{{session('lang') == 'en' ? 'Brands' : 'علاماتنا التجارية'}}</h2>
    <div class="brands-slider">
        @foreach ($brands as $brand)
            <div class="brand-item image-container">
                <div class="skeleton-loader min-h-16"></div>
                <img src="{{ URL::to('storage/' . $brand->image_url) }}" alt="Brand 1">
            </div>
        @endforeach
    </div>
    <script>
        const slider = document.querySelector('.brands-slider');
        const items = Array.from(document.querySelectorAll('.brand-item'));
        const originalItemCount = items.length;

        // Clone items for seamless loop
        items.forEach(item => {
            const clone = item.cloneNode(true);
            slider.appendChild(clone);
        });

        // Scroll variables
        let currentTranslateX = 0;
        let scrollTimeout;
        const scrollSpeed = 0.6;
        let isAutoScroll = true;
        const autoScrollSpeed = 1.2;

        const itemWidth = items[0].offsetWidth;
        const gap = 50;
        const totalWidth = (itemWidth + gap) * (originalItemCount * 2) - gap;

        // Single continuous animation loop
        function animate() {
            if (isAutoScroll) {
                currentTranslateX -= autoScrollSpeed;
                if (currentTranslateX <= -totalWidth / 2) {
                    currentTranslateX += (totalWidth / 2) ;
                }
                slider.style.transform = `translateX(${currentTranslateX}px)`;
            }
            requestAnimationFrame(animate);
        }
        animate();

        // Mouse wheel handler
        const container = document.querySelector('.brands-container');
        container.addEventListener('wheel', (e) => {
            e.preventDefault();
            isAutoScroll = false;

            const delta = e.deltaY * scrollSpeed;
            currentTranslateX = Math.max(Math.min(currentTranslateX + delta, 0), -totalWidth / 2);

            slider.style.transition = 'transform 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94)';
            slider.style.transform = `translateX(${currentTranslateX}px)`;

            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(() => {
                isAutoScroll = true;
                slider.style.transition = 'none';
            }, 3000);
        });

        // Hover effects
        document.querySelectorAll('.brand-item').forEach(item => {
            item.addEventListener('mouseenter', () => {
                item.style.transform = `rotate(${Math.random() * 4 - 2}deg) translateY(-5px) scale(1.05)`;
            });
            item.addEventListener('mouseleave', () => {
                item.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Pause on container hover
        container.addEventListener('mouseenter', () => {
            isAutoScroll = false;
        });

        container.addEventListener('mouseleave', () => {
            isAutoScroll = true;
        });
    </script>
</div>
