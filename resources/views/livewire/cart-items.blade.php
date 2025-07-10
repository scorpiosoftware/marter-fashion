<div class="w-full max-h-[500px] overflow-y-auto overflow-x-hidden">
    @if (session('cart'))
        @foreach (session('cart') as $id => $details)
            <div class="grid grid-cols-1 bg-white p-3 rounded-lg transition-all duration-500 hover:scale-95 mb-4 border">
                <div class="w-full flex items-center gap-4">
                    <img class="w-12" src="{{ URL::to('storage/'.$details['photo']) }}" alt="">
                    <a href="#"
                        class="truncate text-sm font-semibold leading-none text-black text-wrap hover:underline">{{ $details['name'] }}</a>
       
                </div>
                <p class="mt-0.5 truncate text-sm font-normal text-black">
                    د.ع {{ $details['price'] }}</p>
                <div class="flex items-end justify-end gap-6">
                    <p class="text-sm font-normal leading-none text-black">{{session('lang') == 'en' ? 'QTY' : 'عدد'}} : 
                        {{ $details['quantity'] }}</p>
                    <div class="">
                        <button wire:click='removeItem({{ $id }})' data-tooltip-target="tooltipRemoveItem1a"
                            class="text-red-600 hover:text-red-700 dark:text-red-500 dark:hover:text-red-600">
                            <span class="sr-only"> {{session('lang') == 'en' ? 'Remove' : 'حذف'}}  </span>
                            <svg class="h-4 w-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                fill="currentColor" viewBox="0 0 24 24">
                                <path fill-rule="evenodd"
                                    d="M2 12a10 10 0 1 1 20 0 10 10 0 0 1-20 0Zm7.7-3.7a1 1 0 0 0-1.4 1.4l2.3 2.3-2.3 2.3a1 1 0 1 0 1.4 1.4l2.3-2.3 2.3 2.3a1 1 0 0 0 1.4-1.4L13.4 12l2.3-2.3a1 1 0 0 0-1.4-1.4L12 10.6 9.7 8.3Z"
                                    clip-rule="evenodd" />
                            </svg>
                        </button>
                        <div id="tooltipRemoveItem1a" role="tooltip"
                            class="tooltip invisible absolute z-10 inline-block rounded-lg bg-gray-900 px-3 py-2 text-sm font-medium text-white opacity-0 shadow-sm transition-opacity duration-300 dark:bg-gray-700">
                            {{session('lang') == 'en' ? 'Remove item' : 'حذف'}}
                            <div class="tooltip-arrow" data-popper-arrow></div>
                        </div>
                    </div>

                </div>
            </div>
        @endforeach
    @endif
    @if (!empty(session('cart')))
    <div class="pt-10">
        <a href="{{ route('cart.show') }}"
            class="mb-2 inline-flex items-center justify-center w-full rounded-lg border-2 border-transparent text-white bg-[#9e01a1] px-5 py-2.5 text-sm font-medium transition-colors duration-300 ease-in-out focus:outline-none focus:ring-4 focus:ring-primary-300">
               {{session('lang') == 'en' ? 'Proceed to Checkout' : 'المتابعة للدفع'}}
        </a>
    </div>

    @else
        <div class="w-full mx-auto text-center pt-10">
            <span class="text-black">{{session('lang') == 'en' ? 'No items in your cart!' : 'لا يوجد أي عناصر في سلة التسوق الخاصة بك!'}}</span>
        </div>
        <div class="mt-4 w-full mx-auto flex justify-center">
            <a href="{{ route('filter.products') }}"
                class="p-2 text-sm border-2 rounded-full bg-white text-black hover:bg-[#388f8f] focus:outline-none focus:ring-2 focus:ring-[#388f8f] transition-colors duration-300 ease-in-out underline">
                {{session('lang') == 'en' ? 'Continue shopping' : 'مواصلة التسوق'}}
            </a>
        </div>
    @endif
</div>
