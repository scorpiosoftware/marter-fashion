    <form class="pt-4" wire:submit.prevent='save'>
        <div class="grid gap-6 mb-6 md:grid-cols-1">
            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div>
                    <label for="name_en"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'name en' : 'الاسم بالاجنبية' }}</label>
                    <input type="text" id="name_en" value="" name="name_en" wire:model='form.name_en'
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="" />
                </div>
                <div>
                    <label for="name_ar"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'name ar' : 'الاسم بالعربية' }}</label>
                    <input type="text" id="name_ar" value="" name="name_ar" wire:model='form.name_ar'
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder= "" />
                </div>

                <div>
                    <label for="parent_id"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'Parent category' : 'التصنيف' }}</label>
                    <select id="parent_id" name="parent_id" wire:model='form.parent_id'
                        class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option value=""></option>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">
                                {{ session('lang') == 'en' ? $category->name_en : $category->name_ar }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
        <div class="flex justify-end">
            <button type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{ session('lang') == 'en' ? 'save' : 'حفظ' }}</button>
        </div>
        <script defer>
            window.addEventListener('record-created', (message) => {
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
