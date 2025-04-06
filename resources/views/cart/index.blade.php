@extends('layouts.home')
@section('content')
    @if (session('cart'))
        <section class="bg-white py-8 antialiased dark:bg-gray-900 md:py-16">
            <div class="mx-auto max-w-screen-xl px-4 2xl:px-0">
                <h2 class="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl"> {{ \App\Helpers\TranslationHelper::translate('Shopping Cart','ar') }}</h2>
                <div class="mt-6 sm:mt-8 md:gap-6 lg:flex lg:items-start xl:gap-8">

                    {{-- Items Side Left --}}

                    <div class="mx-auto w-full flex-none lg:max-w-2xl xl:max-w-4xl">
                        <div class="space-y-6">
                            {{-- items components --}}
                            @foreach (session('cart') as $id => $details)
                                <div
                                    class="rounded-lg border border-gray-200 bg-white p-4 shadow-sm dark:border-gray-700 dark:bg-gray-800 md:p-6">
                                    <div class="space-y-4 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
                                        <a href="#" class="shrink-0 md:order-1">
                                            <img class="box-content object-cover size-60 mx-auto transition-all delay-0 hover:scale-95 dark:hidden"
                                                src="{{ URL::to('storage/' . $details['photo']) }}" alt="imac image" />
                                        </a>

                                        {{-- <label for="counter-input" class="sr-only">Choose quantity:</label> --}}
                                        <div class="flex items-center justify-between md:order-3 md:justify-end">
                                            {{-- <div class="flex items-center">
                                                <a href="{{ route('cart.decrease', $id) }}"
                                                    class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700">
                                                    <svg class="h-2.5 w-2.5 text-gray-900 dark:text-white"
                                                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                                        viewBox="0 0 18 2">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2" d="M1 1h16" />
                                                    </svg>
                                                </a>
                                                <form action="{{ route('cart.add', $id) }}" method="GET">
                                                    @csrf
                                                    @method('GET')
                                                    <input type="text" id="counter-input" data-input-counter
                                                        class="w-10 shrink-0 border-0 bg-transparent text-center text-sm font-medium text-gray-900 focus:outline-none focus:ring-0 dark:text-white"
                                                        placeholder="" onchange="this.form.submit()" name="qty"
                                                        value="{{ $details['quantity'] }}" required />
                                                </form>
                                                <a href="{{ route('cart.add', $id) }}"
                                                    class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-md border border-gray-300 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700">
                                                    <svg class="h-2.5 w-2.5 text-gray-900 dark:text-white"
                                                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                                        viewBox="0 0 18 18">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16" />
                                                    </svg>
                                                </a>
                                            </div> --}}
                                            <div class="text-end md:order-4 md:w-32">
                                                <p class="text-base font-bold text-gray-900 dark:text-white">
                                                    د.ع {{ $details['price'] }}</p>
                                            </div>
                                        </div>

                                        <div class="w-full min-w-0 flex-1 space-y-4 md:order-2 md:max-w-md">
                                            <div class="flex justify-start items-center space-x-2">
                                                <a href="#"
                                                class="text-base font-medium text-gray-900 hover:underline dark:text-white">{{ $details['name'] }}</a>
                                                <div class="px-2 py-2 rounded-full border box-border size-6" style="background-color: {{$details['color']->hex_code}};"></div>
                                            </div>

                                            <div class="flex items-center gap-4">
                                                <button type="button"
                                                    class="inline-flex items-center text-sm font-medium text-gray-500 hover:text-gray-900 hover:underline dark:text-gray-400 dark:hover:text-white">
                                                    <svg class="me-1.5 h-5 w-5" aria-hidden="true"
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        fill="none" viewBox="0 0 24 24">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2"
                                                            d="M12.01 6.001C6.5 1 1 8 5.782 13.001L12.011 20l6.23-7C23 8 17.5 1 12.01 6.002Z" />
                                                    </svg>
                                                    {{ \App\Helpers\TranslationHelper::translate('Add to Favorites','ar') }}
                                                </button>
                                                <form action="{{ route('cart.remove', $id) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit"
                                                        class="inline-flex items-center text-sm font-medium pt-2 text-red-600 hover:underline dark:text-red-500">
                                                        <svg class="me-1.5 h-5 w-5" aria-hidden="true"
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            fill="none" viewBox="0 0 24 24">
                                                            <path stroke="currentColor" stroke-linecap="round"
                                                                stroke-linejoin="round" stroke-width="2"
                                                                d="M6 18 17.94 6M18 18 6.06 6" />
                                                        </svg>
                                                        {{ \App\Helpers\TranslationHelper::translate('Remov','ar') }}
                                                    </button>

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach


                        </div>

                    </div>

                    {{-- Right Side --}}
                    <div class="mx-auto mt-6 max-w-4xl flex-1 space-y-6 lg:mt-0 lg:w-full">
                        <div
                            class="space-y-4 rounded-lg border border-gray-200 bg-white p-4 shadow-sm dark:border-gray-700 dark:bg-gray-800 sm:p-6">
                            <p class="text-xl font-semibold text-gray-900 dark:text-white">{{ \App\Helpers\TranslationHelper::translate('Order summary','ar') }}</p>

                            <div class="space-y-4">
                                <div class="space-y-2">
                                    <dl class="flex items-center justify-between gap-4">
                                        {{-- <dt class="text-base font-normal text-gray-500 dark:text-gray-400">Original price
                                        </dt>
                                        <dd class="text-base font-medium text-gray-900 dark:text-white">$7,592.00</dd> --}}
                                    </dl>

                                    <dl class="flex items-center justify-between gap-4">
                                        {{-- <dt class="text-base font-normal text-gray-500 dark:text-gray-400">Savings</dt>
                                        <dd class="text-base font-medium text-green-600">-$299.00</dd> --}}
                                    </dl>

                                    <dl class="flex items-center justify-between gap-4">
                                        {{-- <dt class="text-base font-normal text-gray-500 dark:text-gray-400">Store Pickup</dt>
                                        <dd class="text-base font-medium text-gray-900 dark:text-white">$99</dd> --}}
                                    </dl>

                                    <dl class="flex items-center justify-between gap-4">
                                        {{-- <dt class="text-base font-normal text-gray-500 dark:text-gray-400">Tax</dt>
                                        <dd class="text-base font-medium text-gray-900 dark:text-white">$799</dd> --}}
                                    </dl>
                                </div>

                                <dl
                                    class="flex items-center justify-between gap-4 border-t border-gray-200 pt-2 dark:border-gray-700">
                                    <dt class="text-base font-bold text-gray-900 dark:text-white"> {{ \App\Helpers\TranslationHelper::translate('Total','ar') }} </dt>
                                    <dd class="text-base font-bold text-gray-900 dark:text-white">د.ع {{ $totale }}</dd>
                                </dl>
                            </div>

                            <a href="{{ route('address') }}"
                                class="flex w-full items-center justify-center rounded-lg bg-green-400 border-2 px-5 py-2.5 text-sm font-medium text-white  focus:outline-none focus:ring-4">{{ \App\Helpers\TranslationHelper::translate('Confirm the order','ar') }}</a>

                            <div class="flex items-center justify-center gap-2">
                                <span class="text-sm font-normal text-gray-500 dark:text-gray-400"> {{ \App\Helpers\TranslationHelper::translate('or','ar') }} </span>
                                <a href="{{route('filter.products')}}" title=""
                                    class="inline-flex items-center gap-2 text-sm font-medium text-black underline hover:no-underline">
                                     {{ \App\Helpers\TranslationHelper::translate('Continue Shopping','ar') }}
                                    <svg class="h-5 w-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                        fill="none" viewBox="0 0 24 24">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="M19 12H5m14 0-4 4m4-4-4-4" />
                                    </svg>
                                </a>
                            </div>
                        </div>

                        {{-- <div
                            class="space-y-4 rounded-lg border border-gray-200 bg-white p-4 shadow-sm dark:border-gray-700 dark:bg-gray-800 sm:p-6">
                            <form class="space-y-4">
                                <div>
                                    <label for="voucher"
                                        class="mb-2 block text-sm font-medium text-gray-900 dark:text-white"> Do you have a
                                        voucher or gift card? </label>
                                    <input type="text" id="voucher"
                                        class="block w-full rounded-lg  border-gray-300 bg-white border-2 p-2.5 text-sm text-black"
                                        placeholder="" required />
                                </div>
                                <button type="submit"
                                    class="flex w-full items-center justify-center rounded-lg bg-white px-5 py-2.5 text-sm font-medium text-black border-2  focus:outline-none focus:ring-4">Apply
                                    Code</button>
                            </form>
                        </div> --}}
                    </div>
                </div>
            </div>
        </section>
    @endif
@endsection
