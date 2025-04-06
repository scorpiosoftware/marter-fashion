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
    <header class="border-b border-gray-200 bg-gray-50">
        <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
            <div class="flex flex-col items-start gap-4 md:flex-row md:items-center md:justify-between">
                <div>
                    <div class="py-6 group">
                        <h1
                            class="text-3xl md:text-3xl font-extrabold bg-clip-text text-black bg-gradient-to-r from-blue-500 to-purple-600 inline-block transition-all duration-300 transform group-hover:scale-105 group-hover:translate-y-[-2px]">
                            {{session('lang') == 'en' ? 'Branches' : 'الافرع'}}
                        </h1>
                    </div>

                    <p class="mt-1.5 text-sm text-gray-500">
                       
                    </p>
                </div>
                <div class="flex items-center gap-4">
                    <a href="/"
                        class="inline-flex items-center justify-center gap-1.5 rounded-sm border border-gray-200 bg-white px-5 py-3 text-gray-900 transition hover:text-gray-700 focus:ring-3 focus:outline-hidden"
                        type="button">
                        <span class="text-sm font-medium">  {{session('lang') == 'en' ? 'Visit Website' : 'زيارة الموقع'}}</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="size-4" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                        </svg>
                    </a>
                    <a href="{{ route('branch.create') }}"
                        class="inline-block rounded-sm bg-indigo-600 px-5 py-3 text-sm font-medium text-white transition hover:bg-indigo-700 focus:ring-3 focus:outline-hidden"
                        type="button">
                        {{session('lang') == 'en' ? 'create' : 'انشاء'}}
                    </a>
                </div>

            </div>
        </div>
    </header>
    <div class="relative m-4 md:flex justify-between items-center">
        <form action="{{ route('storeSections.index', 'search') }}" class="w-full max-w-md " method="GET">
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
                    class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 d:bg-blue-600 d:hover:bg-blue-700 d:focus:ring-blue-800">
                    {{session('lang') == 'en' ? 'search' : 'بحث'}}</button>
            </div>
        </form>
        <div>
            <select name="section_id" id="sectionDropdown">
                <option value="">{{session('lang') == 'en' ? 'All' : 'الكل'}}</option>
                @foreach ($sections as $section)
                    <option value="{{ $section->id }}">{{ $section->name }}</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg" id="branchesTable" style="display: none;">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase text-nowrap bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'name' : 'الاسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        {{session('lang') == 'en' ? 'section' : 'القسم'}}
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="">  {{session('lang') == 'en' ? 'Actions' : 'الاعدادات'}}</span>
                    </th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
        <script>
            $(document).ready(function() {
                $.ajax({
                    url: '/api/branches/',
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);
                        // Hide loading indicator
                        $('#loading').hide();
                        // Clear existing rows
                        $('#branchesTable tbody').empty();
                        // Append new rows with AJAX data
                        if (data.length > 0) {
                            $.each(data, function(key, branch) {
                                $('#branchesTable tbody').append(
                                    '<tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">' +
                                    '<td class="px-6 py-4 font-bold whitespace-nowrap text-black text-base">' +
                                    branch.name + '</td>' +
                                    '<td class="px-6 py-4 font-bold whitespace-nowrap text-black text-base">' +
                                    '<div class="bg-amber-50 flex justify-start items-start rounded-full border p-1 cursor-pointer">' +
                                    branch.section.name + '</div></td>' +
                                    '<td class="px-6 py-3 text-right flex justify-start items-center pt-[30px] space-x-4">' +
                                    "<a href='/dashboard/branch/" + branch.id +
                                    "/edit' class='font-medium border p-1 text-blue-600 hover:underline'> {{session('lang') == 'en' ? 'edit' : 'تعديل'}}</a>" +
                                    "<form action='branch/" + branch.id + "/delete" +
                                    "' method='POST'>" +
                                    '<input type="hidden" name="_token" value="' +
                                    $('meta[name="csrf-token"]').attr(
                                        'content') + '">' +
                                    '<input type="hidden" name="_method" value="DELETE">' +
                                    "<button type='submit' class='border p-1 text-red-600 hover:text-red-700'>{{session('lang') == 'en' ? 'delete' : 'حذف'}}</button>" +
                                    "</form>" +
                                    "</td>" +
                                    "</tr>"
                                );
                            });
                            $('#branchesTable').show();
                        } else {
                            $('#branchesTable tbody').append(
                                '<tr><td colspan="2">No branches found for this section.</td></tr>'
                            );
                            $('#branchesTable').show();
                        }
                    },
                    error: function() {
                        $('#loading').hide();
                        alert('Failed to fetch branches. Please try again.');
                    }
                });

                $('#sectionDropdown').on('change', function() {
                    var sectionId = $(this).val();
                    if (sectionId) {
                        // Show loading indicator
                        $('#loading').show();
                        $('#branchesTable').hide();
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
                                $('#branchesTable tbody').empty();
                                // Append new rows with AJAX data
                                if (data.length > 0) {
                                    $.each(data, function(key, branch) {
                                        $('#branchesTable tbody').append(
                                            '<tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">' +
                                            '<td class="px-6 py-4 font-bold whitespace-nowrap text-black text-base">' +

                                            branch.name + '</td>' +
                                            '<td class="px-6 py-4 font-bold whitespace-nowrap text-black text-base">' +
                                            '<div class="bg-amber-50 flex justify-start items-start rounded-full border p-1 cursor-pointer">' +
                                            branch.section.name + '</div></td>' +
                                            '<td class="px-6 py-3 text-right flex justify-start items-center pt-[30px] space-x-4">' +
                                            "<a href='/dashboard/branch/" + branch.id +
                                            "/edit' class='font-medium border p-1 text-blue-600 hover:underline'> {{session('lang') == 'en' ? 'edit' : 'تعديل'}}</a>" +
                                            "<form action='branch/" + branch.id +
                                            "/delete" +
                                            "' method='POST'>" +
                                            '<input type="hidden" name="_token" value="' +
                                            $('meta[name="csrf-token"]').attr(
                                                'content') + '">' +
                                            '<input type="hidden" name="_method" value="DELETE">' +
                                            "<button type='submit' class='border p-1 text-red-600 hover:text-red-700'>{{session('lang') == 'en' ? 'delete' : 'حذف'}}</button>" +
                                            "</form>" +
                                            "</td>" +
                                            "</tr>"
                                        );
                                    });
                                    $('#branchesTable').show();
                                } else {
                                    $('#branchesTable tbody').append(
                                        '<tr><td colspan="2">No branches found for this section.</td></tr>'
                                    );
                                    $('#branchesTable').show();
                                }
                            },
                            error: function() {
                                $('#loading').hide();
                                alert('Failed to fetch branches. Please try again.');
                            }
                        });
                    } else {
                        // Clear the table if no section is selected
                        $('#branchesTable tbody').empty();
                        $('#branchesTable').hide();
                    }
                });
            });
        </script>
    </div>
</x-app-layout>
