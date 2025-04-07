<x-app-layout>
    @if (session()->has('success'))
        <div id="alert-border-3"
            class="flex items-center p-4 mb-4 text-green-800 border-t-4 border-green-300 bg-green-50 d:text-green-400 d:bg-gray-800 d:border-green-800"
            role="alert">
            <svg class="flex-shrink-0 w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                viewBox="0 0 20 20">
                <path
                    d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <div class="ms-3 text-sm font-medium">
                {{ session()->get('success') }}
            </div>
        </div>
    @endif
    <div class="py-6 group">
        <h1
            class="text-3xl md:text-3xl font-extrabold bg-clip-text text-black bg-gradient-to-r from-blue-500 to-purple-600 inline-block transition-all duration-300 transform group-hover:scale-105 group-hover:translate-y-[-2px]">
            {{session('lang') == 'en' ? 'Products' : 'المنتجات'}}

        </h1>
    </div>
    <!-- Breadcrumb -->
    <nav class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-800 d:border-gray-700"
        aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
                <a href="{{ route('product.index') }}"
                    class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 d:text-gray-400 d:hover:text-white">
                    <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                        fill="currentColor" viewBox="0 0 20 20">
                        <path
                            d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                    </svg>
                    {{session('lang') == 'en' ? 'Home' : 'القائمة الرئيسية'}}
                </a>
            </li>
            <li aria-current="page">
                <div class="flex items-center">
                    <svg class="rtl:rotate-180  w-3 h-3 mx-1 text-gray-400" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 9 4-4-4-4" />
                    </svg>
                    <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 d:text-gray-400">{{session('lang') == 'en' ? 'create' : 'انشاء'}}</span>
                </div>
            </li>
        </ol>
    </nav>
    {{-- End Breadcrumb  --}}
    <form class="pt-4" action="{{ route('product.store') }}" enctype="multipart/form-data" method="POST">
        @csrf
        @method('POST')
        <div class="grid gap-6 mb-6 md:grid-cols-1">
            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div>
                    <label for="code" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'code' : 'الرمز'}}</label>
                    <input type="text" id="code" value="" name="code"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" required />
                </div>
                <div>
                    <label for="name_en" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'name en' : 'الاسم الاجنبي'}}</label>
                    <input type="text" id="name_en" value="" name="name_en"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div>
                    <label for="name_ar" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'name ar' : 'الاسم العربي'}}</label>
                    <input type="text" id="name_ar" value="" name="name_ar"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div>
                    <label for="brand_id"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'brand' : 'العلامة التجارية'}}</label>
                    <select id="brand_id" name="brand_id"
                        class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        @foreach ($brands as $brand)
                            <option value="{{ $brand->id }}">{{session('lang') == 'en' ? $brand->name_en : $brand->name_ar}}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label for="section_id"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'section' : 'القسم'}}</label>
                    <select id="section_id" name="section_id"
                        class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                         <option value=""></option>
                        @foreach ($sections as $section)
                            <option value="{{ $section->id }}">{{ $section->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label for="branch_id"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'branch' : 'الفرع'}}</label>
                    <select id="branchesSelect" name="branch_id"
                        class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    </select>
                </div>
                <script>
                    $(document).ready(function() {
                        $('#section_id').on('change', function() {
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
                </script>
                <div>
                    <label for="status"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'status' : 'الحالة'}}</label>
                    <select id="status" name="status"
                        class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option value="in_stock">{{session('lang') == 'en' ? 'in stock' : 'متوفر'}}</option>
                        <option value="out_of_stock">{{session('lang') == 'en' ? 'out of stock' : 'غير متوفر'}}</option>
                    </select>
                </div>
                <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2 md:col-start-1 md:col-end-3">
                    <div class="w-full mt-2">
                        <div class="flex justify-between items-center">
                            <label for="main_image_url"
                                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'main image' : 'الصورة الرئيسية'}}</label>
                        </div>
                        <div class="mt-4">
                            <input type="file" id="main_image_url" name="main_image_url" value=""
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                                placeholder="choose image" />
                        </div>

                    </div>
                    <div class="w-full mt-2">
                        <div class="flex justify-between items-center">
                            <label for="images"
                                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'other images' : 'صور ثانوية'}}</label>
                        </div>
                        <div class="mt-4">
                            <input type="file" multiple id="images" name="images[]" value=""
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                                placeholder="choose image" />
                        </div>

                    </div>

                    <div class="w-full md:col-start-1 md:col-end-3">
                        <label for="categories"
                            class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'categories' : 'الاصناف'}}</label>
                        <div class="relative flex w-full">
                            <select id="categories" name="categories[]" multiple placeholder="..."
                                autocomplete="off" class="block w-full rounded-sm cursor-pointer focus:outline-none"
                                multiple>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{session('lang') == 'en' ? $category->name_en : $category->name_ar}}</option>
                                @endforeach

                            </select>
                        </div>
                        <script>
                            new TomSelect('#categories', {
                                maxItems: 100,
                            });
                        </script>
                    </div>


                    <div class="w-full md:col-start-1 md:col-end-3">
                        <label for="colors"
                            class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'colors' : 'الالوان'}}</label>
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
                </div>

            </div>
{{-- Prices and qty's --}}
            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div>
                    <label for="price"
                        class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{session('lang') == 'en' ? 'price' : 'السعر'}}</label>

                    <input type="number" id="price" value="" name="price" step=".01"
                        class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" required />
                </div>
                <div>
                    <label for="offer_price"
                        class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{session('lang') == 'en' ? 'offer price' : 'سعر بعد الحسم'}}</label>

                    <input type="number" id="offer_price" value="" name="offer_price" step=".01"
                        class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div>
                    <label for="stock_quantity"
                        class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{session('lang') == 'en' ? 'quantity' : 'الكمية'}}</label>

                    <input type="number" id="stock_quantity" value="" name="stock_quantity"
                        class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div class="">
                    <label for="minimum_quantity"
                        class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{session('lang') == 'en' ? 'min quantity' : 'الحد الأدنى للكمية'}}</label>

                    <input type="number" id="minimum_quantity" value="1" name="minimum_quantity"
                        class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div class="">
                    <label for="maximum_quantity"
                        class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{session('lang') == 'en' ? 'max quantity' : 'الكمية القصوى'}}</label>

                    <input type="number" id="maximum_quantity" value="5" name="maximum_quantity"
                        class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
            </div>

            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div class="">
                    <label for="description_en" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">
                        {{session('lang') == 'en' ? 'description en' : 'الوصف بالاجنبي'}}</label>
                    <section>
                        <div
                            class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-700 d:border-gray-600">
                            <div class="flex items-center justify-between px-3 py-2 border-b d:border-gray-600">
                                <div
                                    class="flex flex-wrap items-center divide-gray-200 sm:divide-x sm:rtl:divide-x-reverse d:divide-gray-600">
                                    <div class="flex items-center space-x-1 rtl:space-x-reverse sm:pe-4">

                                    </div>
                                    <div class="flex flex-wrap items-center space-x-1 rtl:space-x-reverse sm:ps-4">

                                    </div>
                                </div>
                            </div>
                            <div class="px-4 py-2 bg-white rounded-b-lg d:bg-gray-800">
                                <label for="description_en" class="sr-only">Publish post</label>
                                <textarea id="description_en" rows="8" name="description_en"
                                    class="block w-full px-0 text-sm text-gray-800 bg-white border-0 d:bg-gray-800 focus:ring-0 d:text-white d:placeholder-gray-400"
                                    placeholder=""></textarea>
                                <script>
                                    CKEDITOR.replace('description_en');
                                </script>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="">
                    <label for="description_ar" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">
                        {{session('lang') == 'en' ? 'description ar' : 'الوصف بالعربية'}}</label>
                    <section>
                        <div
                            class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-700 d:border-gray-600">
                            <div class="flex items-center justify-between px-3 py-2 border-b d:border-gray-600">
                                <div
                                    class="flex flex-wrap items-center divide-gray-200 sm:divide-x sm:rtl:divide-x-reverse d:divide-gray-600">
                                    <div class="flex items-center space-x-1 rtl:space-x-reverse sm:pe-4">

                                    </div>
                                    <div class="flex flex-wrap items-center space-x-1 rtl:space-x-reverse sm:ps-4">

                                    </div>
                                </div>
                            </div>
                            <div class="px-4 py-2 bg-white rounded-b-lg d:bg-gray-800">
                                <label for="description_ar" class="sr-only">Publish post</label>
                                <textarea id="description_ar" rows="8" name="description_ar"
                                    class="block w-full px-0 text-sm text-gray-800 bg-white border-0 d:bg-gray-800 focus:ring-0 d:text-white d:placeholder-gray-400"
                                    placeholder="اكتب نص..."></textarea>
                            </div>
                        </div>
                    </section>
                    <script>
                        CKEDITOR.replace('description_ar');
                    </script>
                </div>
            </div>
        </div>
        <div class="flex justify-end">
            <button type="submit"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{session('lang') == 'en' ? 'save' : 'حفظ'}}</button>
   
        </div>

        </form>
</x-app-layout>
