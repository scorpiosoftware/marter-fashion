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
                    <h1>Sort by</h1>
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
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ $brand->name_en }}</label>
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
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ $section->name }}</label>
        </div>
        @endforeach
    </div>

    </div>
    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Branches' : 'المتاجر' }}</h1>
            <select name="branch" id="branches">
                <option value=""></option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        @if (!empty(request()->input('branch'))) @if (request()->input('branch') == $branch->id)
                    selected @endif
                        @endif>{{ $branch->name }}</option>
                @endforeach
            </select>
        </div>


    </div>

    <div class="border p-2">
        <h1>{{ session('lang') == 'en' ? 'Price $' : 'السعر $' }}</h1>
        <div class="flex space-x-2 justify-between items-center ">
            <input type="number" step="any" min="0" class="w-24 h-8" name="min_price" placeholder="From 0 $"
                @if (!empty(request()->input('min_price'))) value = {{ request()->input('min_price') }} @endif />
            <input type="number" step="any" min="0" class="w-24 h-8" name="max_price" placeholder="To Max $"
                @if (!empty(request()->input('max_price'))) value = {{ request()->input('max_price') }} @endif />
        </div>
    </div>
    <div class="flex justify-end text-sm pt-2">
        <button type="submit" class=" bg-blue-700 p-2 rounded-md text-white">Apply</button>
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
                    <h1>Sort by</h1>
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
                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ $brand->name_en }}</label>
            </div>
            @endforeach
        </div>

    </div>

    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'STORES' : 'المتاجر' }}</h1>
            @foreach ($sections as $section)
                <div class="flex items-center">
                    <input id="section_id-{{ $section->id }}" type="checkbox" value="{{ $section->id }}" name="sections[] class="w-4 h-4
                        text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600
                        dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                        @if (!empty(request()->input('sections'))) @foreach (request()->input('sections') as $b)
                                @if ($b == $section->id)
                                checked
                                @break @endif
                        @endforeach
            @endif>

            <label for="section_id-{{ $section->id }}"
                class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ $section->name }}</label>
        </div>
        @endforeach
    </div>

    </div>
    <div class="border p-2">
        <div class="border p-2">
            <h1>{{ session('lang') == 'en' ? 'Branches' : 'المتاجر' }}</h1>
            <select name="branch" id="branchesSelect">
                <option value=""></option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        @if (!empty(request()->input('branch'))) @if (request()->input('branch') == $branch->id)
                    selected @endif
                        @endif>{{ $branch->name }}</option>
                @endforeach
            </select>
        </div>

        {{-- <script>
            $(document).ready(function() {
                $("#section_id-{{ $section->id }}").on('change', function() {
                    var sectionId = $(this).val();
                    if (sectionId) {
                        // Show loading indicator
                        $('#loading').show();
                        // $('#branchesSelect').show();
                        $('#branchesSelect').empty();
                        // Send AJAX request
                        $.ajax({
                            url: '/api/branches/' + sectionId + '/section',
                            type: 'GET',
                            dataType: 'json',
                            success: function(data) {
                                console.log(data);
                                // Hide loading indicator
                                $('#loading').hide();
                                // Clear existing rows
                                $('#branchesSelect tbody').empty();
                                // Append new rows with AJAX data
                                if (data.length > 0) {
                                    $.each(data, function(key, branch) {
                                        $('#branchesSelect').append(
                                        "<option value='" + branch.id + "'>" + branch.name + "</option>"
                                        );
                                    });
                                    $('#branchesSelect').show();
                                } else {
                                    $('#branchesSelect').empty();
                                    $('#branchesSelect').show();
                                }
                            },
                            error: function() {
                                $('#loading').hide();
                                alert('Failed to fetch branches. Please try again.');
                            }
                        });
                    } else {
                        // Clear the table if no section is selected
                        $('#branchesSelect').empty();
                        $('#branchesSelect').hide();
                    }
                });
            });
        </script> --}}
    </div>

    <div class="border p-2">
        <h1>{{ session('lang') == 'en' ? 'Price $' : 'السعر $' }}</h1>
        <div class="flex space-x-2 justify-between items-center ">
            <input type="number" step="any" min="0" class="w-24 h-8" name="min_price"
                placeholder="From 0 $"
                @if (!empty(request()->input('min_price'))) value = {{ request()->input('min_price') }} @endif />
            <input type="number" step="any" min="0" class="w-24 h-8" name="max_price"
                placeholder="To Max $"
                @if (!empty(request()->input('max_price'))) value = {{ request()->input('max_price') }} @endif />
        </div>
    </div>
    <div class="flex justify-end text-sm pt-2">
        <button type="submit" class=" bg-blue-700 p-2 rounded-md text-white">Apply</button>
    </div>
    </form>
    </div>
    <div class="md:max-w-4xl pt-4">
        <div class="text-start md:hidden justify-end p-4 flex">
            <button
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                type="button" data-drawer-target="drawer-disabled-backdrop" data-drawer-show="drawer-disabled-backdrop"
                data-drawer-backdrop="false" aria-controls="drawer-disabled-backdrop">
                {{ session('lang') == 'en' ? 'Filter' : 'تنقية' }}
            </button>
        </div>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 px-10 md:px-0">
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
