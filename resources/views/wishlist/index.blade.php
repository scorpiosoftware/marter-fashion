@extends('layouts.home')
@section('content')
    @if (session('wishlist'))
        <section class="bg-white py-8 antialiased dark:bg-gray-900 md:py-16">
            <div class="mx-auto max-w-screen-xl px-4 2xl:px-0">
                <h2 class="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl">Wishlist</h2>
                <div class="mt-6 sm:mt-8 md:gap-6 lg:flex lg:items-start xl:gap-8">
                    {{-- Items Side Left --}}
                    <div class="mx-auto w-full flex-none lg:max-w-2xl xl:max-w-4xl">
                        <div class="space-y-6">
                            {{-- items components --}}
                            @foreach (session('wishlist') as $id => $details)
                                <div
                                    class="rounded-lg border border-gray-200 bg-white p-4 shadow-sm dark:border-gray-700 dark:bg-gray-800 md:p-6">
                                    <div class="space-y-4 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
                                        <a href="#" class="shrink-0 md:order-1">
                                            <img class="h-20 w-20 transition-all delay-0 hover:scale-125 dark:hidden"
                                                src="{{ URL::to('storage/' . $details['photo']) }}" alt="imac image" />
                                            <img class="hidden h-20 w-20 dark:block"
                                                src="{{ URL::to('storage/' . $details['photo']) }}" alt="imac image" />
                                        </a>
                                        <div class="text-end md:order-4 md:w-32">
                                            <p class="text-base font-bold text-gray-900 dark:text-white">
                                                ${{ $details['price'] }}</p>
                                        </div>

                                        <div class="text-end md:order-4 md:w-32">
                                            <a href="{{ route('cart.add',$id) }}" class="text-base font-bold bg-white p-2 rounded-md text-black border-2 hover:text-gray-900">
                                               Add to cart</a>
                                        </div>
                                        <div class="w-full min-w-0 flex-1 space-y-4 md:order-2 md:max-w-md">
                                            <a href="{{ route('shop.show',$id) }}"
                                                class="text-base font-medium text-gray-900 hover:underline dark:text-white">{{ $details['name'] }}</a>
                                            <div class="flex items-center gap-4">
                                                <form action="{{ route('wishlist.destroy', $id) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit"
                                                        class="inline-flex items-center text-sm font-medium text-red-600 hover:underline dark:text-red-500">
                                                        <svg class="me-1.5 h-5 w-5" aria-hidden="true"
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            fill="none" viewBox="0 0 24 24">
                                                            <path stroke="currentColor" stroke-linecap="round"
                                                                stroke-linejoin="round" stroke-width="2"
                                                                d="M6 18 17.94 6M18 18 6.06 6" />
                                                        </svg>
                                                        Remove
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
@endsection
