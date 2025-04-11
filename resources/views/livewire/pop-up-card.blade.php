<div class="fixed top-0 w-full min-h-screen  z-50 bg-opacity-60 content-center wowDiv"
    data-animation="animate__fadeInDown" data-delay="300" wire:show='show' x-transition.duration.500ms>

    <form action="{{ route('filter.products') }}" method="POST"
        class="border md:max-w-lg max-w-sm p-4 mx-auto bg-[#fce4ec] rounded-xl content-center">
        @csrf
        @method('POST')


        <p class="text-center w-full text-xl font-bold">{{ session('lang') == 'en' ? 'Quick Search' : 'بحث سريع' }}</p>
        <div class="w-full md:col-start-1 md:col-end-3 pt-10">
            <label for="colors" class="block mb-2 text-sm font-medium text-center text-gray-900 d:text-white">
                {{ session('lang') == 'en'
                    ? 'Choose
                                                Colors'
                    : '' }}</label>
            {{-- <div class="grid grid-cols-4 items-center gap-4 justify-items-center max-w-72 mx-auto">
                @foreach ($colors as $color)
                    <div class="items-center flex justify-stretch gap-x-4">
                        <input type="checkbox" value="{{ $color->id }}" name="color_id[]"
                            class="rounded-full box-border size-12 p-2 hover:border bg-[{!! $color->hex_code !!}]"
                            style="background-color: {!! $color->hex_code !!}"
                            @if (!empty(request()->input('color_id'))) @foreach (request()->input('color_id') as $index)
                    @if ($index == $color->id)
                    checked
                    @break @endif
                            @endforeach
                @endif
                />
            </div>
            @endforeach
        </div> --}}
        </div>
        <div class="flex justify-between items-center py-4">
            <div>
                <label for="min_price"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'Min Price' : 'الحد الأدنى للسعر' }}</label>
                <input type="text" class="block w-full rounded-sm cursor-pointer focus:outline-none" name="min_price"
                    id="min_price" placeholder={{session('lang') == 'en' ? 'IQD' : 'د.ع'}}>
            </div>
            <div>
                <label for="max_price"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'Max Price' : 'الحد الأقصى للسعر' }}</label>
                <input type="text" class="block w-full rounded-sm cursor-pointer focus:outline-none" name="max_price"
                    id="max_price" placeholder={{session('lang') == 'en' ? 'IQD' : 'د.ع'}}>
            </div>
        </div>


        <div class="w-full flex items-center justify-between space-x-10 gap-x-5">
            <button
                class=" w-1/2 border border-black  rounded-xl py-3 text-black font-bold hover:bg-white hover:text-[#f8578c]">{{ session('lang') == 'en' ? 'Search' : 'ابحث' }}</button>
            <div class="w-full px-2"></div>
                <button type="button"
                class="w-1/2 border border-black  rounded-xl py-3 text-black font-bold hover:bg-white hover:text-[#f8578c]"
                wire:click='close'>{{ session('lang') == 'en' ? 'close' : 'اغلاق' }}</button>
        </div>
    </form>
</div>
