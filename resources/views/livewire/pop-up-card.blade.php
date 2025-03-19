<div class="fixed top-0 w-full min-h-screen  z-50 bg-opacity-60 content-center wowDiv" data-animation="animate__fadeInDown" data-delay="300" wire:show='show' x-transition.duration.500ms>

    <form action="" method="POST" class="border max-w-lg p-4 mx-auto bg-[#fce4ec] rounded-xl content-center">
        @csrf
        @method('POST')
        <div class="w-full flex items-center justify-end">
            <button type="button" class="rounded-full px-5 bg-white text-base border border-black text-red-700 hover:bg-[#f8578c] hover:text-white font-bold" wire:click='close'>close</button>
        </div>

        <p class="text-center w-full text-xl font-bold">Quick Search</p>
        <div class="w-full md:col-start-1 md:col-end-3 pt-10">
            <label for="colors"
                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">Choose Colors</label>
            <div class="relative flex w-full">
                <select id="colors" name="colors[]" multiple placeholder="Select colors..."
                    autocomplete="off" class="block w-full rounded-sm cursor-pointer focus:outline-none"
                    multiple>
                    @foreach ($colors as $color)
                        <option value="{{ $color->id }}">{{ $color->name }}</option>
                    @endforeach
                </select>
            </div>
            <script>
                new TomSelect('#colors', {
                    maxItems: 100,
                });
            </script>
        </div>
        <div class="flex justify-between items-center py-4">

            <div>
                <label for="min_price"
                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">Min Price</label>
                <input type="text" class="block w-full rounded-sm cursor-pointer focus:outline-none" name="min_price" id="min_price" placeholder="{{$minPrice}} د.ع">
            </div>
            <div>
                <label for="max_price"
                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">Max Price</label>
                <input type="text" class="block w-full rounded-sm cursor-pointer focus:outline-none" name="max_price" id="max_price" placeholder="{{$maxPrice}} د.ع">
            </div>
        </div>

        <button class="w-full border border-black  rounded-xl py-3 text-black font-bold hover:bg-white hover:text-[#f8578c]">Search</button>
    </form>
</div>
