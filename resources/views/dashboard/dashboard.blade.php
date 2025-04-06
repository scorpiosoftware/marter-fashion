<x-app-layout>
    <div class="container mx-auto mt-10">
        <div class="py-6 group">
            <h1
                class="text-3xl md:text-3xl font-extrabold bg-clip-text text-black bg-gradient-to-r from-blue-500 to-purple-600 inline-block transition-all duration-300 transform group-hover:scale-105 group-hover:translate-y-[-2px]">
                {{-- {{ dd(App::getLocale())}} --}}
                {{session('lang') == 'en' ? 'Dashboard' : 'احداثيات'}}
            </h1>
        </div>
        <br>
        <br>
        <div class="flex flex-col md:flex-row justify-center overflow-auto">
            <div class="">
                <div class="flex md:flex-row space-x-8">
                    <div class="shadow-md p-4">
                        <div class="">
                            <div class="flex flex-col">
                                <div class="flex space-x-8 w-56">
                                    <div class="">
                                        <div class="uppercase text-sm text-gray-400">
                                            {{session('lang') == 'en' ? 'Applied Orders' : 'الطلبيات المنجزة'}}
                                        </div>
                                        <div class="mt-1">
                                            <div class="flex space-x-2 items-center">
                                                <div class="text-2xl">
                                                    {{ $applied_orders->count() }}
                                                </div>
                                                <div class="text-xs text-green-800 bg-green-200 rounded-md p-1">
                                                    +0.0%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <svg class="w-8 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shadow-md p-4">
                        <div class="">
                            <div class="flex flex-col">
                                <div class="flex space-x-8 w-56">
                                    <div class="">
                                        <div class="uppercase text-sm text-gray-400">
                                            {{session('lang') == 'en' ? 'Revenue' : 'المبيع'}}
                                        </div>
                                        <div class="mt-1">
                                            <div class="flex space-x-2 items-center">
                                                <div class="text-2xl">
                                                    د.ع {{ $revenue }}
                                                </div>
                                                <div class="text-xs text-red-500 bg-red-200 rounded-md p-1">
                                                    -0.0%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <svg class="w-8 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shadow-md p-4">
                        <div class="">
                            <div class="flex flex-col">
                                <div class="flex space-x-8 w-56">
                                    <div class="">
                                        <div class="uppercase text-sm text-gray-400">
                                            {{session('lang') == 'en' ? 'Unpaid' : 'الغير مدفوع'}}
                                        </div>
                                        <div class="mt-1">
                                            <div class="flex space-x-2 items-center">
                                                <div class="text-2xl">
                                                    د.ع {{ $unpaid }}
                                                </div>
                                                <div class="text-xs text-green-800 bg-green-200 rounded-md p-1">
                                                    +0.0%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <svg class="w-8 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shadow-md p-4">
                        <div class="">
                            <div class="flex flex-col">
                                <div class="flex space-x-8 w-56">
                                    <div class="">
                                        <div class="uppercase text-sm text-gray-400">
                                            {{session('lang') == 'en' ? 'Totales' : 'المجموع'}}
                                        </div>
                                        <div class="mt-1">
                                            <div class="flex space-x-2 items-center">
                                                <div class="text-2xl">
                                                    د.ع {{ $total }}
                                                </div>
                                                <div class="text-xs text-green-800 bg-green-200 rounded-md p-1">
                                                    +0.0%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <svg class="w-8 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container items-center px-4 py-8 m-auto mt-5">
            <form action="{{ route('dashboard.index') }}" method="get"
                class="flex items-center justify-start gap-x-4">
                @method('get')
                <div class="relative max-w-sm ml-2">
                    <div class="absolute inset-y-0 start-0 flex items-center ps-3.5 pointer-events-none">
                        <svg class="w-4 h-4 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 20 20">
                            <path
                                d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                        </svg>
                    </div>
                    <input datepicker id="default-datepicker" datepicker-format="yyyy-mm-dd" name="date"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-3"
                        placeholder="{{session('lang') == 'en' ? 'select date' : 'التاريخ'}}">
                </div>
                <div><button class="rounded-lg bg-white px-6 py-2 font-bold shadow-lg" type="submit">{{session('lang') == 'en' ? 'Apply' : 'بحث'}}</button>
                </div>
            </form>

            <div class="flex flex-wrap pb-3 mx-4 md:mx-24 lg:mx-0">
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class="px-4 py-4 bg-gray-300  rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:text-gray-50"
                                    viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M10.293 15.707a1 1 0 010-1.414L14.586 10l-4.293-4.293a1 1 0 111.414-1.414l5 5a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0z"
                                        clip-rule="evenodd" />
                                    <path fill-rule="evenodd"
                                        d="M4.293 15.707a1 1 0 010-1.414L8.586 10 4.293 5.707a1 1 0 011.414-1.414l5 5a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0z"
                                        clip-rule="evenodd" />
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $totalVisits }}</h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Total Visitors</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class="   rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                    viewBox="0 0 1024 1024" id="facebook">
                                    <path fill="#1877f2"
                                        d="M1024,512C1024,229.23016,794.76978,0,512,0S0,229.23016,0,512c0,255.554,187.231,467.37012,432,505.77777V660H302V512H432V399.2C432,270.87982,508.43854,200,625.38922,200,681.40765,200,740,210,740,210V336H675.43713C611.83508,336,592,375.46667,592,415.95728V512H734L711.3,660H592v357.77777C836.769,979.37012,1024,767.554,1024,512Z">
                                    </path>
                                    <path fill="#fff"
                                        d="M711.3,660,734,512H592V415.95728C592,375.46667,611.83508,336,675.43713,336H740V210s-58.59235-10-114.61078-10C508.43854,200,432,270.87982,432,399.2V512H302V660H432v357.77777a517.39619,517.39619,0,0,0,160,0V660Z">
                                    </path>
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $facebook }}</h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Facebook</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class="rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                    viewBox="0 0 102 102" id="instagram">
                                    <defs>
                                        <radialGradient id="a" cx="6.601" cy="99.766" r="129.502"
                                            gradientUnits="userSpaceOnUse">
                                            <stop offset=".09" stop-color="#fa8f21"></stop>
                                            <stop offset=".78" stop-color="#d82d7e"></stop>
                                        </radialGradient>
                                        <radialGradient id="b" cx="70.652" cy="96.49" r="113.963"
                                            gradientUnits="userSpaceOnUse">
                                            <stop offset=".64" stop-color="#8c3aaa" stop-opacity="0"></stop>
                                            <stop offset="1" stop-color="#8c3aaa"></stop>
                                        </radialGradient>
                                    </defs>
                                    <path fill="url(#a)"
                                        d="M25.865,101.639A34.341,34.341,0,0,1,14.312,99.5a19.329,19.329,0,0,1-7.154-4.653A19.181,19.181,0,0,1,2.5,87.694,34.341,34.341,0,0,1,.364,76.142C.061,69.584,0,67.617,0,51s.067-18.577.361-25.14A34.534,34.534,0,0,1,2.5,14.312,19.4,19.4,0,0,1,7.154,7.154,19.206,19.206,0,0,1,14.309,2.5,34.341,34.341,0,0,1,25.862.361C32.422.061,34.392,0,51,0s18.577.067,25.14.361A34.534,34.534,0,0,1,87.691,2.5a19.254,19.254,0,0,1,7.154,4.653A19.267,19.267,0,0,1,99.5,14.309a34.341,34.341,0,0,1,2.14,11.553c.3,6.563.361,8.528.361,25.14s-.061,18.577-.361,25.14A34.5,34.5,0,0,1,99.5,87.694,20.6,20.6,0,0,1,87.691,99.5a34.342,34.342,0,0,1-11.553,2.14c-6.557.3-8.528.361-25.14.361s-18.577-.058-25.134-.361">
                                    </path>
                                    <path fill="url(#b)"
                                        d="M25.865,101.639A34.341,34.341,0,0,1,14.312,99.5a19.329,19.329,0,0,1-7.154-4.653A19.181,19.181,0,0,1,2.5,87.694,34.341,34.341,0,0,1,.364,76.142C.061,69.584,0,67.617,0,51s.067-18.577.361-25.14A34.534,34.534,0,0,1,2.5,14.312,19.4,19.4,0,0,1,7.154,7.154,19.206,19.206,0,0,1,14.309,2.5,34.341,34.341,0,0,1,25.862.361C32.422.061,34.392,0,51,0s18.577.067,25.14.361A34.534,34.534,0,0,1,87.691,2.5a19.254,19.254,0,0,1,7.154,4.653A19.267,19.267,0,0,1,99.5,14.309a34.341,34.341,0,0,1,2.14,11.553c.3,6.563.361,8.528.361,25.14s-.061,18.577-.361,25.14A34.5,34.5,0,0,1,99.5,87.694,20.6,20.6,0,0,1,87.691,99.5a34.342,34.342,0,0,1-11.553,2.14c-6.557.3-8.528.361-25.14.361s-18.577-.058-25.134-.361">
                                    </path>
                                    <path fill="#fff"
                                        d="M461.114,477.413a12.631,12.631,0,1,1,12.629,12.632,12.631,12.631,0,0,1-12.629-12.632m-6.829,0a19.458,19.458,0,1,0,19.458-19.458,19.457,19.457,0,0,0-19.458,19.458m35.139-20.229a4.547,4.547,0,1,0,4.549-4.545h0a4.549,4.549,0,0,0-4.547,4.545m-30.99,51.074a20.943,20.943,0,0,1-7.037-1.3,12.547,12.547,0,0,1-7.193-7.19,20.923,20.923,0,0,1-1.3-7.037c-.184-3.994-.22-5.194-.22-15.313s.04-11.316.22-15.314a21.082,21.082,0,0,1,1.3-7.037,12.54,12.54,0,0,1,7.193-7.193,20.924,20.924,0,0,1,7.037-1.3c3.994-.184,5.194-.22,15.309-.22s11.316.039,15.314.221a21.082,21.082,0,0,1,7.037,1.3,12.541,12.541,0,0,1,7.193,7.193,20.926,20.926,0,0,1,1.3,7.037c.184,4,.22,5.194.22,15.314s-.037,11.316-.22,15.314a21.023,21.023,0,0,1-1.3,7.037,12.547,12.547,0,0,1-7.193,7.19,20.925,20.925,0,0,1-7.037,1.3c-3.994.184-5.194.22-15.314.22s-11.316-.037-15.309-.22m-.314-68.509a27.786,27.786,0,0,0-9.2,1.76,19.373,19.373,0,0,0-11.083,11.083,27.794,27.794,0,0,0-1.76,9.2c-.187,4.04-.229,5.332-.229,15.623s.043,11.582.229,15.623a27.793,27.793,0,0,0,1.76,9.2,19.374,19.374,0,0,0,11.083,11.083,27.813,27.813,0,0,0,9.2,1.76c4.042.184,5.332.229,15.623.229s11.582-.043,15.623-.229a27.8,27.8,0,0,0,9.2-1.76,19.374,19.374,0,0,0,11.083-11.083,27.716,27.716,0,0,0,1.76-9.2c.184-4.043.226-5.332.226-15.623s-.043-11.582-.226-15.623a27.786,27.786,0,0,0-1.76-9.2,19.379,19.379,0,0,0-11.08-11.083,27.748,27.748,0,0,0-9.2-1.76c-4.041-.185-5.332-.229-15.621-.229s-11.583.043-15.626.229"
                                        transform="translate(-422.637 -426.196)"></path>
                                </svg>
                            </div>

                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $instagram }}</h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Instagram</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class=" rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="none"
                                    id="whatsapp">
                                    <path fill="#25D366"
                                        d="M24 48c13.255 0 24-10.745 24-24S37.255 0 24 0 0 10.745 0 24s10.745 24 24 24Z">
                                    </path>
                                    <path fill="#FDFDFD" fill-rule="evenodd"
                                        d="M24.791 37.353h-.006c-2.388-.001-4.735-.6-6.82-1.738L10.4 37.6l2.025-7.395a14.246 14.246 0 0 1-1.905-7.135c.003-7.868 6.405-14.27 14.27-14.27 3.819.002 7.402 1.488 10.096 4.185a14.185 14.185 0 0 1 4.176 10.097c-.003 7.866-6.402 14.267-14.27 14.27Zm-6.475-4.321.433.257a11.844 11.844 0 0 0 6.037 1.653h.005c6.538 0 11.859-5.32 11.862-11.861a11.79 11.79 0 0 0-3.471-8.392 11.78 11.78 0 0 0-8.386-3.479c-6.543 0-11.864 5.321-11.867 11.861 0 2.241.626 4.424 1.814 6.313l.282.448-1.199 4.378 4.49-1.178Zm13.176-6.878c.25.12.417.201.489.321.089.149.089.863-.208 1.696s-1.722 1.593-2.407 1.695c-.614.092-1.392.13-2.246-.14a20.465 20.465 0 0 1-2.033-.752c-3.343-1.444-5.602-4.684-6.029-5.296-.03-.043-.05-.073-.063-.088l-.002-.004c-.189-.252-1.453-1.94-1.453-3.685 0-1.643.806-2.504 1.178-2.9l.07-.075a1.31 1.31 0 0 1 .95-.446c.238 0 .476.002.684.012.026.002.052.002.08.001.207 0 .467-.002.722.612.099.236.242.586.394.956.307.747.646 1.572.706 1.691.089.179.148.387.03.625l-.05.102c-.09.182-.156.316-.307.493-.06.07-.121.144-.183.22-.123.149-.245.298-.352.405-.179.177-.364.37-.157.727.209.357.924 1.525 1.984 2.47 1.14 1.017 2.13 1.447 2.632 1.664.098.043.178.077.236.106.356.179.564.15.772-.089.208-.238.892-1.041 1.13-1.398.237-.357.475-.297.802-.179.327.12 2.08.982 2.436 1.16l.195.096Z"
                                        clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $whatsapp }}
                        </h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Whatsapp</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class=" rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                    viewBox="147.553 39.286 514.231 514.631" id="snapchat">
                                    <path fill="#fffc00"
                                        d="M147.553 423.021v.023c.308 11.424.403 22.914 2.33 34.268 2.042 12.012 4.961 23.725 10.53 34.627 7.529 14.756 17.869 27.217 30.921 37.396 9.371 7.309 19.608 13.111 30.94 16.771 16.524 5.33 33.571 7.373 50.867 7.473 10.791.068 21.575.338 32.37.293 78.395-.33 156.792.566 235.189-.484 10.403-.141 20.636-1.41 30.846-3.277 19.569-3.582 36.864-11.932 51.661-25.133 17.245-15.381 28.88-34.205 34.132-56.924 3.437-14.85 4.297-29.916 4.444-45.035v-3.016c0-1.17-.445-256.892-.486-260.272-.115-9.285-.799-18.5-2.54-27.636-2.117-11.133-5.108-21.981-10.439-32.053-5.629-10.641-12.68-20.209-21.401-28.57-13.359-12.81-28.775-21.869-46.722-26.661-16.21-4.327-32.747-5.285-49.405-5.27-.027-.004-.09-.173-.094-.255H278.56c-.005.086-.008.172-.014.255-9.454.173-18.922.102-28.328 1.268-10.304 1.281-20.509 3.21-30.262 6.812-15.362 5.682-28.709 14.532-40.11 26.347-12.917 13.386-22.022 28.867-26.853 46.894-4.31 16.084-5.248 32.488-5.271 49.008">
                                    </path>
                                    <path fill="#fff"
                                        d="M407.001 473.488c-1.068 0-2.087-.039-2.862-.076-.615.053-1.25.076-1.886.076-22.437 0-37.439-10.607-50.678-19.973-9.489-6.703-18.438-13.031-28.922-14.775-5.149-.854-10.271-1.287-15.22-1.287-8.917 0-15.964 1.383-21.109 2.389-3.166.617-5.896 1.148-8.006 1.148-2.21 0-4.895-.49-6.014-4.311-.887-3.014-1.523-5.934-2.137-8.746-1.536-7.027-2.65-11.316-5.281-11.723-28.141-4.342-44.768-10.738-48.08-18.484a7.187 7.187 0 0 1-.584-2.443 4.518 4.518 0 0 1 3.777-4.711c22.348-3.68 42.219-15.492 59.064-35.119 13.049-15.195 19.457-29.713 20.145-31.316a2.85 2.85 0 0 1 .101-.217c3.247-6.588 3.893-12.281 1.926-16.916-3.626-8.551-15.635-12.361-23.58-14.882-1.976-.625-3.845-1.217-5.334-1.808-7.043-2.782-18.626-8.66-17.083-16.773 1.124-5.916 8.949-10.036 15.273-10.036 1.756 0 3.312.308 4.622.923 7.146 3.348 13.575 5.045 19.104 5.045 6.876 0 10.197-2.618 11-3.362a1170.709 1170.709 0 0 0-.679-11.262c-1.614-25.675-3.627-57.627 4.546-75.95 24.462-54.847 76.339-59.112 91.651-59.112a3909.561 3909.561 0 0 0 7.582-.071c15.354 0 67.339 4.27 91.816 59.15 8.173 18.335 6.158 50.314 4.539 76.016l-.076 1.23c-.222 3.49-.427 6.793-.6 9.995.756.696 3.795 3.096 9.978 3.339 5.271-.202 11.328-1.891 17.998-5.014 2.062-.968 4.345-1.169 5.895-1.169 2.343 0 4.727.456 6.714 1.285l.106.041c5.66 2.009 9.367 6.024 9.447 10.242.071 3.932-2.851 9.809-17.223 15.485-1.472.583-3.35 1.179-5.334 1.808-7.952 2.524-19.951 6.332-23.577 14.878-1.97 4.635-1.322 10.326 1.926 16.912.036.072.067.145.102.221 1 2.344 25.205 57.535 79.209 66.432a4.523 4.523 0 0 1 3.778 4.711 7.252 7.252 0 0 1-.598 2.465c-3.289 7.703-19.915 14.09-48.064 18.438-2.642.408-3.755 4.678-5.277 11.668-.63 2.887-1.271 5.717-2.146 8.691-.819 2.797-2.641 4.164-5.567 4.164h-.441c-1.905 0-4.604-.346-8.008-1.012-5.95-1.158-12.623-2.236-21.109-2.236-4.948 0-10.069.434-15.224 1.287-10.473 1.744-19.421 8.062-28.893 14.758-13.265 9.379-28.272 19.987-50.707 19.987">
                                    </path>
                                    <path fill="#020202"
                                        d="M408.336 124.235c14.455 0 64.231 3.883 87.688 56.472 7.724 17.317 5.744 48.686 4.156 73.885-.248 3.999-.494 7.875-.694 11.576l-.084 1.591 1.062 1.185c.429.476 4.444 4.672 13.374 5.017l.144.008.15-.003c5.904-.225 12.554-2.059 19.776-5.442 1.064-.498 2.48-.741 3.978-.741 1.707 0 3.521.321 5.017.951l.226.09c3.787 1.327 6.464 3.829 6.505 6.093.022 1.28-.935 5.891-14.359 11.194-1.312.518-3.039 1.069-5.041 1.7-8.736 2.774-21.934 6.96-26.376 17.427-2.501 5.896-1.816 12.854 2.034 20.678 1.584 3.697 26.52 59.865 82.631 69.111a2.487 2.487 0 0 1-.229.9c-.951 2.24-6.996 9.979-44.612 15.783-5.886.902-7.328 7.5-9 15.17-.604 2.746-1.218 5.518-2.062 8.381-.258.865-.306.914-1.233.914h-.442c-1.668 0-4.2-.346-7.135-.922-5.345-1.041-12.647-2.318-21.982-2.318-5.21 0-10.577.453-15.962 1.352-11.511 1.914-20.872 8.535-30.786 15.543-13.314 9.408-27.075 19.143-48.071 19.143-.917 0-1.812-.031-2.709-.076l-.236-.01-.237.018c-.515.045-1.034.068-1.564.068-20.993 0-34.76-9.732-48.068-19.143-9.916-7.008-19.282-13.629-30.791-15.543-5.38-.896-10.752-1.352-15.959-1.352-9.333 0-16.644 1.428-21.978 2.471-2.935.574-5.476 1.066-7.139 1.066-1.362 0-1.388-.08-1.676-1.064-.844-2.865-1.461-5.703-2.062-8.445-1.676-7.678-3.119-14.312-9.002-15.215-37.613-5.809-43.659-13.561-44.613-15.795a2.739 2.739 0 0 1-.231-.918c56.11-9.238 81.041-65.408 82.63-69.119 3.857-7.818 4.541-14.775 2.032-20.678-4.442-10.461-17.638-14.653-26.368-17.422-2.007-.635-3.735-1.187-5.048-1.705-11.336-4.479-14.823-8.991-14.305-11.725.601-3.153 6.067-6.359 10.837-6.359 1.072 0 2.012.173 2.707.498 7.747 3.631 14.819 5.472 21.022 5.472 9.751 0 14.091-4.537 14.557-5.055l1.057-1.182-.085-1.583c-.197-3.699-.44-7.574-.696-11.565-1.583-25.205-3.563-56.553 4.158-73.871 23.37-52.396 72.903-56.435 87.525-56.435.36 0 6.717-.065 6.717-.065.26-.002.549-.006.852-.006m0-9.038h-.017c-.333 0-.646 0-.944.004l-6.633.066c-8.566 0-25.705 1.21-44.115 9.336-10.526 4.643-19.994 10.921-28.14 18.66-9.712 9.221-17.624 20.59-23.512 33.796-8.623 19.336-6.576 51.905-4.932 78.078l.006.041c.176 2.803.361 5.73.53 8.582-1.265.581-3.316 1.194-6.339 1.194-4.864 0-10.648-1.555-17.187-4.619-1.924-.896-4.12-1.349-6.543-1.349-3.893 0-7.997 1.146-11.557 3.239-4.479 2.63-7.373 6.347-8.159 10.468-.518 2.726-.493 8.114 5.492 13.578 3.292 3.008 8.128 5.782 14.37 8.249 1.638.645 3.582 1.261 5.641 1.914 7.145 2.271 17.959 5.702 20.779 12.339 1.429 3.365.814 7.793-1.823 13.145-.069.146-.138.289-.201.439-.659 1.539-6.807 15.465-19.418 30.152-7.166 8.352-15.059 15.332-23.447 20.752-10.238 6.617-21.316 10.943-32.923 12.855a9.038 9.038 0 0 0-7.559 9.424c.078 1.33.39 2.656.931 3.939l.013.023c1.843 4.311 6.116 7.973 13.063 11.203 8.489 3.943 21.185 7.26 37.732 9.855.836 1.59 1.704 5.586 2.305 8.322.629 2.908 1.285 5.898 2.22 9.074 1.009 3.441 3.626 7.553 10.349 7.553 2.548 0 5.478-.574 8.871-1.232 4.969-.975 11.764-2.305 20.245-2.305 4.702 0 9.575.414 14.48 1.229 9.455 1.574 17.606 7.332 27.037 14 13.804 9.758 29.429 20.803 53.302 20.803.651 0 1.304-.021 1.949-.066.789.037 1.767.066 2.799.066 23.88 0 39.501-11.049 53.29-20.799l.022-.02c9.433-6.66 17.575-12.41 27.027-13.984 4.903-.814 9.775-1.229 14.479-1.229 8.102 0 14.517 1.033 20.245 2.15 3.738.736 6.643 1.09 8.872 1.09l.218.004h.226c4.917 0 8.53-2.699 9.909-7.422.916-3.109 1.57-6.029 2.215-8.986.562-2.564 1.46-6.674 2.296-8.281 16.558-2.6 29.249-5.91 37.739-9.852 6.931-3.215 11.199-6.873 13.053-11.166.556-1.287.881-2.621.954-3.979a9.036 9.036 0 0 0-7.56-9.424c-51.585-8.502-74.824-61.506-75.785-63.758a6.454 6.454 0 0 0-.205-.438c-2.637-5.354-3.246-9.777-1.816-13.148 2.814-6.631 13.621-10.062 20.771-12.332 2.07-.652 4.021-1.272 5.646-1.914 7.039-2.78 12.07-5.796 15.389-9.221 3.964-4.083 4.736-7.995 4.688-10.555-.121-6.194-4.856-11.698-12.388-14.393-2.544-1.052-5.445-1.607-8.399-1.607-2.011 0-4.989.276-7.808 1.592-6.035 2.824-11.441 4.368-16.082 4.588-2.468-.125-4.199-.66-5.32-1.171.141-2.416.297-4.898.458-7.486l.067-1.108c1.653-26.19 3.707-58.784-4.92-78.134-5.913-13.253-13.853-24.651-23.604-33.892-8.178-7.744-17.678-14.021-28.242-18.661-18.384-8.066-35.522-9.271-44.1-9.271">
                                    </path>
                                    <path fill="none" d="M147.553 39.443h514.231v514.23H147.553z"></path>
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $snapchat }}
                        </h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Snapchat</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class=" rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                    fill-rule="evenodd" clip-rule="evenodd" image-rendering="optimizeQuality"
                                    shape-rendering="geometricPrecision" text-rendering="geometricPrecision"
                                    viewBox="0 0 512 512" id="tiktok">
                                    <path
                                        d="M353.97 0.43c0.03,7.81 2.31,120.68 120.76,127.72 0,32.55 0.04,56.15 0.04,87.21 -8.97,0.52 -77.98,-4.49 -120.93,-42.8l-0.13 169.78c1.63,117.84 -85.09,189.55 -198.44,164.78 -195.46,-58.47 -130.51,-348.37 65.75,-317.34 0,93.59 0.05,-0.03 0.05,93.59 -81.08,-11.93 -108.2,55.52 -86.65,103.81 19.6,43.97 100.33,53.5 128.49,-8.53 3.19,-12.14 4.78,-25.98 4.78,-41.52l0 -337.13 86.28 0.43z">
                                    </path>
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $tiktok }}
                        </h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Tiktok</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="w-full p-2 lg:w-1/4 md:w-1/2">
                    <div
                        class="flex flex-col px-6 py-10 overflow-hidden bg-white hover:bg-gradient-to-br hover:from-purple-400 hover:via-blue-400 hover:to-blue-500 rounded-xl shadow-lg duration-300 hover:shadow-2xl group">
                        <div class="flex flex-row justify-between items-center">
                            <div class=" rounded-xl bg-opacity-30">
                                <svg xmlns="http://www.w3.org/2000/svg" width='50' height='50'
                                    viewBox="0 0 512 512" id="google">
                                    <path fill="#fbbb00"
                                        d="M113.47 309.408 95.648 375.94l-65.139 1.378C11.042 341.211 0 299.9 0 256c0-42.451 10.324-82.483 28.624-117.732h.014L86.63 148.9l25.404 57.644c-5.317 15.501-8.215 32.141-8.215 49.456.002 18.792 3.406 36.797 9.651 53.408z">
                                    </path>
                                    <path fill="#518ef8"
                                        d="M507.527 208.176C510.467 223.662 512 239.655 512 256c0 18.328-1.927 36.206-5.598 53.451-12.462 58.683-45.025 109.925-90.134 146.187l-.014-.014-73.044-3.727-10.338-64.535c29.932-17.554 53.324-45.025 65.646-77.911h-136.89V208.176h245.899z">
                                    </path>
                                    <path fill="#28b446"
                                        d="m416.253 455.624.014.014C372.396 490.901 316.666 512 256 512c-97.491 0-182.252-54.491-225.491-134.681l82.961-67.91c21.619 57.698 77.278 98.771 142.53 98.771 28.047 0 54.323-7.582 76.87-20.818l83.383 68.262z">
                                    </path>
                                    <path fill="#f14336"
                                        d="m419.404 58.936-82.933 67.896C313.136 112.246 285.552 103.82 256 103.82c-66.729 0-123.429 42.957-143.965 102.724l-83.397-68.276h-.014C71.23 56.123 157.06 0 256 0c62.115 0 119.068 22.126 163.404 58.936z">
                                    </path>
                                </svg>
                            </div>
                        </div>
                        <h1
                            class="text-3xl sm:text-4xl xl:text-5xl font-bold text-gray-700 mt-12 group-hover:text-gray-50">
                            {{ $google }}
                        </h1>
                        <div class="flex flex-row justify-between group-hover:text-gray-200">
                            <p>Google</p>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5 text-indigo-600 group-hover:text-gray-200" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z"
                                        clip-rule="evenodd" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</x-app-layout>
