<form class="pt-4" wire:submit.prevent='save'>
    <div class="grid gap-6 mb-6 md:grid-cols-1">
        <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
            <div>
                <label for="name" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'name english' : 'السم بالاجنبي'}}</label>
                <input type="text" id="name" value="" name="name" wire:model='form.name' required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div>
                <label for="name" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'name arabic' : 'السم بالعربية'}}</label>
                <input type="text" id="name" value="" name="name" wire:model='form.name_ar' required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div>
                <label for="category_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'category' : 'الصنف'}}</label>
                <select id="category_id" name="category_id" wire:model='form.category_id' required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option ></option>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}">{{session('lang') == 'en' ?   $category->name_en : $category->name_ar}}</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label for="section_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'section' : 'القسم'}}</label>
                <select id="section_id" name="section_id" wire:model='form.section_id' required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option selected></option>
                    @foreach ($sections as $section)
                        <option value="{{ $section->id }}">{{ $section->name }}</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label for="branch_id" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'branch' : 'الفرع'}}</label>
                <select id="branch_id" name="branch_id" wire:model='form.branch_id' required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option selected></option>
                    @foreach ($branches as $branch)
                        <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label for="selected"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'selected' : 'عرض'}}</label>
                <input type="checkbox" wire:model='form.selected' {{ !empty($form['selected']) &&  $form['selected'] == true ? 'checked' : ''}}
                    class="bg-gray-50 border border-gray-300 text-blue-400 text-sm  focus:ring-blue-500 focus:border-blue-500 block  d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="View selected"/>
            </div>
        </div>
    </div>
    <div class="flex justify-end">
        <button  type="submit"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{session('lang') == 'en' ? 'save' : 'حفظ'}}</button>
    </div>
    <script defer>
        window.addEventListener('record-created', (message) => {
            console.log(message.title);
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'success',
                title: 'Record saved successfully!',
                showConfirmButton: false,
                timer: 2000
            });
        });
    </script>
</form>
