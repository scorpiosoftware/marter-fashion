<div>
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase text-nowrap bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3 ">
                        {{session('lang') == 'en' ? 'Full name' : 'الاسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'email' : 'البريد الالكتروني'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'Subject' : 'العنوان'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'Comment' : 'التعليق'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="">{{session('lang') == 'en' ? 'Actions' : 'تعديل'}}</span>
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($records as $record)
                    <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">
                        <td class="px-6 py-4 font-bold text-black text-base text-nowrap">
                            {{ $record->name }}
                        </td>
                        <td class="px-6 py-4  text-black text-base text-nowrap">
                            {{ $record->email }}
                        </td>
                        <td class="px-6 py-4  overflow-x-auto text-black text-base text-nowrap">
                            {{ $record->subject }}
                        </td>
                        <td class="px-6 py-4  overflow-x-auto text-black text-base text-nowrap">
                            {{ $record->comment }}
                        </td>
                        <td class="px-6 py-6 flex justify-start items-center">
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
