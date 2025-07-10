<div>
    <!-- Breadcrumb -->
    <nav class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 d:bg-gray-800 d:border-gray-700"
        aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
                <a href="{{ route('size.index') }}" wire:navigate
                    class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 d:text-gray-400 d:hover:text-white">
                    <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                        viewBox="0 0 20 20">
                        <path
                            d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                    </svg>
                    {{ session('lang') == 'en' ? 'Home' : 'القائمة الرئيسية' }}
                </a>
            </li>
            <li aria-current="page">
                <div class="flex items-center">
                    <svg class="rtl:rotate-180  w-3 h-3 mx-1 text-gray-400" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 9 4-4-4-4" />
                    </svg>
                    <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 d:text-gray-400">
                        {{ session('lang') == 'en' ? 'create' : 'انشاء' }}</span>
                </div>
            </li>
        </ol>
    </nav>
    {{-- End Breadcrumb  --}}
    <form wire:submit.prevent='save' class="mt-4">
        <div>
            <label for="name"
                class="block mb-2 text-sm font-medium text-gray-900 d:text-white">{{ session('lang') == 'en' ? 'name' : 'التسمية' }}</label>
            <div class="flex justify-start" x-data x-init="$refs.myInput.focus()">
                <input x-ref="myInput" type="text" id="name" wire:model='name'
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block  p-2.5 d:bg-gray-700 d:border-gray-600 d:placeholder-gray-400 d:text-white d:focus:ring-blue-500 d:focus:border-blue-500"
                    placeholder="" required />
                <button type="submit"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">{{ session('lang') == 'en' ? 'save' : 'حفظ' }}</button>
            </div>
        </div>

    </form>


    <div class="relative overflow-x-auto mt-2">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        {{ session('lang') == 'en' ? 'name' : 'التسمية' }}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{ session('lang') == 'en' ? 'action' : 'ادوات' }}
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($records as $record)
                    <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700 border-gray-200">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap d:text-white">
                            {{ $record->name }}
                        </th>
                        <td class="px-6 py-4 w-full ">
                            <div class="flex justify-start items-center space-x-4">
                                <button class="text-blue-600" wire:click='edit({{ $record->id }})'>
                                    {{ session('lang') == 'en' ? 'edit' : 'تعديل' }}</button>
                                <button class="text-red-600" wire:click='delete({{ $record->id }})'>
                                    {{ session('lang') == 'en' ? 'delete' : 'حذف' }}</button>
                            </div>

                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
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
        window.addEventListener('delete-error', (message) => {
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'error',
                title: 'Cannot Delete This Record.',
                showConfirmButton: false,
                timer: 2000
            });
        });
        window.addEventListener('record-deleted', (message) => {
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'success',
                title: 'Record deleted successfully !',
                showConfirmButton: false,
                timer: 2000
            });
        });
    </script>
</div>
