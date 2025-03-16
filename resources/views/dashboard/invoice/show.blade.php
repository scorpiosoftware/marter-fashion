<x-app-layout>
    <div class="relative overflow-x-auto">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Customer name
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Customer Email
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Phone
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Full Address
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Order Date
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700">
                    <th scope="row"
                        class="px-6 py-4 font-medium text-gray-900  text-nowrap whitespace-nowrap d:text-white">
                        {{ $record->customer_name }}
                    </th>
                    <td class="px-6 py-4 text-nowrap">
                        {{ $record->customer_email }}
                    </td>
                    <td class="px-6 py-4 text-nowrap">
                        {{ $record->phone }}
                    </td>
                    <td class="px-6 py-4 text-nowrap">
                        {{ $record->country }} - {{ $record->city }} - {{ $record->street }}
                    </td>
                    <td class="px-6 py-4 text-nowrap">
                        {{ $record->order_date }}
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 d:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 d:bg-gray-700 d:text-gray-400">
                <tr>
                    <th scope="col" class="px-16 py-3">
                        <span class="">Image</span>
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Product
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Qty
                    </th>
                    <th scope="col" class="px-6 py-3 text-nowrap">
                        Price
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($items as $item)
                    <tr class="bg-white border-b d:bg-gray-800 d:border-gray-700 hover:bg-gray-50 d:hover:bg-gray-600">
                        <td class="p-4 text-nowrap">
                            <img src="{{ URL::to('storage/' . $item->product->main_image_url) }}"
                                class="w-16 md:w-24 max-w-full max-h-full" alt="Apple Watch">
                        </td>
                        <td class="px-6 py-4 font-semibold text-nowrap text-gray-900 d:text-white">
                            {{ $item->product->name_en }}
                        </td>
                        <td class="px-6 py-4">
                            <div class="flex items-center text-nowrap">
                                {{ $item->quantity }}
                            </div>
                        </td>
                        <td class="px-6 py-4 font-semibold text-gray-900 text-nowrap d:text-white">
                            {{ $item->subtotal }} $
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="w-full flex justify-between items-start text-black font-bold px-10 py-2">
            <p>Status : {{ $record->status }}</p>
            <p>Total : {{ $record->total_amount }} $</p>

        </div>
    </div>


</x-app-layout>
