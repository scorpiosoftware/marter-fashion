@extends('layouts.home')
@section('content')
    <div class="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 dark:from-gray-900 dark:to-gray-800 py-8">
        <div class="md:pt-10 md:max-w-4xl mx-auto px-4">
            <!-- Enhanced Breadcrumb -->
            <nav class="flex px-6 py-4 text-gray-700 border border-gray-200/60 rounded-xl bg-white/80 backdrop-blur-sm shadow-sm dark:bg-gray-800/80 dark:border-gray-700/60 mb-8"
                aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-3 rtl:space-x-reverse">
                    <li class="inline-flex items-center">
                        <a href="{{ route('cart.show') }}"
                            class="inline-flex items-center text-sm font-medium text-gray-600 hover:text-purple-600 transition-colors duration-200 dark:text-gray-400 dark:hover:text-purple-400">
                            <svg class="w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                                viewBox="0 0 20 20">
                                <path
                                    d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                            </svg>
                            {{session('lang') == 'en' ? 'Review Order' : 'العودة'}}
                        </a>
                    </li>
                    <li>
                        <div class="flex items-center">
                            <svg class="rtl:rotate-180 block w-3 h-3 mx-2 text-gray-400" aria-hidden="true"
                                xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="m1 9 4-4-4-4" />
                            </svg>
                            <span class="text-sm font-medium text-purple-600 dark:text-purple-400">
                                {{session('lang') == 'en' ? 'Shipping' : 'التوصيل'}}
                            </span>
                        </div>
                    </li>
                </ol>
            </nav>

            <!-- Enhanced Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl md:text-4xl font-light text-gray-800 dark:text-gray-100 mb-2">
                    {{session('lang') == 'en' ? 'Cash on Delivery' : 'الدفع عند الاستلام'}}
                </h1>
                <p class="text-gray-600 dark:text-gray-400">
                    {{session('lang') == 'en' ? 'Complete your order details below' : 'أكمل تفاصيل طلبك أدناه'}}
                </p>
            </div>

            <!-- Enhanced Form -->
            <div class="bg-white/80 backdrop-blur-sm dark:bg-gray-800/80 rounded-2xl shadow-xl border border-gray-200/60 dark:border-gray-700/60 overflow-hidden">
                <div class="bg-gradient-to-r from-purple-600 to-pink-600 h-2"></div>
                
                <form action="{{ route('order.store') }}" method="POST" class="p-8 md:p-10 space-y-8">
                    @csrf
                    @method('POST')
                    
                    <!-- Personal Information Section -->
                    <div class="space-y-6">
                        <h2 class="text-xl font-semibold text-gray-800 dark:text-gray-100 border-b border-gray-200 dark:border-gray-700 pb-2">
                            {{session('lang') == 'en' ? 'Personal Information' : 'المعلومات الشخصية'}}
                        </h2>
                        
                        <div class="relative group">
                            <input type="text" name="full_name" id="full_name"
                                class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                placeholder=" " required />
                            <label for="full_name"
                                class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                {{session('lang') == 'en' ? 'Full Name' : 'الاسم الكامل'}}
                            </label>
                        </div>

                        <div class="relative group">
                            <input type="tel" name="phone" id="phone"
                                class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                placeholder=" " required />
                            <label for="phone"
                                class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                {{session('lang') == 'en' ? 'Phone Number' : 'رقم الهاتف'}}
                            </label>
                        </div>
                    </div>

                    <!-- Address Information Section -->
                    <div class="space-y-6">
                        <h2 class="text-xl font-semibold text-gray-800 dark:text-gray-100 border-b border-gray-200 dark:border-gray-700 pb-2">
                            {{session('lang') == 'en' ? 'Delivery Address' : 'عنوان التوصيل'}}
                        </h2>
                        
                        <div class="grid md:grid-cols-2 gap-6">
                            <div class="relative group">
                                <input type="text" name="street" id="street"
                                    class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                    placeholder=" " required />
                                <label for="street"
                                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                    {{session('lang') == 'en' ? 'Street Address' : 'عنوان الشارع'}}
                                </label>
                            </div>
                            
                            <div class="relative group">
                                <input type="text" name="apartment" id="apartment"
                                    class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                    placeholder=" " required />
                                <label for="apartment"
                                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                    {{session('lang') == 'en' ? 'Province' : 'المحافظة'}}
                                </label>
                            </div>
                        </div>

                        <div class="grid md:grid-cols-2 gap-6">
                            <div class="relative group">
                                <select required
                                    class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                    name="country" id="country">
                                    <option value="IRAQ" class="bg-white dark:bg-gray-800">
                                        {{session('lang') == 'en' ? 'IRAQ' : 'العراق'}}
                                    </option>
                                </select>
                                <label for="country"
                                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                    {{session('lang') == 'en' ? 'Country' : 'الدولة'}}
                                </label>
                            </div>
                            
                            <div class="relative group">
                                <input type="text" name="city" id="city"
                                    class="block py-3 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-purple-500 focus:outline-none focus:ring-0 focus:border-purple-600 peer transition-colors duration-200"
                                    placeholder=" " required />
                                <label for="city"
                                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-7 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-purple-600 peer-focus:dark:text-purple-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-7">
                                    {{session('lang') == 'en' ? 'City / State / Province' : 'المدينة / الولاية / المقاطعة'}}
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="pt-6 border-t border-gray-200 dark:border-gray-700">
                        <div class="flex justify-center md:justify-end">
                            <button type="submit"
                                class="group relative overflow-hidden bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white font-semibold py-3 px-8 rounded-xl shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-300 focus:outline-none focus:ring-4 focus:ring-purple-300 dark:focus:ring-purple-800">
                                <span class="relative z-10 flex items-center space-x-2 rtl:space-x-reverse">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                    </svg>
                                    <span>{{session('lang') == 'en' ? 'Proceed via WhatsApp' : 'تأكيد عبر واتساب'}}</span>
                                </span>
                                <div class="absolute inset-0 bg-gradient-to-r from-white/20 to-transparent transform translate-x-full group-hover:translate-x-0 transition-transform duration-500"></div>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection