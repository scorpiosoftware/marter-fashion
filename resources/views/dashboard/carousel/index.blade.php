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
    <div class="text-2xl py-4 font-bold underline text-gray-900 d:text-white">{{session('lang') == 'en' ? 'Carousel' : 'قائمة الصور'}}</div>
    <!-- Breadcrumb -->
    <nav class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-800 d:border-gray-700"
        aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
                <a href="/dashboard"
                    class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 d:text-gray-400 d:hover:text-white">
                    <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                        fill="currentColor" viewBox="0 0 20 20">
                        <path
                            d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                    </svg>
                    {{session('lang') == 'en' ? 'Dashboard' : 'القائمة الرئيسية'}}
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
    <form class="pt-4" action="{{ route('carousel.update', $record->id) }}" enctype="multipart/form-data"
        method="POST">
        @csrf
        @method('PUT')
        <div class="grid gap-6 mb-6 md:grid-cols-1">
            <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2">
                <div class="grid grid-cols-1 gap-4 border-2 p-4 md:grid-cols-2 md:col-start-1 md:col-end-3">
                    {{-- <div class="w-full mt-2">
                        <div class="flex justify-between items-center">
                            <label for="logo_url"
                                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">Logo</label>
                        </div>
                        <div class="mt-4">
                            <input type="file" id="logo_url" name="logo_url"
                                value="{{ $record->logo_url }}"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                                placeholder="choose image" />
                        </div>

                    </div> --}}

                    <div class="w-full mt-2">
                        <div class="flex justify-between items-center">
                            <label for="images"
                                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{session('lang') == 'en' ? 'Images' : 'الصور'}}</label>
                        </div>
                        <div class="mt-4">
                            <input type="file" multiple id="images" name="images[]" value="{{ $record->images }}"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                                placeholder="choose image" />
                        </div>

                    </div>
                    <div class="flex justify-center items-center md:col-start-1 md:col-end-3">

                        <div aria-controls="gallery" data-collapse-toggle="gallery"
                            class="cursor-pointer transition-all w-full text-center bg-blue-300 container mx-auto delay-75 hover:scale-95">
                            {{session('lang') == 'en' ? 'Gallery' : 'البوم الصور'}}
                        </div>
                    </div>
                    <div id="gallery"
                        class="flex gap-4 w-full md:col-start-1 md:col-end-3">
                        {{-- Main Image --}}
                        <input class="hidden" type="text" name="image" value="{{ $record->logo_url }}">
                        @if (!empty($record->logo_url))
                        <div class="relative">
                            <img class="max-w-32 object-cover rounded-lg transition-all delay-100 hover:scale-105"
                                src="{{ URL::to('storage/' . $record->logo_url) }}" alt="">
                        </div> 
                        @endif
                        {{-- Other Images --}}
                        @foreach ($record->images as $image)
                        <div class="relative">
                            <img class="max-w-32 rounded-lg transition-all delay-100 hover:scale-105"
                                src="{{ URL::to('storage/' . $image->url) }}" alt="">
                        </div>
                        @endforeach
                    </div>
                </div>

            </div>
        </div>
        <button type="submit"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{session('lang') == 'en' ? 'Submit' : 'حفظ'}}</button>
    </form>
</x-app-layout>
