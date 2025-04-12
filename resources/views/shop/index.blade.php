@extends('layouts.home')
@section('content')
    <!-- drawer init and toggle -->
    <!-- drawer component -->

    <div id="drawer-disabled-backdrop"
        class="fixed top-0 left-0 z-40 md:hidden h-screen p-4 overflow-y-auto transition-transform -translate-x-full bg-white w-[350px] dark:bg-gray-800"
        tabindex="-1" aria-labelledby="drawer-disabled-backdrop-label">

        <h5 id="drawer-disabled-backdrop-label" class="text-base font-semibold text-gray-500 uppercase dark:text-gray-400">
            {{ session('lang') == 'en' ? 'Filter' : 'منقي' }}</h5>
        <div class="py-4 overflow-y-auto max-w-2xl">
            <form action="{{ route('filter.products') }}" method="POST">
                @csrf
                @method('POST')
                <div class="border p-2">
                    <h1> {{ session('lang') == 'en' ? 'Sort By' : 'ترتيب' }}</h1>
                    <select name="sorting" id="sorting">
                        <option value="asc">{{ session('lang') == 'en' ? 'Ascending' : 'تصاعدي' }}</option>
                        <option value="desc" @if (request()->input('sorting') == 'desc') selected @endif>
                            {{ session('lang') == 'en' ? 'Descending' : 'تنازلي' }}</option>
                        <option value="low_price" @if (request()->input('sorting') == 'low_price') selected @endif>
                            {{ session('lang') == 'en' ? 'Price - Low to high' : 'السعر من الارخص للاعلى' }}
                        </option>
                        <option value="high_price" @if (request()->input('sorting') == 'high_price') selected @endif>
                            {{ session('lang') == 'en' ? 'Price - High to low' : 'السعر الاعلى الى الادنى' }}
                        </option>
                    </select>
                </div>
                <div class="border p-2">
                    <div class="border p-2">
                        <h1> {{ session('lang') == 'en' ? 'colors' : 'ألوان' }}</h1>
                        <div class="grid grid-cols-3 gap-4 items-center justify-items-center max-w-40 mx-auto">

                            @foreach ($colors as $color)
                                <div class="items-center flex justify-stretch gap-x-4">
                                    <input type="checkbox" value="{{ $color->id }}" name="color_id[]"
                                        class="rounded-full box-border size-6 p-2 hover:border bg-[{!! $color->hex_code !!}]"
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
                    </div>
                </div>
        </div>
        <div class="border p-2">
            <div class="border p-2">
                <h1>{{ session('lang') == 'en' ? 'Categories' : 'فئات' }}</h1>
                @foreach ($categories as $cat)
                    <div class="flex items-center">
                        <input id="categories" type="checkbox" value="{{ $cat->id }}" name="categories[]"
                            class="w-4
                                    h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500
                                    dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700
                                    dark:border-gray-600"
                            @if (!empty(request()->input('categories'))) @foreach (request()->input('categories') as $index)
                                    @if ($index == $cat->id)
                                    checked
                                    @break @endif
                            @endforeach
                @endif
                >
                <label for="categories"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ session('lang') == 'en' ? $cat->name_en : $cat->name_ar }}</label>

            </div>
            @endforeach
        </div>

    </div>



    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Brands' : 'العلامات التجارية' }}</h1>
            @foreach ($brands as $brand)
                <div class="flex items-center">
                    <input id="brands" type="checkbox" value="{{ $brand->id }}" name="brands[] class="w-4 h-4
                        text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600
                        dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                        @if (!empty(request()->input('brands'))) @foreach (request()->input('brands') as $b)
                                    @if ($b == $brand->id)
                                    checked
                                    @break @endif
                        @endforeach
            @endif>

            <label for="brands"
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ session('lang') == 'en' ? $brand->name_en : $brand->name_ar }}</label>
        </div>
        @endforeach
    </div>

    </div>
    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'STORES' : 'المتاجر' }}</h1>
            @foreach ($sections as $section)
                <div class="flex items-center">
                    <input id="sections" type="checkbox" value="{{ $section->id }}" name="sections[] class="w-4 h-4
                        text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600
                        dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                        @if (!empty(request()->input('sections'))) @foreach (request()->input('sections') as $b)
                                @if ($b == $section->id)
                                checked
                                @break @endif
                        @endforeach
            @endif>

            <label for="sections"
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ session('lang') == 'en' ? $section->name : $section->name_ar }}</label>
        </div>
        @endforeach
    </div>

    </div>
    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Branches' : 'الاقسام' }}</h1>
            <select name="branch" id="branches">
                <option value=""></option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        @if (!empty(request()->input('branch'))) @if (request()->input('branch') == $branch->id)
                    selected @endif
                        @endif>
                        {{ session('lang') == 'en' ? $branch->name : $branch->name_ar }}
                    </option>
                @endforeach
            </select>
        </div>


    </div>

    <div class="border p-2">
        <h1>{{ session('lang') == 'en' ? 'Price I.Q.D' : 'السعر د.ع' }}</h1>
        <div class="flex space-x-2 justify-between items-center ">
            <input type="number" step="any" min="0" class="w-24 h-8" name="min_price"
                placeholder="{{ session('lang') == 'en' ? 'From' : 'من' }}"
                @if (!empty(request()->input('min_price'))) value = {{ request()->input('min_price') }} @endif />
            <input type="number" step="any" min="0" class="w-24 h-8" name="max_price"
                placeholder="{{ session('lang') == 'en' ? 'To' : 'الى' }}"
                @if (!empty(request()->input('max_price'))) value = {{ request()->input('max_price') }} @endif />
        </div>
    </div>
    <div class="flex justify-end text-sm pt-2">
        <button type="submit"
            class="p-2 rounded-md bg-white text-[#ec5793] border w-full font-bold transition-all delay-75 hover:text-white hover:bg-[#ec5793]">
            {{ session('lang') == 'en' ? 'Apply' : 'تأكيد' }}</button>
    </div>
    </form>

    </div>
    <button type="button" data-drawer-hide="drawer-disabled-backdrop" aria-controls="drawer-disabled-backdrop"
        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 absolute top-2.5 end-2.5 inline-flex items-center justify-center dark:hover:bg-gray-600 dark:hover:text-white">
        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
        </svg>
        <span class="sr-only">Close menu</span>
    </button>

    </div>
    <div class="bg-white flex justify-center items-start">
        <div class="md:block hidden py-4 px-6  overflow-y-auto ">
            <form action="{{ route('filter.products') }}" method="POST">
                @csrf
                @method('POST')
                <div class="border p-2">
                    <h1>{{ session('lang') == 'en' ? 'sorting' : 'ترتيب' }}</h1>
                    <select name="sorting" id="sorting">
                        <option value="asc">{{ session('lang') == 'en' ? 'Ascending' : 'تصاعدي' }}</option>
                        <option value="desc" @if (request()->input('sorting') == 'desc') selected @endif>
                            {{ session('lang') == 'en' ? 'Descending' : 'تنازلي' }}</option>
                        <option value="low_price" @if (request()->input('sorting') == 'low_price') selected @endif>
                            {{ session('lang') == 'en' ? 'Price - Low to high' : 'السعر من الارخص للاعلى' }}
                        </option>
                        <option value="high_price" @if (request()->input('sorting') == 'high_price') selected @endif>
                            {{ session('lang') == 'en' ? 'Price - High to low' : 'السعر الاعلى الى الادنى' }}
                        </option>
                    </select>
                </div>
                <div class="border p-2">
                    <div class="border p-2">
                        <h1>{{ session('lang') == 'en' ? 'colors' : 'الوان' }}</h1>
                        <div class="grid grid-cols-3 gap-4 items-center justify-items-center max-w-40 mx-auto">

                            @foreach ($colors as $color)
                                <div class="items-center flex justify-stretch gap-x-4">
                                    <input type="checkbox" value="{{ $color->id }}" name="color_id[]"
                                        class="rounded-full box-border size-6 p-2 hover:border bg-[{!! $color->hex_code !!}]"
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
                    </div>
                </div>
        </div>
        <div class="border p-2">
            <div class="border p-2">
                <h1>{{ session('lang') == 'en' ? 'Categories' : 'فئات' }}</h1>
                @foreach ($categories as $cat)
                    <div class="flex items-center">
                        <input id="categories" type="checkbox" value="{{ $cat->id }}"
                            name="categories[] class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded
                            focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2
                            dark:bg-gray-700 dark:border-gray-600"
                            @if (!empty(request()->input('categories'))) @foreach (request()->input('categories') as $index)
                                    @if ($index == $cat->id)
                                    checked
                                    @break @endif
                            @endforeach
                @endif
                >
                <label for="categories"
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ session('lang') == 'en' ? $cat->name_en : $cat->name_ar }}</label>

            </div>
            @endforeach
        </div>
    </div>

    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Brands' : 'العلامات التجارية' }}</h1>
            @foreach ($brands as $brand)
                <div class="flex items-center">
                    <input id="brands" type="checkbox" value="{{ $brand->id }}" name="brands[] class="w-4 h-4
                        text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600
                        dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                        @if (!empty(request()->input('brands'))) @foreach (request()->input('brands') as $b)
                                    @if ($b == $brand->id)
                                    checked
                                    @break @endif
                        @endforeach
            @endif>

            <label for="brands"
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ session('lang') == 'en' ? $brand->name_en : $brand->name_ar }}</label>
        </div>
        @endforeach
    </div>

    </div>

    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'STORES' : 'المتاجر' }}</h1>
            @foreach ($sections as $section)
                <div class="flex items-center">
                    <input id="section_id-{{ $section->id }}" type="checkbox" value="{{ $section->id }}"
                        name="sections[] class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded
                        focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700
                        dark:border-gray-600"
                        @if (!empty(request()->input('sections'))) @foreach (request()->input('sections') as $b)
                                @if ($b == $section->id)
                                checked
                                @break @endif
                        @endforeach
            @endif>

            <label for="section_id-{{ $section->id }}"
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                {{ session('lang') == 'en' ? $section->name : $section->name_ar }}
            </label>
        </div>
        @endforeach
    </div>

    </div>
    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Branches' : 'الاقسام' }}</h1>
            <select name="branch" id="branchesSelect">
                <option value=""></option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        @if (!empty(request()->input('branch'))) @if (request()->input('branch') == $branch->id)
                    selected @endif
                        @endif>
                        {{ session('lang') == 'en' ? $branch->name : $branch->name_ar }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="border p-2">
        <h1>{{ session('lang') == 'en' ? 'Price I.Q.D' : 'السعر د.ع' }}</h1>
        <div class="flex space-x-2 justify-between items-center">
            <input type="number" step="any" min="0" class="w-24 h-8" name="min_price" placeholder=""
                @if (!empty(request()->input('min_price'))) value = {{ request()->input('min_price') }} @endif />
            <input type="number" step="any" min="0" class="w-24 h-8" name="max_price" placeholder=""
                @if (!empty(request()->input('max_price'))) value = {{ request()->input('max_price') }} @endif />
        </div>
    </div>
    <div class="flex justify-end text-sm pt-2">
        <button type="submit"
            class="p-2 rounded-md bg-white text-[#ec5793] border w-full font-bold transition-all delay-75 hover:text-white hover:bg-[#ec5793]">
            {{ session('lang') == 'en' ? 'Apply' : 'تأكيد' }}</button>
    </div>
    </form>
    </div>
    <div class="md:max-w-4xl pt-4">
        <div class="text-start md:hidden justify-end p-4 flex">
            <button
                class="p-2 rounded-md bg-white text-[#ec5793] border font-bold transition-all delay-75 hover:text-white hover:bg-[#ec5793]"
                type="button" data-drawer-target="drawer-disabled-backdrop" data-drawer-show="drawer-disabled-backdrop"
                data-drawer-backdrop="false" aria-controls="drawer-disabled-backdrop">
                {{ session('lang') == 'en' ? 'Filter' : 'بحث مفصل' }}
            </button>
        </div>
        <div class="">
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
            ]">
        </div>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 px-10 md:px-0 mt-2">
            @if ($products->count() <= 0)
                <div class="text-center flex items-center justify-center w-full">
                    {{ session('lang') == 'en' ? 'No results found' : 'لم يتم العثور على نتائج' }}</div>
            @endif
            @foreach ($products as $item)
                <x-home.product :item="$item" />
            @endforeach

        </div>
    </div>

    </div>
    <nav aria-label="Page navigation example" class="p-4 w-1/4 mx-auto">
        {{ $products->links() }}
    </nav>
@endsection
