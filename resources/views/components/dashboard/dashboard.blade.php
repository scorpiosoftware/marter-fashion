<nav class="fixed top-0 z-50 w-full bg-[#ec5793] border-b border-gray-200 d:bg-gray-800 d:border-gray-700">
    <div class="px-3 py-3 lg:px-5 lg:pl-3">
        <div class="flex items-center justify-between">
            <div class="flex items-center justify-start rtl:justify-end">
                <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar"
                    type="button"
                    class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 d:text-gray-400 d:hover:bg-gray-700 d:focus:ring-gray-600">
                    <span class="sr-only">Open sidebar</span>
                    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" fill-rule="evenodd"
                            d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z">
                        </path>
                    </svg>
                </button>
                {{-- <a href="/" class="flex ms-2 md:me-24">
                    <img src="/media/logo/logo.png" class="h-10 me-3" alt="FlowBite Logo" />
                </a> --}}
                <!-- Logo Section -->
                <div class="flex items-center gap-8 rounded-md bg-white text-[#ec5793] font-serif p-2 transition-all delay-75 hover:scale-90 wowDiv" data-animation="animate__backInLeft" data-delay="800">
                    <a href="/" class="flex items-center gap-2 group">
                        <span
                            class="text-xl font-bold tracking-tight   transition-colors">
                            {{ env('APP_NAME') }}
                        </span>
                    </a>
                </div>
            </div>
            <livewire:language>
            {{-- Profile DropDown --}}
            <div class="flex items-center">
                <div class="flex items-center ms-3">
                    <div>
                        <button type="button"
                            class="flex text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-300 d:focus:ring-gray-600"
                            aria-expanded="false" data-dropdown-toggle="dropdown-user">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-8 h-8 rounded-full"
                                src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="user photo">
                        </button>
                    </div>
                    <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded shadow d:bg-gray-700 d:divide-gray-600"
                        id="dropdown-user">
                        <div class="px-4 py-3" role="none">
                            <p class="text-sm text-gray-900 d:text-white" role="none">
                                {{ Auth::user()->name }}
                            </p>
                            <p class="text-sm font-medium text-gray-900 truncate d:text-gray-300" role="none">
                                {{ Auth::user()->email }}
                            </p>
                        </div>
                        <ul class="py-1" role="none">
                            <li>
                                <a href="{{ route('dashboard.index') }}"
                                    class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 d:text-gray-300 d:hover:bg-gray-600 d:hover:text-white"
                                    role="menuitem">{{session('lang') == 'en' ? 'Dashboard' : 'احداثيات'}}</a>
                            </li>
                            <li>
                                <a href="{{ route('profile.edit', Auth::user()->id) }}"
                                    class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 d:text-gray-300 d:hover:bg-gray-600 d:hover:text-white"
                                    role="menuitem">{{session('lang') == 'en' ? 'Settings' : 'اعدادات'}}</a>
                            </li>
                            <li class="">
                                <form action="{{ route('logout') }}" method="POST" class="">
                                    @csrf
                                    @method('POST')
                                    <button
                                        class="block px-4 py-2 text-sm w-full text-start text-gray-700 hover:bg-gray-100 d:text-gray-300 d:hover:bg-gray-600 d:hover:text-white"
                                        role="menuitem">{{session('lang') == 'en' ? 'Sign out' : 'تسجيل خروج'}}</button>
                                </form>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
{{-- Dashboard SideBar --}}
<aside id="logo-sidebar"
    class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full bg-[#ec5793] border-r border-gray-200 sm:translate-x-0 d:bg-gray-800 d:border-gray-700"
    aria-label="Sidebar">
    <div class="h-full px-3 pb-4 overflow-y-auto bg-[#ec5793] d:bg-gray-800">
        <ul class="space-y-2 font-medium text-[#ec5793]">
            <li class="bg-white rounded-lg">
                <a href="{{ route('dashboard.index') }}"
                    class="flex items-center p-2  rounded-lg d:text-white hover:bg-gray-100 d:hover:bg-gray-700 group">
                    <svg class="w-5 h-5  transition duration-75 d:text-gray-400 "
                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                        <path
                            d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" />
                        <path
                            d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z" />
                    </svg>
                    <span class="ms-3">{{session('lang') == 'en' ? 'Dashboard' : 'احداثيات'}}</span>
                </a>
            </li>
            <li class="bg-white rounded-lg">
                <a href="{{ route('carousel.index') }}"
                    class="flex items-center p-2  rounded-lg hover:bg-gray-100 d:hover:bg-gray-700 group">
                    <svg class="w-6 h-6" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                        viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m3 16 5-7 6 6.5m6.5 2.5L16 13l-4.286 6M14 10h.01M4 19h16a1 1 0 0 0 1-1V6a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Z" />
                    </svg>

                    <span class="ms-3">{{session('lang') == 'en' ? 'Carousel' : 'قائمة الصور'}}</span>
                </a>
            </li>
            <li class="bg-white rounded-lg">
                <a href="{{ route('inbox.index') }}"
                    class="flex items-center p-2 rounded-lg hover:bg-gray-100 group">
                    <svg class="w-6 h-6  d:text-white" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                        viewBox="0 0 24 24">
                        <path fill-rule="evenodd"
                            d="M5.024 3.783A1 1 0 0 1 6 3h12a1 1 0 0 1 .976.783L20.802 12h-4.244a1.99 1.99 0 0 0-1.824 1.205 2.978 2.978 0 0 1-5.468 0A1.991 1.991 0 0 0 7.442 12H3.198l1.826-8.217ZM3 14v5a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-5h-4.43a4.978 4.978 0 0 1-9.14 0H3Z"
                            clip-rule="evenodd" />
                    </svg>

                    <span class="ms-3">{{session('lang') == 'en' ? 'Inbox' : 'البريد'}}</span>
                </a>
            </li>
            <li class="bg-white rounded-lg">
                <a href="{{ route('productView.index') }}"
                    class="flex items-center p-2  rounded-lg  hover:bg-gray-100 group">
                    <svg class="w-5 h-5 transition duration-75 group-hover:text-gray-900 "
                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                        <path
                            d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" />
                        <path
                            d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z" />
                    </svg>
                    <span class="ms-3">{{session('lang') == 'en' ? 'Product Views' : 'عرض المنتجات'}}</span>
                </a>
            </li>
            <li class="bg-white rounded-lg">
                <button type="button"
                    class="flex items-center w-full p-2 text-base  transition duration-75 rounded-lg group hover:bg-gray-100"
                    aria-controls="dropdown-ecommerce" data-collapse-toggle="dropdown-ecommerce">
                    <svg class="flex-shrink-0 w-5 h-5 transition duration-75 group-hover:text-gray-900"
                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                        viewBox="0 0 18 21">
                        <path
                            d="M15 12a1 1 0 0 0 .962-.726l2-7A1 1 0 0 0 17 3H3.77L3.175.745A1 1 0 0 0 2.208 0H1a1 1 0 0 0 0 2h.438l.6 2.255v.019l2 7 .746 2.986A3 3 0 1 0 9 17a2.966 2.966 0 0 0-.184-1h2.368c-.118.32-.18.659-.184 1a3 3 0 1 0 3-3H6.78l-.5-2H15Z" />
                    </svg>
                    <span class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">{{session('lang') == 'en' ? 'Catalog' : 'قوائم التعديل'}}</span>
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="m1 1 4 4 4-4" />
                    </svg>
                </button>
                <ul id="dropdown-ecommerce" @if (Route::currentRouteName() == 'product.index' ||
                        Route::currentRouteName() == 'product.create' ||
                        Route::currentRouteName() == 'product.edit') data-accordion = "open" @endif
                    class="hidden py-2 space-y-2">
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('storeSections.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">
                            {{session('lang') == 'en' ? 'Stores' : 'المتاجر'}}
                        </a>
                    </li>
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('branch.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Branches' : 'افرع المتجر'}}</a>
                    </li>
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('category.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Categories' : 'التصنيفات'}}</a>
                    </li>

                    <li class="bg-white rounded-lg">
                        <a href="{{ route('brand.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Brands' : 'العلامات التجارية'}}</a>
                    </li>
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('color.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Colors' : 'الالوان'}}</a>
                    </li>
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('product.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Products' : 'المنتجات'}}</a>
                    </li>
                    <li class="bg-white rounded-lg">
                        <a href="{{ route('order.index') }}"
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 d:text-white d:hover:bg-gray-700">{{session('lang') == 'en' ? 'Orders' : 'الطلبات'}}</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</aside>
