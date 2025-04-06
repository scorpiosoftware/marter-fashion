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
            {{session('lang') == 'en' ? 'Product Views' : 'عرض المنتجات'}}
        </h1>
    </div>
    <div class="relative m-4 md:flex justify-between items-center">
        <a href="{{ route('productView.create') }}"> <button type="button"
                class="focus:outline-none shadow-lg text-white bg-green-400 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 d:bg-green-600 d:hover:bg-green-700 d:focus:ring-green-800">
                {{session('lang') == 'en' ? 'create' : 'انشاء'}}</button></a>

        <form action="{{ route('productView.index', 'search') }}" class="w-full max-w-md " method="GET">
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
                        {{session('lang') == 'en' ? 'name' : 'الاسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'category' : 'التصنيف'}}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'section' : 'القسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'branch' : 'الفرع'}}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'selected' : 'معروض'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="">{{session('lang') == 'en' ? 'actions' : 'اعدادات'}}</span>
                    </th>

                </tr>
            </thead>
            <tbody>
                @foreach ($records as $record)
                    <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">
                        <th scope="row" class="p-2 text-gray-900  d:text-white">
                            {{ $record->name }}
                        </th>

                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                            {{ $record->category->name_en }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                            {{ $record->section->name }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                            {{ $record->branch->name }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base ">
                            <p class="w-10 text-center font-bold rounded-full cursor-pointer {{ $record->selected == 1 ? 'bg-green-400 text-white' : 'bg-red-400' }}">    {{ $record->selected == 1 ? 'On' : 'Off' }}</p>
                        
                        </td>
                        <td class="px-6 py-3 text-right flex justify-start items-center space-x-4">
                            <a href="{{ route('productView.edit', $record->id) }}"
                                class="font-medium text-blue-600 d:text-blue-500 hover:underline">{{session('lang') == 'en' ? 'Edit' : 'تعديل'}}</a>

                            <form action="{{ route('productView.destroy', $record->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button class=" text-red-600 hover:text-red-700">{{session('lang') == 'en' ? 'Delete' : 'حذف'}}</button>
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
