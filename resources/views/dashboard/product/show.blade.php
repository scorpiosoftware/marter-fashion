<x-app-layout>
    <!-- Breadcrumb -->
    <nav class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-800 d:border-gray-700"
        aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
                <a href="{{ route('product.index') }}"
                    class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 d:text-gray-400 d:hover:text-white">
                    <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                        viewBox="0 0 20 20">
                        <path
                            d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                    </svg>
                    Home
                </a>
            </li>
            <li aria-current="page">
                <div class="flex items-center">
                    <svg class="rtl:rotate-180  w-3 h-3 mx-1 text-gray-400" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 9 4-4-4-4" />
                    </svg>
                    <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 d:text-gray-400">Show</span>
                </div>
            </li>
        </ol>
    </nav>
    {{-- End Breadcrumb  --}}
    <div class="mx-auto max-w-screen-xl p-4 mt-10 bg-[#FCE38A] rounded-xl shadow-lg transition-all duration-300 hover:shadow-2xl">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
            <!-- Image Gallery Section -->
            <div class="relative">
                <!-- Main Image Modal -->
                <div id="mainImageModal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                    <div class="relative p-4 w-full max-w-4xl">
                        <div class="relative bg-white rounded-lg shadow">
                            <button type="button" class="absolute top-2 right-2 text-gray-400 bg-transparent hover:bg-gray-200 rounded-lg text-sm p-1.5" data-modal-hide="mainImageModal">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                            </button>
                            <!-- Main Image in Modal -->
                            <img id="mainImageModalImg" src="{{ URL::to('storage/' . $record->main_image_url) }}" class="w-full h-auto max-h-[90vh] object-contain" alt="Main product image">
                        </div>
                    </div>
                </div>

                <!-- Main Image with Zoom -->
                <div class="group relative cursor-zoom-in overflow-hidden rounded-xl">
                    <img id="mainImage" 
                         src="{{ URL::to('storage/' . $record->main_image_url) }}" 
                         class="box-content size-1/2 mx-auto object-cover transition-transform duration-300 group-hover:scale-105"
                         alt="Main product image"
                         data-modal-target="mainImageModal"
                         data-modal-toggle="mainImageModal">
                    <div class="absolute inset-0 bg-black opacity-0 group-hover:opacity-20 transition-opacity duration-300"></div>
                </div>

                <!-- Thumbnail Carousel -->
                <div class="mt-6 flex space-x-4 overflow-x-auto pb-4">
                    @foreach ($record->images as $image)
                        <!-- Thumbnail Modal -->
                        <div id="modal-{{ $image->id }}" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                            <div class="relative p-4 w-full max-w-4xl">
                                <div class="relative bg-white rounded-lg shadow">
                                    <button onclick="() => console.log('image clicked')" type="button" class="absolute top-2 right-2 text-gray-400 bg-transparent hover:bg-gray-200 rounded-lg text-sm p-1.5" data-modal-hide="modal-{{ $image->id }}">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                        </svg>
                                    </button>
                                    <img src="{{ URL::to('storage/' . $image->image_url) }}" class="w-full h-auto max-h-[80vh] object-contain" alt="Product image">
                                </div>
                            </div>
                        </div>

                        <!-- Thumbnail Image -->
                        <div class="flex-shrink-0 relative group">
                            <img src="{{ URL::to('storage/' . $image->image_url) }}" 
                                 class="w-24 h-24 object-cover rounded-lg border-2 border-transparent group-hover:border-[#71C9CE] transition-all duration-200 cursor-zoom-in"
                                 alt="Product thumbnail"
                                 onclick="changeMainImage('{{ URL::to('storage/' . $image->image_url) }}')"
                                 data-modal-target="modal-{{ $image->id }}"
                                 data-modal-toggle="modal-{{ $image->id }}">
                            <div class="absolute inset-0 bg-black opacity-0 group-hover:opacity-20 transition-opacity duration-300 rounded-lg"></div>
                        </div>
                    @endforeach
                </div>
            </div>

            <!-- Product Info Section -->
            <div class="bg-white p-8 rounded-xl shadow-lg">
                <h1 class="text-4xl font-bold text-[#2B3467] mb-4">
                    {!! session('lang') == 'en' ? $record->name_en : $record->name_ar !!}
                </h1>

                <!-- Price and Availability -->
                <div class="mb-8 flex items-center justify-between">
                    <div class="flex items-end space-x-4">
                        <span class="text-3xl font-bold text-[#2B3467]">${{ $record->price }}</span>
                        @if($record->compare_price)
                            <span class="text-xl text-gray-400 line-through">${{ $record->compare_price }}</span>
                        @endif
                    </div>
                    <span class="px-4 py-2 rounded-full {{ $record->status == 'in_stock' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800' }}">
                        {{ session('lang') == 'en' ? ($record->status == 'in_stock' ? 'In Stock' : 'Out of Stock') : ($record->status == 'in_stock' ? 'متوفر' : 'إنتهى') }}
                    </span>
                </div>

                <!-- Product Description -->
                <div class="mb-8">
                    <h3 class="text-xl font-semibold text-[#2B3467] mb-3">{{ session('lang') == 'en' ? 'Description' : 'وصف' }}</h3>
                    <p class="text-gray-600 leading-relaxed">
                        {!!session('lang') == 'en' ? $record->description_en : $record->description_ar  !!}
                    </p>
                </div>

                <!-- Categories -->
                <div class="mb-8">
                    <h3 class="text-xl font-semibold text-[#2B3467] mb-3">{{ session('lang') == 'en' ? 'Categories' : 'الفئات' }}</h3>
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
                    <div class="flex items-center space-x-4">
                        <div class="flex items-center border rounded-lg overflow-hidden">
                            <button type="button" 
                                    class="px-4 py-2 bg-gray-100 text-[#2B3467] hover:bg-gray-200 transition-colors"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                −
                            </button>
                            <input type="number" 
                                   name="qty"
                                   value="{{ session('cart') && !empty($cart[$record->id]['quantity']) ? $cart[$record->id]['quantity'] : 1 }}"
                                   min="{{ $record->minimum_quantity }}"
                                   max="{{ $record->maximum_quantity }}"
                                   class="w-16 text-center border-0 bg-white text-[#2B3467] focus:ring-0"
                                   aria-label="Quantity">
                            <button type="button" 
                                    class="px-4 py-2 bg-gray-100 text-[#2B3467] hover:bg-gray-200 transition-colors"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                +
                            </button>
                        </div>
                        <button type="submit" 
                                class="flex-1 bg-[#2B3467] text-white px-8 py-3 rounded-lg hover:bg-[#1a1f3d] transition-colors flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 576 512">
                                <path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/>
                            </svg>
                            <span>{{ session('lang') == 'en' ? 'Add to Cart' : 'أضف إلى السلة' }}</span>
                        </button>
                    </div>
                    <p class="text-sm text-gray-500">
                        {{ session('lang') == 'en' ? 'Maximum quantity:' : 'الحد الأقصى:' }} {{ $record->maximum_quantity }}
                    </p>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
