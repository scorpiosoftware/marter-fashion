@extends('layouts.home')
@section('content')
    @livewire('image-slider', [
        'images' => $record->images,
    ])
    <div class="mx-auto max-w-screen-xl mt-4">
        <livewire:breadcrumb :links="[
            [
                'path' => '/',
                'name_en' => 'Home',
                'name_ar' => 'الصفحة الرئيسية',
            ],
            [
                'path' => '/shop',
                'name_en' => 'Catalog',
                'name_ar' => 'المنتجات',
            ],
            [
                'path' => '',
                'name_en' => $record->name_en,
                'name_ar' => $record->name_ar,
            ],
        ]">
    </div>
    <div class="mx-auto max-w-screen-xl p-4 mt-4  rounded-xl shadow-lg transition-all duration-300 hover:shadow-2xl">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-10">
            <!-- Image Gallery Section -->
            <div class="relative">
                <!-- Main Image Container -->
                <div class="relative aspect-square w-full max-w-2xl mx-auto bg-gradient-to-b from-pink-500/20 via-purple-600/20 to-white/20 rounded-2xl overflow-hidden shadow-xl" id="imageContainer">
                    <div class="skeleton-loader absolute inset-0 bg-gradient-to-r from-gray-50/50 to-gray-100/50 animate-pulse"></div>
                    <img id="mainImage" src="{{ URL::to('storage/' . $record->main_image_url) }}"
                        onclick="Livewire.dispatch('openGallery')"
                        class="relative z-10 w-full h-full object-contain transition-transform duration-100 ease-out"
                        alt="Main product image"  loading="lazy"/>
                    <div class="absolute inset-0 bg-gradient-to-t from-[#2B3467]/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                    
                    <!-- Zoom Indicator -->
                    <div class="absolute bottom-4 right-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-full text-sm text-[#2B3467] flex items-center gap-2 shadow-lg z-20">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM10 7v6m3-3H7" />
                        </svg>
                        Hover to zoom
                    </div>
                </div>

                <!-- Thumbnail Grid -->
                <div class="mt-6 max-w-2xl mx-auto">
                    <div class="grid grid-cols-4 sm:grid-cols-5 gap-4">
                        @foreach ($record->images as $image)
                            <div class="relative aspect-square group cursor-pointer transform transition-all duration-300 hover:scale-105 bg-white p-1 rounded-lg shadow-md" 
                                 onclick="changeMainImage('{{ URL::to('storage/' . $image->image_url) }}')">
                                <div class="relative w-full h-full rounded-lg overflow-hidden">
                                    <img src="{{ URL::to('storage/' . $image->image_url) }}"
                                        class="w-full h-full object-cover transition-all duration-300 group-hover:brightness-110"
                                        alt="Product thumbnail" loading="lazy">
                                    <div class="absolute inset-0 bg-[#2B3467] opacity-0 group-hover:opacity-20 transition-opacity duration-300 rounded-lg"></div>
                                </div>
                                <!-- Active Indicator -->
                                <div class="absolute inset-0 border-2 border-transparent group-hover:border-[#2B3467] rounded-lg transition-all duration-300"></div>
                            </div>
                        @endforeach
                    </div>
                </div>

                <!-- Image Navigation -->
                <div class="absolute top-[40%] -translate-y-1/2 left-0 right-0 flex justify-between px-4 pointer-events-none z-20">
                    <button id="scrollPrev"
                        class="bg-white/90 hover:bg-white p-3 rounded-full shadow-lg pointer-events-auto transform transition-all duration-300 hover:scale-110 focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#2B3467]" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                        </svg>
                    </button>
                    <button id="scrollNext"
                        class="bg-white/90 hover:bg-white p-3 rounded-full shadow-lg pointer-events-auto transform transition-all duration-300 hover:scale-110 focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#2B3467]" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Product Info Section -->
            <div class="bg-white/90 backdrop-blur-sm p-8 rounded-xl shadow-lg transform transition-all duration-300 hover:shadow-2xl" x-data="{ open: true }">
                <div class="md:text-4xl text-xl font-bold flex justify-between text-[#2B3467] mb-4 cursor-pointer hover:text-[#1a1f3d] transition-colors duration-300" @click="open = !open">
                    {!! session('lang') == 'en' ? $record->name_en : $record->name_ar !!}
                    <span class="cursor-pointer transform transition-transform duration-300 hover:scale-110" x-show="!open">+</span>
                    <span class="cursor-pointer transform transition-transform duration-300 hover:scale-110" x-show="open">−</span>
                </div>

                <div x-show="open" x-transition:enter="transition ease-out duration-500"
                    x-transition:enter-start="opacity-0 scale-95" x-transition:enter-end="opacity-100 scale-100"
                    x-transition:leave="transition ease-in duration-300" x-transition:leave-start="opacity-100 scale-100"
                    x-transition:leave-end="opacity-0 scale-95">
                    <div class="flex justify-between items-center mb-6">
                        <!-- Rating Badge -->
                        <div class="flex items-center space-x-2 bg-[#F8F5F1] px-4 py-2 rounded-full w-fit transform transition-all duration-300 hover:scale-105 hover:shadow-lg">
                            <div class="flex text-[#FFD700]">
                                @for ($i = 1; $i <= 5; $i++)
                                    <svg class="w-6 h-6 {{ $product_rate >= $i ? 'fill-current' : 'fill-gray-300' }} transform transition-transform duration-300 hover:scale-110"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                        <path
                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                    </svg>
                                @endfor
                            </div>
                        </div>

                        <livewire:heart :record="$record">
                    </div>
                    <!-- Price and Availability -->
                    <div class="mb-8 flex items-center justify-between">
                        <div class="flex items-end space-x-4">
                            @if ($record->offer_price)
                                <span class="text-3xl font-bold text-[#2B3467] transform transition-all duration-300 hover:scale-105">
                                    {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }}
                                    {{ $record->offer_price }}</span>
                                <span class="text-xl text-gray-400 line-through">
                                    {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }}
                                    {{ $record->price }}</span>
                            @else
                                <span class="text-3xl font-bold text-[#2B3467] transform transition-all duration-300 hover:scale-105">
                                    {{ session('lang') == 'en' ? 'IQD' : 'د.ع' }}
                                    {{ $record->price }}</span>
                            @endif
                        </div>
                        <span
                            class="px-4 py-2 rounded-full transform transition-all duration-300 hover:scale-105 {{ $record->status == 'in_stock' ? 'bg-green-100 text-green-800 hover:bg-green-200' : 'bg-red-100 text-red-800 hover:bg-red-200' }}">
                            {{ session('lang') == 'en'
                                ? ($record->status == 'in_stock'
                                    ? 'In Stock'
                                    : 'Out of Stock')
                                : ($record->status == 'in_stock'
                                    ? 'متوفر'
                                    : 'إنتهى') }}
                        </span>
                    </div>

                    <!-- Product Description -->
                    <div class="mb-8 transform transition-all duration-300 hover:shadow-lg p-4 rounded-lg">
                        <h3 class="text-xl font-semibold text-[#2B3467] mb-3">
                            {{ session('lang') == 'en' ? 'Description' : 'وصف' }}</h3>
                        <p class="text-gray-600 leading-relaxed">
                            {!! session('lang') == 'en' ? $record->description_en : $record->description_ar !!}
                        </p>
                    </div>

                    <!-- Categories -->
                    <div class="mb-8">
                        <h3 class="text-xl font-semibold text-[#2B3467] mb-3">
                            {{ session('lang') == 'en' ? 'Categories' : 'الفئات' }}</h3>
                        <div class="flex flex-wrap gap-2">
                            @foreach ($record->categories as $category)
                                <span class="px-3 py-1 bg-[#2B3467]/10 text-[#2B3467] rounded-full text-sm transform transition-all duration-300 hover:scale-105 hover:bg-[#2B3467] hover:text-white">
                                    {!! session('lang') == 'en' ? $category->name_en : $category->name_ar !!}
                                </span>
                            @endforeach
                        </div>
                    </div>

                    <!-- Add to Cart Section -->
                    @livewire('product-details', ['record' => $record])
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="mt-16 bg-white/90 backdrop-blur-sm p-8 rounded-xl shadow-lg transform transition-all duration-300 hover:shadow-2xl" x-data="{ open: true }">
            <div class="md:text-4xl text-xl font-bold flex justify-between text-[#2B3467] mb-4 cursor-pointer hover:text-[#1a1f3d] transition-colors duration-300" @click="open = !open">
                {{ session('lang') == 'en' ? 'Customer Reviews' : 'آراء العملاء' }}
                <span class="cursor-pointer transform transition-transform duration-300 hover:scale-110" x-show="!open">+</span>
                <span class="cursor-pointer transform transition-transform duration-300 hover:scale-110" x-show="open">−</span>
            </div>
            <!-- Review Form -->
            <form action="{{ route('add-review') }}" method="POST" class="mb-12" x-show="open"
                x-transition:enter="transition ease-out duration-500" x-transition:enter-start="opacity-0 scale-95"
                x-transition:enter-end="opacity-100 scale-100" x-transition:leave="transition ease-in duration-300"
                x-transition:leave-start="opacity-100 scale-100" x-transition:leave-end="opacity-0 scale-95">
                @csrf
                <input type="hidden" name="id" value="{{ $record->id }}">

                <div class="space-y-4">
                    <div class="flex flex-col space-y-2">
                        <label class="text-lg font-medium text-[#2B3467]">
                            {{ session('lang') == 'en' ? 'Your Rating' : 'تقييمك' }}
                        </label>
                        <div class="rating-stars flex space-x-2">
                            @for ($i = 5; $i >= 1; $i--)
                                <input type="radio" id="star{{ $i }}" name="rate"
                                    value="{{ $i }}" class="hidden" required>
                                <label for="star{{ $i }}"
                                    class="cursor-pointer text-3xl text-gray-300 transition-all duration-300 hover:text-[#FFD700] hover:scale-110">
                                    ★
                                </label>
                            @endfor
                        </div>
                    </div>

                    <div class="space-y-2">
                        <label for="comment" class="text-lg font-medium text-[#2B3467]">
                            {{ session('lang') == 'en' ? 'Your Review' : 'رأيك' }}
                        </label>
                        <textarea id="comment" name="comment" rows="4"
                            class="w-full p-4 border rounded-lg focus:ring-2 focus:ring-[#2B3467] focus:border-transparent transition-all duration-300 hover:shadow-lg"
                            placeholder="{{ session('lang') == 'en' ? 'Share your experience with this product...' : 'شاركنا تجربتك مع هذا المنتج...' }}"
                            required></textarea>
                    </div>

                    <button type="submit"
                        class="px-6 py-3 bg-[#2B3467] text-white rounded-lg hover:bg-[#1a1f3d] transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
                        {{ session('lang') == 'en' ? 'Submit Review' : 'إرسال التقييم' }}
                    </button>
                </div>
            </form>

            <!-- Reviews List -->
            <div class="space-y-8">
                @foreach ($comments as $com)
                    <div class="border-l-4 border-[#2B3467] pl-4 py-4 transform transition-all duration-300 hover:shadow-lg rounded-r-lg">
                        <div class="flex items-center space-x-4 mb-2">
                            <div class="flex items-center space-x-1 text-[#FFD700]">
                                @for ($i = 1; $i <= 5; $i++)
                                    <span class="{{ $i <= $com->rate ? 'text-[#FFD700]' : 'text-gray-300' }} transform transition-transform duration-300 hover:scale-110">★</span>
                                @endfor
                            </div>
                            <span class="text-gray-500 text-sm">{{ $com->created_at->diffForHumans() }}</span>
                        </div>
                        <p class="text-gray-700">{{ $com->comment }}</p>
                        <div class="mt-2 flex items-center space-x-2">
                            <svg class="w-5 h-5 text-[#2B3467]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                            <span class="text-sm text-gray-500">{{ $com->user->name ?? 'Anonymous' }}</span>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <style>
        .rating-stars input:checked~label {
            color: #FFD700;
        }

        .rating-stars label:hover,
        .rating-stars label:hover~label {
            color: #FFD700;
        }

        /* Image Gallery Styles */
        .aspect-square {
            aspect-ratio: 1 / 1;
        }

        @media (max-width: 1024px) {
            .aspect-square {
                aspect-ratio: 4 / 3;
            }
        }
    </style>

    <script>
        function changeMainImage(newSrc) {
            const mainImage = document.getElementById('mainImage');
            const mainImageModalImg = document.getElementById('mainImageModalImg');

            if (mainImage && mainImageModalImg) {
                // Add fade out effect
                mainImage.style.opacity = '0';
                setTimeout(() => {
                    mainImage.src = newSrc;
                    mainImageModalImg.src = newSrc;
                    // Add fade in effect
                    mainImage.style.opacity = '1';
                }, 200);
            }
        }

        // Initialize image gallery and zoom effect
        document.addEventListener('DOMContentLoaded', function() {
            const mainImage = document.getElementById('mainImage');
            const container = document.getElementById('imageContainer');
            
            if (mainImage && container) {
                mainImage.style.transition = 'opacity 0.2s ease-in-out';

                container.addEventListener('mousemove', function(e) {
                    const rect = container.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    
                    // Calculate the position as a percentage
                    const xPercent = (x / rect.width) * 100;
                    const yPercent = (y / rect.height) * 100;
                    
                    // Apply the zoom effect
                    mainImage.style.transform = `scale(1.5) translate(${(50 - xPercent) * 0.5}%, ${(50 - yPercent) * 0.5}%)`;
                });

                container.addEventListener('mouseleave', function() {
                    mainImage.style.transform = 'scale(1) translate(0, 0)';
                });
            }
        });
    </script>
@endsection

