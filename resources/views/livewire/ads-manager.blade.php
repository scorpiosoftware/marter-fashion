<div class="p-6">
    <!-- Flash Message -->
    @if (session()->has('message'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('message') }}
        </div>
    @endif

    <!-- Header -->
    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
        <h1 class="text-2xl font-bold text-gray-800">{{ session('lang') == 'en' ? 'Ads Manager' : 'اعداد الاعلانات'}}</h1>
        
        <div class="flex flex-col sm:flex-row gap-3">
            <!-- Status Filter -->
            <select wire:model.live="filterStatus" 
                    class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                <option value="all">{{ session('lang') == 'en' ? 'All Ads' : 'جميع العلانات'}}</option>
                <option value="active">{{ session('lang') == 'en' ? 'Active Ads' : 'الاعلانات المفعلة'}}</option>
                <option value="inactive">{{ session('lang') == 'en' ? 'Disactive Ads' : 'الاعلانات المعطلة'}}</option>
            </select>
            
            <button wire:click="openModal" 
                    class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg whitespace-nowrap">
               {{ session('lang') == 'en' ? 'Add Advertise' : 'اضافة اعلان'}}
            </button>
        </div>
    </div>

    <!-- Ads Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @forelse($ads as $ad)
            <div class="bg-white rounded-lg shadow-md p-4 {{ !$ad->is_active ? 'opacity-75 border-2 border-red-200' : '' }}">
                <!-- Status Badge -->
                <div class="flex justify-between items-start mb-3">
                    <div>
                        <h3 class="text-lg font-semibold">Ad #{{ $ad->id }}</h3>
                        <p class="text-sm text-gray-600">{{ count($ad->images ?? []) }} image(s)</p>
                    </div>
                    <div class="flex items-center gap-2">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium {{ $ad->is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800' }}">
                            {{ $ad->is_active ?   (session('lang') == 'en' ? 'Active' : 'مفعل')  :   (session('lang') == 'en' ? 'Disabled' : 'معطل')  }}
                        </span>
                    </div>
                </div>

                <!-- Images Preview -->
                @if(!empty($ad->images))
                    <div class="grid grid-cols-2 gap-2 mb-4 max-h-44 overflow-auto">
                        @foreach($ad->images as $index => $image)
                            <div class="relative group">
                                <img src="{{ $image }}" alt="Ad Image" 
                                     class="w-full h-20 object-cover rounded">
                                <button wire:click="removeImageFromAd({{ $ad->id }}, {{ $index }})"
                                        class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs opacity-0 group-hover:opacity-100 transition-opacity">
                                    ×
                                </button>
                            </div>
                        @endforeach
                    </div>
                @endif

                <!-- Actions -->
                <div class="flex flex-col gap-2">
                    <div class="flex gap-2">
                        <button wire:click="openModal({{ $ad->id }})" 
                                class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded text-sm">
                           {{ session('lang') == 'en' ? 'add images' : 'اضافة صور'}}
                        </button>
                        <button wire:click="toggleAdStatus({{ $ad->id }})" 
                                class="flex-1 {{ $ad->is_active ? 'bg-black hover:bg-orange-600' : 'bg-green-600 hover:bg-green-600' }} text-white px-3 py-1 rounded text-sm">
                            {{ $ad->is_active ?  (session('lang') == 'en' ? 'Disable' : 'تعطيل')  :  (session('lang') == 'en' ? 'Enable' : 'تفعيل') }}
                        </button>
                    </div>
                    <button wire:click="deleteAd({{ $ad->id }})" 
                            wire:confirm="Are you sure you want to delete this ad?"
                            class="w-full bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded text-sm">
                        {{ session('lang') == 'en' ? 'delete' : 'حذف'}}
                    </button>
                </div>
            </div>
        @empty
            <div class="col-span-full text-center py-8">
                <p class="text-gray-500">{{ session('lang') == 'en' ? 'no ads available !' : 'لا يوجد اعلانات' }}</p>
            </div>
        @endforelse
    </div>

    <!-- Modal -->
    @if($showModal)
        <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50" 
             wire:click.self="closeModal">
            <div class="bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] overflow-hidden transform transition-all">
                <!-- Modal Header -->
                <div class="bg-gradient-to-r from-blue-600 to-purple-600 px-6 py-4">
                    <div class="flex justify-between items-center">
                        <h3 class="text-xl font-semibold text-white">
                            {{ (session('lang') == 'en' ? 'Add Images to Ad #': 'اضافة صور') }}
                        </h3>
                        <button wire:click="closeModal" 
                                class="text-white hover:text-gray-200 transition-colors p-1">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Modal Body -->
                <div class="p-6 overflow-y-auto max-h-[calc(90vh-140px)]">

                             <div class="mb-4">
                                <label for="title" class="block text-sm font-medium text-gray-700">العنوان <span class="text-red-500">*</span></label>
                                <input type="text" wire:model="title" id="title" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                @error('title') <span class="text-red-500 text-xs">{{ $message }}</span> @enderror
                               
                            </div>
                    <!-- File Upload Area -->
                    <div class="mb-6">
                        <label class="block text-sm font-medium text-gray-700 mb-3">
                           {{ session('lang') == 'en' ? 'Add Images to ad' : 'اضافة صور الاعلان' }}<span class="text-red-500">*</span>
                        </label>
                        
                        <!-- Custom File Upload Area -->
                        <div class="border-2 border-dashed border-gray-300 rounded-xl p-8 text-center hover:border-blue-400 transition-colors bg-gray-50">
                            <div class="mb-4">
                                <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                                    <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                            </div>
                            <input type="file" 
                                   wire:model="images" 
                                   multiple 
                                   accept="image/*"
                                   {{-- class="hidden" --}}
                                   class="absolute w-full h-full hidden top-0 left-0  bg-black"
                                   id="file-upload">
                            <label for="file-upload" class="cursor-pointer">
                                <span class="text-lg font-medium text-gray-700">{{ session('lang') == 'en' ? 'Click to upload images' : 'انقر هنا لرفع الصور' }}</span>
                                <p class="text-sm text-gray-500 mt-1">{{ session('lang') == 'en' ? 'or drag and drop' : 'او اسحب و ارمي هنا' }}</p>
                                <p class="text-xs text-gray-400 mt-2">PNG, JPG, GIF up to 2MB each</p>
                            </label>
                        </div>
                        
                        @error('images') 
                            <p class="text-red-500 text-sm mt-2 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                </svg>
                                {{ $message }}
                            </p>
                        @enderror
                        @error('images.*') 
                            <p class="text-red-500 text-sm mt-2 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                </svg>
                                {{ $message }}
                            </p>
                        @enderror
                    </div>

                    <!-- Loading State -->
                    <div wire:loading wire:target="images" class="mb-4">
                        <div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
                            <div class="flex items-center">
                                <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-blue-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                                <span class="text-blue-700 font-medium">{{ session('en') == 'en' ? 'Processing images ...' : 'جاري معالجة الصور...' }}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Image Previews -->
                    @if($images)
                        <div class="mb-6">
                            <h4 class="text-lg font-medium text-gray-800 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
                                </svg>
                                Selected Images ({{ count($images) }})
                            </h4>
                            <div class="flex justify-center items-center  mx-auto overflow-auto">
                                @foreach($images as $index => $image)
                                    <div class="relative group ">
                                        <div class="aspect-square rounded-lg overflow-hidden bg-gray-100 border-2 border-gray-200">
                                            <img src="{{ $image->temporaryUrl() }}" 
                                                 alt="Preview {{ $index + 1 }}" 
                                                 class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200">
                                        </div>
                                        <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-all duration-200 rounded-lg flex items-center justify-center">
                                            <div class="opacity-0 group-hover:opacity-100 transition-opacity">
                                                <span class="bg-white text-gray-800 px-2 py-1 rounded text-xs font-medium">
                                                    {{ $index + 1 }}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif
                </div>

                <!-- Modal Footer -->
                <div class="bg-gray-50 px-6 py-4 border-t ">
                    <div class="flex gap-3 justify-end">
                        <button wire:click="closeModal" 
                                class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-100 transition-colors font-medium">
                            {{ session('lang') == 'en' ? 'cancel' : 'تجاهل' }}
                        </button>
                        <button wire:click="saveAd" 
                                wire:loading.attr="disabled"
                                class="px-6 py-2 text-black bg-green-400 disabled:from-gray-400 disabled:to-gray-400  rounded-lg transition-all font-medium flex items-center">
                            <span wire:loading.remove wire:target="saveAd">
                                {{-- <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                </svg> --}}
                                {{session('lang') == 'en' ? 'save' : 'حفظ' }}
                            </span>
                            <span wire:loading wire:target="saveAd" class="flex items-center">
                                <svg class="animate-spin -ml-1 mr-2 h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                              
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    @endif
</div>