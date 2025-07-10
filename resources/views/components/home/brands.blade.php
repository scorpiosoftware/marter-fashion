<div class="brands-section py-4 px-4">
    <div class="container mx-auto max-w-4xl">
        <h2 class="text-4xl md:text-5xl font-extrabold text-center mb-8 text-gray-800 dark:text-gray-200 opacity-0 transform translate-y-4 animate-fade-in tracking-tight">
            <span class="bg-clip-text text-transparent bg-gradient-to-r from-gray-900 to-gray-600 dark:from-gray-100 dark:to-gray-400">
                {{session('lang') == 'en' ? 'Our Trusted Brands' : 'علاماتنا التجارية الموثوقة'}}
            </span>
        </h2>
        
        <div class="w-24 h-1 bg-gradient-to-r from-gray-900 to-gray-600 dark:from-gray-100 dark:to-gray-400 mx-auto mb-16 rounded-full"></div>
        
        <div class="brands-grid grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 md:gap-8 mt-8">
            @foreach ($brands as $brand)
                <div class="brand-card opacity-0 transform translate-y-4" 
                    style="animation: fadeInUp 0.6s ease forwards {{ 1 * 0.15 }}s">
                    <div class="relative overflow-hidden rounded-xl bg-white dark:bg-gray-800 shadow-lg hover:shadow-xl transition-all duration-300 p-4">
                        <div class="skeleton-loader absolute inset-0 bg-gray-200 dark:bg-gray-700"></div>
                        <div class="aspect-square w-full h-full flex items-center justify-center">
                            <div class="w-32 h-32 relative flex items-center justify-center">
                                <img 
                                    class="max-w-full max-h-full object-contain transition-transform duration-500 hover:scale-105" 
                                    src="{{ URL::to('storage/' . $brand->image_url) }}" 
                                    alt="Brand Logo"
                                    loading="lazy"
                                    style="z-index: 10;"
                                >
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>

<style>
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .animate-fade-in {
        animation: fadeInUp 0.8s ease forwards;
    }

    .skeleton-loader {
        background: linear-gradient(
            90deg,
            rgba(200, 200, 200, 0.1) 0%,
            rgba(200, 200, 200, 0.3) 50%,
            rgba(200, 200, 200, 0.1) 100%
        );
        background-size: 200% 100%;
        animation: loading 1.5s infinite;
        opacity: 0.5;
    }

    @keyframes loading {
        0% {
            background-position: 200% 0;
        }
        100% {
            background-position: -200% 0;
        }
    }

    .brands-grid {
        perspective: 1000px;
    }

    .brand-card {
        backface-visibility: hidden;
    }

    .brand-card:hover {
        transform: translateY(-5px);
    }

    @media (prefers-reduced-motion: reduce) {
        .brand-card {
            animation: none;
            transform: none;
        }
        
        .animate-fade-in {
            animation: none;
        }
    }

    /* Responsive image sizes */
    @media (max-width: 640px) {
        .brand-card .w-32 {
            width: 5rem;
            height: 5rem;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.visibility = 'visible';
                }
            });
        }, {
            threshold: 0.1
        });

        // Observe all brand cards
        document.querySelectorAll('.brand-card').forEach(card => {
            observer.observe(card);
        });

        // Handle skeleton loader
        document.querySelectorAll('.brand-card img').forEach(img => {
            img.addEventListener('load', function() {
                const skeleton = this.closest('.relative').querySelector('.skeleton-loader');
                if (skeleton) {
                    skeleton.style.display = 'none';
                }
            });
        });
    });
</script>