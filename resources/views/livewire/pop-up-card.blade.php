<div class="fixed top-0 left-0 w-full min-h-screen flex items-center justify-center z-50 bg-black bg-opacity-60 backdrop-blur-sm"
    data-animation="animate__fadeInDown" data-delay="300" wire:show='show' x-transition.duration.500ms>

    <form action="{{ route('filter.products') }}" method="POST"
        class="border-0 md:max-w-lg max-w-sm p-8 mx-auto bg-white rounded-2xl shadow-2xl transform transition-all">
        @csrf
        @method('POST')

        <div class="mb-8 text-center">
            <p class="text-2xl font-extrabold text-gray-800 tracking-tight">
                {{ session('lang') == 'en' ? 'Quick Search' : 'بحث سريع' }}
            </p>
            <div class="mt-2 w-12 h-1 bg-[#f8578c] mx-auto rounded-full"></div>
        </div>

        <div class="flex justify-between items-center gap-6 mb-8">
            <div class="flex-1">
                <label for="min_price" class="block mb-2 text-sm font-semibold text-gray-700">
                    {{ session('lang') == 'en' ? 'Min Price' : 'الحد الأدنى للسعر' }}
                </label>
                <div class="relative">
                    <input type="text" 
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#f8578c] focus:border-transparent placeholder-gray-400 transition-all"
                           name="min_price"
                           id="min_price"
                           placeholder="{{ session('lang') == 'en' ? 'IQD' : 'د.ع' }}">
                </div>
            </div>
            
            <div class="flex-1">
                <label for="max_price" class="block mb-2 text-sm font-semibold text-gray-700">
                    {{ session('lang') == 'en' ? 'Max Price' : 'الحد الأقصى للسعر' }}
                </label>
                <div class="relative">
                    <input type="text" 
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#f8578c] focus:border-transparent placeholder-gray-400 transition-all"
                           name="max_price"
                           id="max_price"
                           placeholder="{{ session('lang') == 'en' ? 'IQD' : 'د.ع' }}">
                </div>
            </div>
        </div>

        <div class="flex items-center justify-between gap-4">
            <button type="submit"
                class="flex-1 px-6 py-3.5 bg-[#f8578c] text-white font-semibold rounded-lg hover:bg-[#e54a7a] transition-colors duration-300 transform hover:scale-[1.02] shadow-md">
                {{ session('lang') == 'en' ? 'Search' : 'ابحث' }}
            </button>
            
            <button type="button"
                class="flex-1 px-6 py-3.5 border-2 border-gray-300 text-gray-600 font-semibold rounded-lg hover:bg-gray-50 transition-colors duration-300 transform hover:scale-[1.02]"
                wire:click='close'>
                {{ session('lang') == 'en' ? 'Close' : 'اغلاق' }}
            </button>
        </div>
    </form>
</div>