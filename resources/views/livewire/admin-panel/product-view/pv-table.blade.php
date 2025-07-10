<div>
    <div class="flex justify-between items-center p-2">
        <a href="{{ route('productView.create') }}" wire:navigate> <button type="button"
                class="focus:outline-none shadow-lg text-white bg-green-400 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 d:bg-green-600 d:hover:bg-green-700 d:focus:ring-green-800">
                {{ session('lang') == 'en' ? 'create' : 'انشاء' }}</button></a>
        <div class="w-1/4 mb-2">
            <label for="search" class="mb-2 text-sm font-medium text-gray-900 sr-only d:text-white">Search</label>
            <div class="relative">
                <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                    <svg class="w-4 h-4 text-gray-500 d:text-gray-400" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                </div>
                <input type="search" id="search" wire:model.live='search'
                    value="@if (!empty($inputs['search'])) {{ $inputs['search'] }} @endif"
                    class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="..." />

            </div>
        </div>
    </div>

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase text-nowrap bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3 ">
                        {{ session('lang') == 'en' ? 'name' : 'الاسم' }}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{ session('lang') == 'en' ? 'category' : 'التصنيف' }}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{ session('lang') == 'en' ? 'section' : 'القسم' }}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{ session('lang') == 'en' ? 'branch' : 'الفرع' }}
                    </th>
                    <th scope="col" class="px-6 py-3 ">
                        {{ session('lang') == 'en' ? 'selected' : 'معروض' }}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="">{{ session('lang') == 'en' ? 'actions' : 'اعدادات' }}</span>
                    </th>

                </tr>
            </thead>
            <tbody class="">
                @foreach ($records as $record)
                    <tr class="bg-white border-b  d:bg-gray-800 d:border-gray-700">
                        <th scope="row" class="p-4 text-gray-900  d:text-white">
                            {{ session('lang') == 'en' ? $record->name : $record->name_ar }}
                        </th>

                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                            {{ session('lang') == 'en' ? $record->category->name_en : $record->category->name_ar }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                             {{ session('lang') == 'en' ? $record->section->name : $record->section->name_ar }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base">
                            {{ session('lang') == 'en' ? $record->branch->name : $record->branch->name_ar }}
                        </td>
                        <td class="px-6 py-4  whitespace-nowrap text-black text-base ">
                            <p wire:click='changeStatus({{ $record->id }})'
                                class="w-10 text-center font-bold rounded-full cursor-pointer {{ $record->selected == 1 ? 'bg-green-400 text-white' : 'bg-red-400' }}">
                                {{ $record->selected == 1 ? 'On' : 'Off' }}</p>

                        </td>
                        <td class="py-6 flex justify-start items-center space-x-4">
                            <a href="{{ route('productView.edit', $record->id) }}" wire:navigate
                                class="font-medium text-blue-600 d:text-blue-500 hover:underline">{{ session('lang') == 'en' ? 'Edit' : 'تعديل' }}</a>
                            <button wire:click="$dispatch('confirmDelete', {{ $record->id }})"
                                class=" text-red-600 hover:text-red-700">{{ session('lang') == 'en' ? 'Delete' : 'حذف' }}</button>
                        </td>


                    </tr>
                @endforeach


            </tbody>
        </table>
        <nav aria-label="Page navigation example" class="p-4">
            {{ $records->links() }}
        </nav>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Livewire.on('confirmDelete', id => {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Livewire.dispatch('deleteConfirmed', {
                            id: id
                        });
                    }
                });
            });

            Livewire.on('recordDeleted', () => {
                Swal.fire(
                    'Deleted!',
                    'The record has been deleted.',
                    'success'
                );
            });

            Livewire.on('status-updated', () => {
                Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: 'Status changed successfully!',
                        showConfirmButton: false,
                        timer: 1500
                    }
                );
            });
        });
    </script>
</div>
