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
    <div class="relative m-4 md:flex md:justify-between md:items-center">
        <div class="md:flex grid grid-cols-1">
            <a href="{{ route('product.create') }}"> <button type="button"
                    class="focus:outline-none shadow-lg text-white bg-green-400 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 d:bg-green-600 d:hover:bg-green-700 d:focus:ring-green-800">
                    {{session('lang') == 'en' ? 'create' : 'انشاء'}}</button></a>
            <div>
                <form action="{{ route('product.index', 'search') }}" class="w-full max-w-md " method="GET">
                    <select id="status" onchange="this.form.submit()" name="status" 
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500">
                        <option value="in_stock" @if (!empty($inputs['status']) and $inputs['status'] == 'in_stock') selected @endif>{{session('lang') == 'en' ? 'Available' : 'متوفر'}}</option>
                        <option value="out_of_stock" @if (!empty($inputs['status']) and $inputs['status'] == 'out_of_stock') selected @endif>{{session('lang') == 'en' ? 'out of stock' : 'غير متوفر'}}</option>
                    </select>
                </form>

            </div>
        </div>




        <form action="{{ route('product.index', 'search') }}" class="w-full max-w-md " method="GET">
            @csrf
            @method('GET')
            <label for="search" class="mb-2 text-sm font-medium text-gray-900 sr-only d:text-white">Search</label>
            <div class="relative">
                <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                    <svg class="w-4 h-4 text-gray-500 d:text-gray-400" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                </div>
                <input type="search" id="search" name="search"
                    value="@if (!empty($inputs['search'])) {{ $inputs['search'] }} @endif"
                    class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="..." />
                <button type="submit"
                    class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{session('lang') == 'en' ? 'search' : 'بحث'}}</button>
            </div>
        </form>



    </div>

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase text-nowrap bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'image' : 'الصورة الرئيسية'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'code' : 'الرمز التعريف'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'name en' : 'الاسم الاجنبي'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'name ar' : 'الاسم العربي'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'quantity' : 'الكمية'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'price' : 'السعر'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'offer price' : 'سعر بعد الحسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'status' : 'الحالة'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="">{{session('lang') == 'en' ? 'tools' : 'الادوات'}}</span>
                    </th>

                </tr>
            </thead>
            <tbody>
                @foreach ($records as $record)
                    <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">
                        <th scope="row"
                            class="p-2  text-gray-900 whitespace-nowrap w-32 transition-all delay-0 hover:scale-110 d:text-white">
                            <img src="{{ URL::to('storage/' . $record->main_image_url) }}" alt=""
                                class="rounded-sm  shadow-lg ">
                        </th>

                        <td class="px-6 py-4 font-extrabold text-black text-base">
                            {{ $record->code }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->name_en }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->name_ar }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->stock_quantity }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->price }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->offer_price }}
                        </td>
                        <td class="px-6 py-4 text-base">
                            {{ $record->status }}
                        </td>
                        <td class="px-6 py-24 text-center flex justify-between items-center  space-x-4">
                            <a href="{{ route('product.show', $record->id) }}"
                                class="font-medium text-blue-600 d:text-blue-500 hover:underline">{{session('lang') == 'en' ? 'show' : 'عرض'}}</a>
                            <a href="{{ route('product.edit', $record->id) }}"
                                class="font-medium text-blue-600 d:text-blue-500 hover:underline">{{session('lang') == 'en' ? 'edit' : 'تعديل'}}</a>

                            <form action="{{ route('product.destroy', $record->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button class=" text-red-600 hover:text-red-700">{{session('lang') == 'en' ? 'delete' : 'حذف'}}</button>
                            </form>
                        </td>


                    </tr>
                @endforeach


            </tbody>
        </table>


        <nav aria-label="Page navigation example" class="p-4">
            {{ $records->links() }}

        </nav>
    </div>
</x-app-layout>
