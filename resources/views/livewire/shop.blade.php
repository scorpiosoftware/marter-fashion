<div class="max-w-6xl mx-auto">
    <form wire:submit='listProducts'>
    <div class="w-full mx-auto bg-slate-100 mt-2  text-black" wire:ignore>
        <div class="md:flex grid grid-cols-1 justify-center p-3 items-center md:space-x-4">
            <div class="">
                <label class="inline-block text-sm text-gray-600"
                    for="Multiselect">{{ session('lang') == 'en' ? 'sorting' : 'ترتيب' }}</label>
                <select wire:model='sort'  class="w-80 text-nowrap" id="sorting">
                    <option value="asc">{{ session('lang') == 'en' ? 'Ascending' : 'تصاعدي' }}</option>
                    <option value="desc">
                        {{ session('lang') == 'en' ? 'Descending' : 'تنازلي' }}</option>
                    <option value="low_price">
                        {{ session('lang') == 'en' ? 'Price - Low to high' : 'السعر من الارخص للاعلى' }}
                    </option>
                    <option value="high_price">
                        {{ session('lang') == 'en' ? 'Price - High to low' : 'السعر الاعلى الى الادنى' }}
                    </option>
                </select>
            </div>
            <div class="">
                <div class="w-full">
                    <label class="inline-block text-sm text-gray-600"
                        for="Multiselect">{{ session('lang') == 'en' ? 'categories' : 'الاصناف' }}</label>
                    <div class="relative min-w-60">
                        <select id="categories" wire:model="category" wire:change="dispatch('apply')" placeholder=""
                            autocomplete="off" class="block rounded-sm cursor-pointer">
                            <option value=""></option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}">
                                    {{ session('lang') == 'en' ? $category->name_en : $category->name_ar }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div>
                <div class="w-full">
                    <label class="inline-block text-center w-full text-sm text-gray-600"
                        for="Multiselect"></label>
                    <div class="flex space-x-2 md:justify-between justify-start items-center">
                        <label class="inline-block text-start w-full text-sm text-gray-600"
                            for="Multiselect">{{ session('lang') == 'en' ? 'maximum' : 'السعر الادنى' }}</label>
                        <input type="number" step="any" min="0"
                            class="w-24 h-[2.2rem] rounded-sm border-gray-300" name="min_price"
                            wire:model='minPrice' wire:change="dispatch('apply')" placeholder="" />
                        <label class="inline-block text-start w-full text-sm text-gray-600"
                            for="Multiselect">{{ session('lang') == 'en' ? 'minumum' : 'السعر الاقصى' }}</label>
                        <input type="number" step="any" min="0"
                            class="w-24 h-[2.2rem] rounded-sm border-gray-300" name="max_price"
                            wire:model='maxPrice' wire:change="dispatch('apply')" placeholder="" />
                    </div>
                </div>
            </div>

        </div>
    </div>
    <button type="submit">apply</button>
    </form>


    <div class="bg-white">
        @if ($products?->count() <= 0)
            <div class="text-center flex items-center justify-center w-full mx-auto">
                {{ session('lang') == 'en' ? 'No results found' : 'لم يتم العثور على نتائج' }} </div>

            @else
            <div 
                class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 gap-4 mx-auto p-4 md:px-0 mt-2">
                @foreach ($products as $item)
                    <div class="w-full">
                      
                        @livewire('product', ['item' => $item], key($item->id))
                    </div>
                @endforeach
            </div>
        @endif

    </div>
    <!-- Quick View Modal -->
    <livewire:quick-view-product />
</div>
@script
    <script>
        new TomSelect('#categories', {
            minItems: 0,
            maxItems: 100,
            highlight: true,
            hideSelected: true,
            plugins: ['remove_button', 'drag_drop']
        });
        new TomSelect('#sorting', {
            maxItems: 1,
            highlight: true,
            hideSelected: true,
            plugins: ['remove_button', 'drag_drop', 'checkbox_options']
        });
    </script>
@endscript
