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
    <div
        class="mx-auto max-w-screen-xl p-4 mt-4 bg-[#ebcdd7] rounded-xl shadow-lg transition-all duration-300 hover:shadow-2xl">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
            <!-- Image Gallery Section -->
            <div class="relative">
                <div
                    class="group relative cursor-zoom-in overflow-hidden rounded-2xl shadow-xl transition-all duration-300 hover:shadow-2xl bg-white border border-gray-100">
                    <div class="skeleton-loader absolute inset-0 bg-gradient-to-r from-gray-50 to-gray-100 animate-pulse">
                    </div>
                    <img id="mainImage" src="{{ URL::to('storage/' . $record->main_image_url) }}"
                        onclick="Livewire.dispatch('openGallery')"
                        class="relative z-10 h-full w-full object-cover transition-all duration-500 ease-out group-hover:scale-105 group-hover:brightness-110"
                        alt="Main product image">
                    <div
                        class="absolute inset-0 bg-gradient-to-t from-gray-900/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    </div>
                </div>
                <!-- Thumbnail Carousel -->
                <div class="mt-4 flex justify-start space-x-4 overflow-x-auto p-2 border bg-white ">
                    @foreach ($record->images as $image)
                        <!-- Thumbnail Image -->
                        <div class="flex-shrink-0 relative group" onclick="Livewire.dispatch('openGallery')">
                            <img src="{{ URL::to('storage/' . $image->image_url) }}"
                                class="w-24 h-24 object-cover rounded-lg border-2 border-transparent group-hover:border-[#71C9CE] transition-all duration-200 cursor-zoom-in"
                                alt="Product thumbnail">
                            <div
                                class="absolute inset-0 bg-black opacity-0 group-hover:opacity-20 transition-opacity duration-300 rounded-lg">
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>

            <!-- Product Info Section -->
            <div class="bg-white p-8 rounded-xl shadow-lg">
                <h1 class="text-4xl font-bold text-[#2B3467] mb-4">
                    {!! session('lang') == 'en' ? $record->name_en : $record->name_ar !!}
                </h1>

                <div class="flex justify-between items-center mb-6">
                    <!-- Rating Badge -->
                    <div class="flex items-center space-x-2 bg-[#F8F5F1] px-4 py-2 rounded-full w-fit">
                        <div class="flex text-[#FFD700]">
                            @for ($i = 1; $i <= 5; $i++)
                                <svg class="w-6 h-6 {{ $product_rate >= $i ? 'fill-current' : 'fill-gray-300' }}"
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
                        <span class="text-3xl font-bold text-[#2B3467]"> {{session('lang') == 'en' ? 'IQD' : 'د.ع'}} {{ $record->offer_price }}</span>
                        <span class="text-xl text-gray-400 line-through"> {{session('lang') == 'en' ? 'IQD' : 'د.ع'}} {{ $record->price }}</span>
                        @else
                        <span class="text-3xl font-bold text-[#2B3467]"> {{session('lang') == 'en' ? 'IQD' : 'د.ع'}} {{ $record->price }}</span>
                        @endif
                    </div>
                    <span
                        class="px-4 py-2 rounded-full {{ $record->status == 'in_stock' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800' }}">
                        {{ session('lang') == 'en' ? ($record->status == 'in_stock' ? 'In Stock' : 'Out of Stock') : ($record->status == 'in_stock' ? 'متوفر' : 'إنتهى') }}
                    </span>
                </div>

                <!-- Product Description -->
                <div class="mb-8">
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
                            <span class="px-3 py-1 bg-[#BAD7E9] text-[#2B3467] rounded-full text-sm">
                                {!! session('lang') == 'en' ? $category->name_en : $category->name_ar !!}
                            </span>
                        @endforeach
                    </div>
                </div>

                <!-- Add to Cart Section -->
                <form action="{{ route('cart.add', $record->id) }}" method="GET" class="space-y-6">
                    @csrf
                    <div class="flex justify-start items-center space-x-4 mb-4 ">
                        @foreach ($record->colors as $color)
                            <input type="radio" name="color" value="{{ $color->id }}" required
                                class="rounded-full box-border size-10 p-2 hover:border hove bg-[{!! $color->hex_code !!}]"
                                style="background-color: {!! $color->hex_code !!}"
                                {{ $color->id == $record->colors->first()->id ? 'checked' : '' }} />
                        @endforeach
                    </div>
                    <div class="md:flex items-center md:space-x-4">
                        <div class=" flex justify-center items-center border rounded-lg overflow-hidden">
                            <button type="button"
                                class="px-4 py-2 w-full bg-gray-100 text-[#2B3467] hover:bg-gray-200 transition-colors"
                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                −
                            </button>
                            <input type="number" name="qty"
                                value="{{ session('cart') && !empty($cart[$record->id]['quantity']) ? $cart[$record->id]['quantity'] : 1 }}"
                                min="{{ $record->minimum_quantity }}" max="{{ $record->maximum_quantity }}"
                                class="w-16 text-center border-0 bg-white text-[#2B3467] focus:ring-0"
                                aria-label="Quantity">
                            <button type="button"
                                class="px-4 py-2 w-full bg-gray-100 text-[#2B3467] hover:bg-gray-200 transition-colors"
                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                +
                            </button>
                        </div>
                        <button type="submit"
                            class="flex-1 w-full md:mt-0 mt-4 bg-green-400 text-white px-8 py-3  mx-auto rounded-lg hover:bg-[#1a1f3d] transition-colors flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 576 512">
                                <path
                                    d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
                            </svg>
                            <span>{{ session('lang') == 'en' ? 'Add to Cart' : 'أضف إلى السلة' }}</span>
                        </button>
                    </div>
                    <p class="text-sm text-gray-500">
                        {{ session('lang') == 'en' ? 'Maximum quantity:' : 'الحد الأقصى:' }}
                        {{ $record->maximum_quantity }}
                    </p>
                </form>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="mt-16 bg-white p-8 rounded-xl shadow-lg">
            <h2 class="text-3xl font-bold text-[#2B3467] mb-8">
                {{ session('lang') == 'en' ? 'Customer Reviews' : 'آراء العملاء' }}
            </h2>

            <!-- Review Form -->
            <form action="{{ route('add-review') }}" method="POST" class="mb-12">
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
                                    class="cursor-pointer text-3xl text-gray-300 transition-colors hover:text-[#FFD700]">
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
                            class="w-full p-4 border rounded-lg focus:ring-2 focus:ring-[#2B3467] focus:border-transparent"
                            placeholder="{{ session('lang') == 'en' ? 'Share your experience with this product...' : 'شاركنا تجربتك مع هذا المنتج...' }}"
                            required></textarea>
                    </div>

                    <button type="submit"
                        class="px-6 py-3 bg-[#2B3467] text-white rounded-lg hover:bg-[#1a1f3d] transition-colors">
                        {{ session('lang') == 'en' ? 'Submit Review' : 'إرسال التقييم' }}
                    </button>
                </div>
            </form>

            <!-- Reviews List -->
            <div class="space-y-8">
                @foreach ($comments as $com)
                    <div class="border-l-4 border-[#2B3467] pl-4 py-4">
                        <div class="flex items-center space-x-4 mb-2">
                            <div class="flex items-center space-x-1 text-[#FFD700]">
                                @for ($i = 1; $i <= 5; $i++)
                                    <span class="{{ $i <= $com->rate ? 'text-[#FFD700]' : 'text-gray-300' }}">★</span>
                                @endfor
                            </div>
                            <span class="text-gray-500 text-sm">{{ $com->created_at->diffForHumans() }}</span>
                        </div>
                        <p class="text-gray-700">{{ $com->comment }}</p>
                        <div class="mt-2 flex items-center space-x-2">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
        /* Custom modal animation */
        .modal-enter {
            opacity: 0;
            transform: scale(0.95);
        }

        .modal-enter-active {
            opacity: 1;
            transform: scale(1);
            transition: all 150ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        .modal-exit {
            opacity: 1;
            transform: scale(1);
        }

        .modal-exit-active {
            opacity: 0;
            transform: scale(0.95);
            transition: all 150ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        .rating-stars input:checked~label {
            color: #FFD700;
        }

        .rating-stars label:hover,
        .rating-stars label:hover~label {
            color: #FFD700;
        }
    </style>

    <script>
        function changeMainImage(newSrc) {
            console.log("Changing main image to:", newSrc); // Debugging: Log the new image source
            const mainImage = document.getElementById('mainImage');
            const mainImageModalImg = document.getElementById('mainImageModalImg');

            if (mainImage && mainImageModalImg) {
                mainImage.src = newSrc;
                mainImageModalImg.src = newSrc;
            } else {
                console.error("Main image or modal image not found!"); // Debugging: Log an error if elements are missing
            }
        }
    </script>
@endsection
