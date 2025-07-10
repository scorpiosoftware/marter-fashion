<nav class="bg-[#ec5793] shadow-lg z-50 wowDiv nav-bar" id="wowDiv" data-animation="animate__fadeInDown"
    data-delay="300">
    <div class="max-w-screen-2xl px-4 mx-auto py-4">
        <div class="flex items-center justify-between gap-x-6">
            <div class="hidden md:block">
                <livewire:language>
            </div>
            <!-- Logo Section -->
            <div class="md:flex md:items-center mx-auto w-1/2 justify-center">
                <a href="/" class="flex items-center gap-2 group relative overflow-hidden bg-white backdrop-blur-sm rounded-lg px-4 py-2 shadow-sm">
                    @if (!isset($carousel->logo_url))
                        <div class="w-60 h-16 mx-auto overflow-hidden transition-all duration-300 hover:scale-105">
                            <img src="{{ asset('storage/' . $carousel->logo_url) }}" 
                                alt="{{ session('lang') == 'en' ? env('APP_NAME') : env('APP_NAME_AR') }}"
                                class="w-full h-full object-contain transform transition-transform duration-300 hover:scale-110"
                                loading="eager">
                        </div>
                    @else
                        <span class="text-2xl font-bold tracking-tight text-[#ec5793] transition-all duration-300 hover:text-purple-600">
                            {{ session('lang') == 'en' ? env('APP_NAME') : env('APP_NAME_AR') }}
                        </span>
                    @endif
                </a>
            </div>
            <!-- Mobile Menu Button -->
            <div>
                <div class="w-full mx-auto text-center ">
                    <button data-collapse-toggle="mobile-menu"
                        class="lg:hidden p-2.5  border-2  border-white rounded-lg w-full transition-colors">
                        <img class="w-6" src="{{ asset('media/icons/menu.png') }}" alt="">
                    </button>
                </div>
                <!-- Mobile Menu -->
            </div>

            {{-- Side Menu --}}
            <div x-data="{ open: false }" class="hidden md:flex justify-start items-start gap-x-4 ">
                <button @click="open = !open"
                    class=" p-2.5 bg-white transition-all duration-300 hover:scale-90  rounded-lg ">
                    {{-- <img class="w-6" src="{{ asset('media/icons/menu.png') }}" alt=""> --}}
                      <i class="fa fa-bars text-lg"></i>
                </button>
                <!-- Action Icons -->
                <div class="flex items-center gap-4 " x-cloak x-show="open"
                    x-transition:enter="transition ease-out duration-300"
                    x-transition:enter-start="opacity-0 transform -translate-y-2"
                    x-transition:enter-end="opacity-100 transform translate-y-0"
                    x-transition:leave="transition ease-in duration-200"
                    x-transition:leave-start="opacity-100 transform translate-y-0"
                    x-transition:leave-end="opacity-0 transform -translate-y-2">
                    <div>
                        <livewire:cart>
                    </div>

                    <a href="{{ route('wishlist.index') }}"
                        class="transition-all delay-75 hover:scale-90 p-2.5 bg-white rounded-full duration-200 focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#ec5793]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                        </svg>
                    </a>
                    <!-- User Dropdown Container -->
                    <div class="relative">
                        <button id="userDropdownButton" data-dropdown-toggle="userDropdown"
                            class="flex items-center gap-2 px-4 py-2 bg-white rounded-full 
                                   transition-colors duration-200 group focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#ec5793]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                            <span class="text-sm font-medium text-black">
                                @auth{{ Auth::user()->name }}
                            @else
                            {{ session('lang') == 'en' ? 'Account' : 'الحساب' }} @endauth
                        </span>
                        <svg class="w-4 h-4 text-[#ec5793] transition-colors" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M19 9l-7 7-7-7" />
                        </svg>
                    </button>
                    <!-- Dropdown Menu -->
                    <div id="userDropdown"
                        class="hidden absolute right-0 mt-2 w-48 bg-white text-black rounded-lg shadow-xl 
                border border-gray-200 divide-y divide-gray-100 z-50 origin-top-right p-2.5
                transition-opacity duration-200">
                        @guest
                            <div class="py-1 grid gap-y-2">
                                <a href="{{ route('login') }}"
                                    class="block px-4 py-2.5 text-sm border
                          transition-colors">
                                    {{ session('lang') == 'en' ? 'login' : 'تسجيل دخول' }}
                                </a>
                                <a href="{{ route('register') }}"
                                    class="block px-4 py-2.5 text-sm border
                          transition-colors">
                                    {{ session('lang') == 'en' ? 'sign up' : 'انشاء حساب' }}
                                </a>
                            </div>
                        @endguest

                        @auth
                            <div class="py-2 grid gap-y-2">
                                @if (Auth::user()->role_id == 1)
                                    <a href="{{ route('dashboard.index') }}"
                                        class="block px-4 py-2.5 text-sm bg-white text-black border
                          transition-colors">
                                        <i
                                            class="fas fa-tachometer-alt mr-2"></i>{{ session('lang') == 'en' ? 'Dashboard' : 'لوحة التحكم' }}
                                    </a>
                                @endif
                                <a href="#"
                                    class="block px-4 py-2.5 text-sm bg-white text-black border
                          transition-colors">
                                    <i
                                        class="fas fa-user-circle mr-2"></i>{{ session('lang') == 'en' ? 'Profile' : 'الملف الشخصي' }}
                                </a>
                            </div>
                            <div class="py-1">
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit"
                                        class="w-full text-left px-4 py-2.5 text-sm bg-white text-black border transition-colors">
                                        <i
                                            class="fas fa-sign-out-alt mr-2"></i>{{ session('lang') == 'en' ? 'Sign out' : 'تسجيل خروج' }}
                                    </button>
                                </form>
                            </div>

                        @endauth
                    </div>
                    </div>
            </div>
        </div>
    </div>
    <div id="mobile-menu" class="lg:hidden mt-4 hidden">
        <div class="pt-4 border-t border-gray-800">
            <!-- Search Form -->
            {{-- <form action="{{ route('filter.products') }}" method="POST"
                class="md:hidden flex flex-1 max-w-2xl  transition-all delay-75 hover:scale-90"
                data-animation="animate__bounceInDown" data-delay="100">
                @csrf
                <div class="relative w-full">
                    <input type="text" name="search" id="simple-search"
                        class="w-full pl-12 pr-4 py-3 bg-white border border-gray-700 rounded-lg 
                               text-[#ec5793] font-serif placeholder-gray-400 hover:placeholder-[#ec5793]
                                focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none focus:border-transparent transition-all "
                        placeholder=" {{ session('lang') == 'en' ? 'Search Products' : '... البحث عن المنتجات' }}" />
                    <div class="absolute inset-y-0 left-0 flex items-center pl-4">
                        <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>
                </div>
                <button type="submit"
                    class="ml-2 px-6 py-3 bg-white text-[#ec5793] font-serif 
                               rounded-lg transition-colors duration-200 shadow-sm  focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
                    {{ session('lang') == 'en' ? 'Search' : 'بحث' }}
                </button>
            </form> --}}
            <div x-data="{ open: false }" class=" md:flex justify-start items-start gap-x-4 ">
                <button @click="open = !open"
                    class=" p-2.5 bg-white transition-all w-full mx-auto duration-300 hover:scale-90  rounded-lg ">
                    <img class="w-6 mx-auto" src="{{ asset('media/icons/menu.png') }}" alt="">
                </button>
                <!-- Action Icons -->
                <div class="flex justify-center items-center gap-4 " x-cloak x-show="open"
                    x-transition:enter="transition ease-out duration-300"
                    x-transition:enter-start="opacity-0 transform -translate-y-2"
                    x-transition:enter-end="opacity-100 transform translate-y-0"
                    x-transition:leave="transition ease-in duration-200"
                    x-transition:leave-start="opacity-100 transform translate-y-0"
                    x-transition:leave-end="opacity-0 transform -translate-y-2">
                    <div>
                        <livewire:cart>
                    </div>

                    <a href="{{ route('wishlist.index') }}"
                        class="transition-all delay-75 hover:scale-90 p-2.5 bg-white rounded-full duration-200 focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#ec5793]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                        </svg>
                    </a>
                    <!-- User Dropdown Container -->
                    <div class="relative">
                        <button id="userDropdownButton1" data-dropdown-toggle="userDropdown1"
                            class="flex items-center gap-2 px-4 py-2 bg-white rounded-full 
                                   transition-colors duration-200 group focus:ring-2 focus:ring-[#5f9e9d] focus:outline-none">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#ec5793]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                            <span class="text-sm font-medium text-black">
                                @auth{{ Auth::user()->name }}
                            @else
                            {{ session('lang') == 'en' ? 'Account' : 'الحساب' }} @endauth
                        </span>
                        <svg class="w-4 h-4 text-[#ec5793] transition-colors" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M19 9l-7 7-7-7" />
                        </svg>
                    </button>
                    <!-- Dropdown Menu -->
                    <div id="userDropdown1"
                        class="hidden absolute right-0 mt-2 w-48 bg-white text-black rounded-lg shadow-xl 
                border border-gray-200 divide-y divide-gray-100 z-50 origin-top-right p-2.5
                transition-opacity duration-200">
                        @guest
                            <div class="py-1 grid gap-y-2">
                                <a href="{{ route('login') }}"
                                    class="block px-4 py-2.5 text-sm border
                          transition-colors">
                                    {{ session('lang') == 'en' ? 'login' : 'تسجيل دخول' }}
                                </a>
                                <a href="{{ route('register') }}"
                                    class="block px-4 py-2.5 text-sm border
                          transition-colors">
                                    {{ session('lang') == 'en' ? 'sign up' : 'انشاء حساب' }}
                                </a>
                            </div>
                        @endguest

                        @auth
                            <div class="py-2 grid gap-y-2">
                                @if (Auth::user()->role_id == 1)
                                    <a href="{{ route('dashboard.index') }}"
                                        class="block px-4 py-2.5 text-sm bg-white text-black border
                          transition-colors">
                                        <i
                                            class="fas fa-tachometer-alt mr-2"></i>{{ session('lang') == 'en' ? 'Dashboard' : 'لوحة التحكم' }}
                                    </a>
                                @endif
                                <a href="#"
                                    class="block px-4 py-2.5 text-sm bg-white text-black border
                          transition-colors">
                                    <i
                                        class="fas fa-user-circle mr-2"></i>{{ session('lang') == 'en' ? 'Profile' : 'الملف الشخصي' }}
                                </a>
                            </div>
                            <div class="py-1">
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit"
                                        class="w-full text-left px-4 py-2.5 text-sm bg-white text-black border transition-colors">
                                        <i
                                            class="fas fa-sign-out-alt mr-2"></i>{{ session('lang') == 'en' ? 'Sign out' : 'تسجيل خروج' }}
                                    </button>
                                </form>
                            </div>

                        @endauth
                    </div>
                    </div>
            </div>
        </div>
            <div class="md:hidden flex justify-center mt-4">
                <livewire:language>
            </div>
        </div>
    </div>

</div>
</nav>
