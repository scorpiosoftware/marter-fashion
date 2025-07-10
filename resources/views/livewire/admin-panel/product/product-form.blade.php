<form class="pt-4" wire:submit.prevent='save' enctype="multipart/form-data">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <div class="grid gap-6 mb-6 md:grid-cols-1">
        <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
            <div>
                <label for="code"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'code' : 'الرمز' }}</label>
                <input type="text" id="code" value="" name="code" wire:model='form.code'
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" required />
            </div>
            <div>
                <label for="name_en"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'name en' : 'الاسم الاجنبي' }}</label>
                <input type="text" id="name_en" wire:model='form.name_en'
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div>
                <label for="name_ar"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'name ar' : 'الاسم العربي' }}</label>
                <input type="text" id="name_ar" value="" name="name_ar" wire:model='form.name_ar'
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div>
                <label for="brand_id"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'brand' : 'العلامة التجارية' }}</label>
                <select id="brand_id" name="brand_id" wire:model='form.brand_id'
                    class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option value=""></option>
                    @foreach ($brands as $brand)
                        <option value="{{ $brand->id }}">
                            {{ session('lang') == 'en' ? $brand->name_en : $brand->name_ar }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label for="section_id"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'section' : 'القسم' }}</label>
                <select id="section_id" name="section_id" wire:model='form.section_id'
                    class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option value=""></option>
                    @foreach ($sections as $section)
                        <option value="{{ $section->id }}">{{ $section->name }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label for="branch_id"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'branch' : 'الفرع' }}</label>
                <select id="branch_id" name="branch_id" wire:model='form.branch_id'
                    class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option value=""></option>
                    @foreach ($branches as $branch)
                        <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                    @endforeach
                </select>
            </div>
            {{-- <script>
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
                                                    "<option value='" + branch.id + "'>" +
                                                    branch.name + "</option>"
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
            <style>
                .ts-control input {
                    min-width: 5rem !important;
                }
            </style>
            <div>
                <label for="status"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'status' : 'الحالة' }}</label>
                <select id="status" name="status" wire:model='form.status'
                    class="bg-gray-50 border border-gray-300 text-gray-900 mb-6 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                    <option value="in_stock">{{ session('lang') == 'en' ? 'in stock' : 'متوفر' }}</option>
                    <option value="out_of_stock">{{ session('lang') == 'en' ? 'out of stock' : 'غير متوفر' }}
                    </option>
                </select>
            </div>
            <div class="w-full" wire:ignore>
                <label class="block mb-2 text-sm font-medium text-gray-900 d:text-white">
                    {{ session('lang') == 'en' ? 'Sizes' : 'الاصناف' }}
                </label>
                <div class="flex justify-start items-center space-x-2">
                    <select id='sizes' class="w-full" wire:model="form.sizes" multiple wire:ignore>
                        @foreach ($sizes as $size)
                            <option value="{{ $size->id }}">
                                {{ $size->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                @error('form.sizes')
                    <p class="mt-2 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>
            @script
                <script>
                    const ts = new TomSelect(document.getElementById('sizes'), {
                        maxItems: 10,
                        // create: function(input) {
                        //     const value = input.trim();

                        //     if (!value) return false;

                        //     Livewire.dispatch('createSize', {
                        //         name: value
                        //     });
                        //     // Temporary placeholder (prevents invalid values)
                        //     return {
                        //         value: value,
                        //     };
                        // },
                        // onItemAdd: function(value, text) {
                        //     const input = text.innerText;

                        //     Livewire.on('sizeCreated', (size) => {
                        //         // console.log(size[0]);
                        //         // Add new option only if it doesn't exist
                        //         if (!ts.options[size[0].id]) {
                        //            const op = ts.addOption({
                        //                 value: size[0].id,
                        //                 text: size[0].name
                        //             });
                        //             console.log(op);
                        //         }

                        //         // Add to selection and trigger Livewire update
                        //         ts.addItem(size.id);
                        //         document.querySelector('#sizes').dispatchEvent(new Event('input'));
                        //     });
                        // }

                    });
                </script>
            @endscript


        </div>
        {{-- Prices and qty's --}}
        <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
            <div>
                <label for="price"
                    class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{ session('lang') == 'en' ? 'price' : 'السعر' }}</label>

                <input type="number" id="price" value="" name="price" step=".01"
                    wire:model='form.price'
                    class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" required />
            </div>
            <div>
                <label for="offer_price"
                    class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{ session('lang') == 'en' ? 'offer price' : 'سعر بعد الحسم' }}</label>

                <input type="number" id="offer_price" value="" name="offer_price" step=".01"
                    wire:model='form.offer_price'
                    class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div class="hidden">
                <label for="stock_quantity"
                    class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{ session('lang') == 'en' ? 'quantity' : 'الكمية' }}</label>

                <input type="number" id="stock_quantity" value="" name="stock_quantity"
                    class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div class="hidden">
                <label for="minimum_quantity"
                    class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{ session('lang') == 'en' ? 'min quantity' : 'الحد الأدنى للكمية' }}</label>

                <input type="number" id="minimum_quantity" value="1" name="minimum_quantity"
                    class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
            <div class="hidden">
                <label for="maximum_quantity"
                    class="block mb-2 text-sm font-medium text-gray-900  d:text-white">{{ session('lang') == 'en' ? 'max quantity' : 'الكمية القصوى' }}</label>

                <input type="number" id="maximum_quantity" value="5" name="maximum_quantity"
                    class="bg-gray-50 h-12 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" />
            </div>
        </div>
        <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2 md:col-start-1 md:col-end-3">
            <div class="w-full mt-2">
                <div class="flex justify-between items-center">
                    <label for="main_image_url"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'main image' : 'الصورة الرئيسية' }}</label>
                </div>
                <div class="mt-4">
                    <input type="file" id="main_image_url" name="main_image_url" value=""
                        wire:model='form.main_image_url'
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="choose image" />
                </div>

            </div>
            <div class="w-full mt-2">
                <div class="flex justify-between items-center">
                    <label for="images"
                        class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'other images' : 'صور ثانوية' }}</label>
                </div>
                <div class="mt-4" x-data="imageUploader()" x-init="init()" wire:ignore>
                    <input type="file" multiple id="multiImageInput" name="images[]" value=""
                        wire:model='images'
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                        placeholder="choose image" />
                </div>
                <script>
                    function imageUploader() {
                        return {
                            init() {
                                const input = document.getElementById('multiImageInput');
                                input.addEventListener('change', async (event) => {
                                    const files = Array.from(event.target.files);
                                    const compressedFiles = [];

                                    for (const file of files) {
                                        const compressed = await this.compressImage(file, 0.7);
                                        if (compressed) {
                                            console.log("Compressed:", compressed.name, compressed.size);
                                            compressedFiles.push(compressed);
                                        } else {
                                            console.warn("Skipping file due to compression error:", file.name);
                                        }
                                    }

                                    if (compressedFiles.length > 0) {
                                        const componentId = input.closest('[wire\\:id]').getAttribute('wire:id');
                                        const component = Livewire.find(componentId);
                                        console.log(componentId);
                                        component.uploadMultiple('images', compressedFiles,
                                            () => console.log("✅ Upload success"),
                                            () => console.error("❌ Upload failed")
                                        );
                                        Swal.fire({
                                            toast: true,
                                            position: 'top-end',
                                            icon: 'success',
                                            title: 'Images Compressed successfully',
                                            showConfirmButton: false,
                                            timer: 2000
                                        });
                                        // Livewire.dispatch('save');
                                    } else {
                                        console.error("❌ No files to upload after compression.");
                                    }
                                });
                            },

                            compressImage(file, quality = 0.7) {
                                return new Promise((resolve) => {
                                    const reader = new FileReader();
                                    reader.readAsDataURL(file);

                                    reader.onload = (event) => {
                                        const img = new Image();
                                        img.src = event.target.result;

                                        img.onload = () => {
                                            const canvas = document.createElement('canvas');
                                            canvas.width = img.width;
                                            canvas.height = img.height;

                                            const ctx = canvas.getContext('2d');
                                            ctx.drawImage(img, 0, 0);

                                            canvas.toBlob((blob) => {
                                                if (blob) {
                                                    const compressed = new File([blob], file.name, {
                                                        type: file.type,
                                                        lastModified: Date.now()
                                                    });
                                                    resolve(compressed);
                                                } else {
                                                    resolve(null); // Handle toBlob() returning null
                                                }
                                            }, file.type, quality);
                                        };

                                        img.onerror = () => {
                                            console.error("Error loading image:", file.name);
                                            resolve(null);
                                        };
                                    };

                                    reader.onerror = () => {
                                        console.error("Error reading file:", file.name);
                                        resolve(null);
                                    };
                                });
                            }
                        }
                    }
                </script>
            </div>

            <div class="w-full md:col-start-1 md:col-end-3">
                <label for="categories"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'categories' : 'الاصناف' }}</label>
                <div class="relative flex w-full">
                    <select id="categories" wire:model='form.categories' multiple placeholder="" wire:ignore
                        autocomplete="off" class="block w-full rounded-sm cursor-pointer focus:outline-none" multiple>
                        @foreach ($categories as $category)
                            <option value="{{ $category->id }}">
                                {{ session('lang') == 'en' ? $category->name_en : $category->name_ar }}
                            </option>
                        @endforeach

                    </select>
                </div>
                <script>
                    new TomSelect('#categories', {
                        maxItems: 10,
                    });
                </script>
            </div>


            <div class="w-full md:col-start-1 md:col-end-3">
                <label for="colors"
                    class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'colors' : 'الالوان' }}</label>
                <div class="relative flex w-full">
                    <select id="colors" wire:model='form.colors' multiple placeholder="" autocomplete="off"
                        class="block w-full rounded-sm cursor-pointer focus:outline-none" multiple>
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


    <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
        <div class="">
            <label for="description_en" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">
                {{ session('lang') == 'en' ? 'description en' : 'الوصف بالاجنبي' }}</label>
            <section>
                <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-700 d:border-gray-600">
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
                        <textarea id="description_en" rows="8" wire:model="form.description_en"
                            class="block w-full px-0 text-sm text-gray-800 bg-white border-0 d:bg-gray-800 focus:ring-0 d:text-white d:placeholder-gray-400"
                            placeholder=""></textarea>
                    </div>
                </div>
            </section>
        </div>
        <div class="">
            <label for="description_ar" class="block mb-2 text-sm font-medium text-gray-900 d:text-white">
                {{ session('lang') == 'en' ? 'description ar' : 'الوصف بالعربية' }}</label>
            <section>
                <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-700 d:border-gray-600">
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
                        <textarea id="description_ar" rows="8" wire:model="form.description_ar"
                            class="block w-full px-0 text-sm text-gray-800 bg-white border-0 d:bg-gray-800 focus:ring-0 d:text-white d:placeholder-gray-400"
                            placeholder="اكتب نص..."></textarea>
                    </div>
                </div>
            </section>


        </div>
    </div>
    </div>
    <div class="flex justify-end">
        <button type="submit"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{ session('lang') == 'en' ? 'save' : 'حفظ' }}</button>

    </div>
    {{-- @script
            <script>
                CKEDITOR.replace('description_ar');
            </script>
        @endscript --}}
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
