<x-app-layout>

    <div class="py-6 group">
        <h1
            class="text-3xl md:text-3xl font-extrabold bg-clip-text text-black bg-gradient-to-r from-blue-500 to-purple-600 inline-block transition-all duration-300 transform group-hover:scale-105 group-hover:translate-y-[-2px]">
            {{session('lang') == 'en' ? 'Product Views' : 'عرض المنتجات'}}
        </h1>
    </div>
    <!-- Breadcrumb -->
    <nav class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-800 d:border-gray-700"
        aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
                <a href="{{ route('productView.index') }}" wire:navigate
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
                    <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 d:text-gray-400">{{session('lang') == 'en' ? 'Edit' : 'تعديل'}}</span>
                </div>
            </li>
        </ol>
    </nav>
    {{-- End Breadcrumb  --}}
       <livewire:admin-panel.product-view.pv-form :record="$record" >
{{-- 
    <form class="pt-4" action="{{ route('productView.update',$record->id) }}" enctype="multipart/form-data" method="POST">
        @csrf
        @method('PUT')

        <div class="grid gap-6 mb-6 md:grid-cols-1">
            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div>
                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'name' : 'الاسم'}}</label>
                    <input type="text" id="name" value="{{ $record->name }}" name="name" required
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div>
                    <label for="category_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'category' : 'التصنيف'}}</label>
                    <select id="category_id" name="category_id" required
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option></option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}" {{ $record->category_id == $category->id ? 'selected' : '' }}>{{session('lang') == 'en' ? $category->name_en : $category->name_ar}}</option>
                        @endforeach
                    </select>
                </div>

                <div>
                    <label for="section_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'section' : 'القسم'}}</label>
                    <select id="section_id" name="section_id" required
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option></option>
                        @foreach ($sections as $section)
                            <option value="{{ $section->id }}" {{ $record->section_id == $section->id ? 'selected' : '' }}>{{ $section->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div>
                    <label for="branch_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'branch' : 'الفرع'}}</label>
                    <select id="branch_id" name="branch_id" required
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option></option>
                        @foreach ($branches as $branch)
                            <option value="{{ $branch->id }}" {{ $record->branch_id == $branch->id ? 'selected' : '' }}>{{ $branch->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div>
                    <label for="selected"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'selected' : 'عرض'}}</label>
                    <input type="checkbox" id="selected" name="" 
                        class="bg-gray-50 border border-gray-300 text-blue-400 text-sm  focus:ring-blue-500 focus:border-blue-500 block  d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="View selected" />
                        <input type="text" name="selected" id="hiddenSelectedInput" class="hidden">
                </div>

                <script>
                    // Get references to the checkbox
                    const checkboxElement = document.getElementById('selected');
                    const hiddenInput = document.getElementById('hiddenSelectedInput');
                    checkboxElement.checked = {{ $record->selected == 1 ? 'true' : 'false' }}
                    checkboxElement.addEventListener('change',function() {
                        const selectedValue = checkboxElement.checked;
                        hiddenInput.value = selectedValue;
                    })
                </script>
            </div>
        </div>
        <div class="flex justify-end">
            <button type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{session('lang') == 'en' ? 'save' : 'حفظ'}}</button>
        </div>

    </form> --}}
</x-app-layout>
