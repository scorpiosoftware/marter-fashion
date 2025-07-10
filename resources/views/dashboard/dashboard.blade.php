<x-app-layout>
    <div class="container mx-auto px-4 py-6">
        <!-- Header Section -->
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
            <div class="mb-4 md:mb-0">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800 dark:text-white">
                    {{ session('lang') == 'en' ? 'Dashboard Overview' : 'نظرة عامة على لوحة التحكم' }}
                </h1>
                <p class="text-gray-600 dark:text-gray-400 mt-1">
                    {{ session('lang') == 'en' ? 'Welcome back! Here\'s what\'s happening with your business today.' : 'مرحبًا بعودتك! إليك ما يحدث في عملك اليوم.' }}
                </p>
            </div>

            <!-- Date Filter -->
            <form action="{{ route('dashboard.index') }}" method="get" class="flex items-center gap-3">
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg class="w-4 h-4 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 20 20">
                            <path
                                d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                        </svg>
                    </div>
                    <input type="date" id="datepicker" name="date"
                        class="form-control bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                        placeholder="{{ session('lang') == 'en' ? 'Select date' : 'اختر تاريخًا' }}">
                </div>
                <button type="submit"
                    class="px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg text-sm transition-colors duration-200">
                    {{ session('lang') == 'en' ? 'Apply' : 'تطبيق' }}
                </button>
            </form>
            <script defer>
                flatpickr("#datepicker", {
                    dateFormat: "Y-m-d",
                    defaultDate: "today",
                    minDate: new Date(new Date().getFullYear(), new Date().getMonth(), 1), // 1st of current month
                    locale: {
                        firstDayOfWeek: 1 // Monday
                    },
                    // No maxDate restriction
                    onValueUpdate: function(selectedDates, dateStr, instance) {
                        // Validate selection is not before 1st of current month
                        const firstOfMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1);
                        if (selectedDates[0] < firstOfMonth) {
                            instance.setDate(firstOfMonth);
                        }
                    }
                });
            </script>
        </div>

        <!-- Key Metrics Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <!-- Applied Orders Card -->
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            {{ session('lang') == 'en' ? 'Applied Orders' : 'الطلبات المنجزة' }}
                        </p>
                        <div class="flex items-center mt-2">
                            <h3 class="text-2xl font-semibold text-gray-900 dark:text-white">
                                {{ $applied_orders->count() }}
                            </h3>
                            <span
                                class="ml-2 px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                +0.0%
                            </span>
                        </div>
                    </div>
                    <div class="p-3 rounded-lg bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Revenue Card -->
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            {{ session('lang') == 'en' ? 'Revenue' : 'الإيرادات' }}
                        </p>
                        <div class="flex items-center mt-2">
                            <h3 class="text-2xl font-semibold text-gray-900 dark:text-white">
                                د.ع {{ number_format($revenue) }}
                            </h3>
                            <span
                                class="ml-2 px-2 py-1 text-xs font-medium rounded-full bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200">
                                -0.0%
                            </span>
                        </div>
                    </div>
                    <div class="p-3 rounded-lg bg-green-50 dark:bg-green-900/30 text-green-600 dark:text-green-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Unpaid Card -->
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            {{ session('lang') == 'en' ? 'Unpaid' : 'غير مدفوعة' }}
                        </p>
                        <div class="flex items-center mt-2">
                            <h3 class="text-2xl font-semibold text-gray-900 dark:text-white">
                                د.ع {{ number_format($unpaid) }}
                            </h3>
                            <span
                                class="ml-2 px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                +0.0%
                            </span>
                        </div>
                    </div>
                    <div class="p-3 rounded-lg bg-purple-50 dark:bg-purple-900/30 text-purple-600 dark:text-purple-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Total Card -->
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            {{ session('lang') == 'en' ? 'Total' : 'المجموع' }}
                        </p>
                        <div class="flex items-center mt-2">
                            <h3 class="text-2xl font-semibold text-gray-900 dark:text-white">
                                د.ع {{ number_format($total) }}
                            </h3>
                            <span
                                class="ml-2 px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                                +0.0%
                            </span>
                        </div>
                    </div>
                    <div class="p-3 rounded-lg bg-indigo-50 dark:bg-indigo-900/30 text-indigo-600 dark:text-indigo-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <!-- Traffic Sources Section -->
        <div class="mb-8">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-bold text-gray-800 dark:text-white">
                    {{ session('lang') == 'en' ? 'Traffic Sources' : 'مصادر الزيارات' }}
                </h2>
                <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                    </svg>
                    {{ session('lang') == 'en' ? 'Last 30 days' : 'آخر 30 يومًا' }}
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <!-- Total Visitors -->
                <div
                    class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6 hover:shadow-md transition-shadow duration-300">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                            {{ session('lang') == 'en' ? 'Total Visitors' : 'إجمالي الزوار' }}
                        </h3>
                        <div class="p-2 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                        </div>
                    </div>
                    <div class="flex items-end justify-between">
                        <p class="text-3xl font-bold text-gray-900 dark:text-white">
                            {{ number_format($totalVisits) }}
                        </p>
                        <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 10l7-7m0 0l7 7m-7-7v18" />
                            </svg>
                            12.5%
                        </div>
                    </div>
                </div>

                <!-- Facebook -->
                <div
                    class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6 hover:shadow-md transition-shadow duration-300">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                            Facebook
                        </h3>
                        <div class="p-2 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="flex items-end justify-between">
                        <p class="text-3xl font-bold text-gray-900 dark:text-white">
                            {{ number_format($facebook) }}
                        </p>
                        <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 10l7-7m0 0l7 7m-7-7v18" />
                            </svg>
                            8.2%
                        </div>
                    </div>
                </div>

                <!-- Instagram -->
                <div
                    class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6 hover:shadow-md transition-shadow duration-300">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                            Instagram
                        </h3>
                        <div class="p-2 rounded-lg bg-pink-100 dark:bg-pink-900/30 text-pink-600 dark:text-pink-400">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="flex items-end justify-between">
                        <p class="text-3xl font-bold text-gray-900 dark:text-white">
                            {{ number_format($instagram) }}
                        </p>
                        <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1 " fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 10l7-7m0 0l7 7m-7-7v18" />
                            </svg>
                            15.7%
                        </div>
                    </div>
                </div>

                <!-- WhatsApp -->
                <div
                    class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6 hover:shadow-md transition-shadow duration-300">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                            WhatsApp
                        </h3>
                        <div
                            class="p-2 rounded-lg bg-green-100 dark:bg-green-900/30 text-green-600 dark:text-green-400">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="flex items-end justify-between">
                        <p class="text-3xl font-bold text-gray-900 dark:text-white">
                            {{ number_format($whatsapp) }}
                        </p>
                        <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 10l7-7m0 0l7 7m-7-7v18" />
                            </svg>
                            22.3%
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Secondary Traffic Sources -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            <!-- Snapchat -->
            <div
                class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                        Snapchat
                    </h3>
                    <div
                        class="p-2 rounded-lg bg-yellow-100 dark:bg-yellow-900/30 text-yellow-600 dark:text-yellow-400">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" fill="currentColor">
                            <path d="M24 4C12.954 4 4 12.954 4 24c0 7.732 6.268 14 14 14h12c7.732 0 14-6.268 14-14 0-11.046-8.954-20-20-20zm0 36c-6.627 0-12-5.373-12-12 0-6.627 5.373-12 12-12s12 5.373 12 12c0 6.627-5.373 12-12 12zm0-22c-5.523 0-10 4.477-10 10s4.477 10 10 10 10-4.477 10-10-4.477-10-10-10zm0 16c-3.313 0-6-2.687-6-6s2.687-6 6-6 6 2.687 6 6-2.687 6-6 6zm0-10c-2.209 0-4 1.791-4 4s1.791 4 4 4 4-1.791 4-4-1.791-4-4-4z"/>
                            <path d="M24 12c-6.627 0-12 5.373-12 12 0 2.21.896 4.21 2.343 5.657C15.79 32.104 17.79 33 20 33c2.21 0 4.21-.896 5.657-2.343C32.104 28.21 33 26.21 33 24c0-6.627-5.373-12-12-12z" fill="#fff"/>
                        </svg>
                    </div>
                </div>
                <div class="flex items-end justify-between">
                    <p class="text-2xl font-bold text-gray-900 dark:text-white">
                        {{ number_format($snapchat) }}
                    </p>
                    <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M5 10l7-7m0 0l7 7m-7-7v18" />
                        </svg>
                        5.4%
                    </div>
                </div>
            </div>

            <!-- TikTok -->
            <div
                class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                        TikTok
                    </h3>
                    <div class="p-2 rounded-lg bg-black dark:bg-gray-900 text-white dark:text-gray-200">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20"
                            viewBox="0 0 48 48">
                            <path fill="#212121" fill-rule="evenodd"
                                d="M10.904,6h26.191C39.804,6,42,8.196,42,10.904v26.191	C42,39.804,39.804,42,37.096,42H10.904C8.196,42,6,39.804,6,37.096V10.904C6,8.196,8.196,6,10.904,6z"
                                clip-rule="evenodd"></path>
                            <path fill="#ec407a" fill-rule="evenodd"
                                d="M29.208,20.607c1.576,1.126,3.507,1.788,5.592,1.788v-4.011	c-0.395,0-0.788-0.041-1.174-0.123v3.157c-2.085,0-4.015-0.663-5.592-1.788v8.184c0,4.094-3.321,7.413-7.417,7.413	c-1.528,0-2.949-0.462-4.129-1.254c1.347,1.376,3.225,2.23,5.303,2.23c4.096,0,7.417-3.319,7.417-7.413V20.607L29.208,20.607z M30.657,16.561c-0.805-0.879-1.334-2.016-1.449-3.273v-0.516h-1.113C28.375,14.369,29.331,15.734,30.657,16.561L30.657,16.561z M19.079,30.832c-0.45-0.59-0.693-1.311-0.692-2.053c0-1.873,1.519-3.391,3.393-3.391c0.349,0,0.696,0.053,1.029,0.159v-4.1	c-0.389-0.053-0.781-0.076-1.174-0.068v3.191c-0.333-0.106-0.68-0.159-1.03-0.159c-1.874,0-3.393,1.518-3.393,3.391	C17.213,29.127,17.972,30.274,19.079,30.832z"
                                clip-rule="evenodd"></path>
                            <path fill="#fff" fill-rule="evenodd"
                                d="M28.034,19.63c1.576,1.126,3.507,1.788,5.592,1.788v-3.157	c-1.164-0.248-2.194-0.856-2.969-1.701c-1.326-0.827-2.281-2.191-2.561-3.788h-2.923V28.79c-0.007,1.867-1.523,3.379-3.393,3.379	c-1.102,0-2.081-0.525-2.701-1.338c-1.107-0.558-1.866-1.705-1.866-3.029c0-1.873,1.519-3.391,3.393-3.391	c0.359,0,0.705,0.056,1.03,0.159v-3.19c-4.024,0.083-7.26,3.369-7.26,7.411c0,2.018,0.806,3.847,2.114,5.183	c1.18,0.792,2.601,1.254,4.129,1.254c4.096,0,7.417-3.319,7.417-7.413L28.034,19.63L28.034,19.63z"
                                clip-rule="evenodd"></path>
                            <path fill="#81d4fa" fill-rule="evenodd"
                                d="M33.626,18.262v-0.854c-1.05,0.002-2.078-0.292-2.969-0.848	C31.445,17.423,32.483,18.018,33.626,18.262z M28.095,12.772c-0.027-0.153-0.047-0.306-0.061-0.461v-0.516h-4.036v16.019	c-0.006,1.867-1.523,3.379-3.393,3.379c-0.549,0-1.067-0.13-1.526-0.362c0.62,0.813,1.599,1.338,2.701,1.338	c1.87,0,3.386-1.512,3.393-3.379V12.772H28.095z M21.635,21.38v-0.909c-0.337-0.046-0.677-0.069-1.018-0.069	c-4.097,0-7.417,3.319-7.417,7.413c0,2.567,1.305,4.829,3.288,6.159c-1.308-1.336-2.114-3.165-2.114-5.183	C14.374,24.749,17.611,21.463,21.635,21.38z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>
                <div class="flex items-end justify-between">
                    <p class="text-2xl font-bold text-gray-900 dark:text-white">
                        {{ number_format($tiktok) }}
                    </p>
                    <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M5 10l7-7m0 0l7 7m-7-7v18" />
                        </svg>
                        18.9%
                    </div>
                </div>
            </div>

            <!-- Google -->
            <div
                class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-white">
                        Google
                    </h3>
                    <div class="p-2 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 512 512"
                            id="google">
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
                <div class="flex items-end justify-between">
                    <p class="text-2xl font-bold text-gray-900 dark:text-white">
                        {{ number_format($google) }}
                    </p>
                    <div class="flex items-center text-sm text-green-600 dark:text-green-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M5 10l7-7m0 0l7 7m-7-7v18" />
                        </svg>
                        7.1%
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div
            class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 dark:border-gray-700 p-6 mb-8">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-xl font-bold text-gray-800 dark:text-white">
                    {{ session('lang') == 'en' ? 'Recent Activity' : 'النشاط الأخير' }}
                </h2>
                <a href="#"
                    class="text-sm font-medium text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300">
                    {{ session('lang') == 'en' ? 'View all' : 'عرض الكل' }}
                </a>
            </div>

            <div class="space-y-4">
                <!-- Activity Item 1 -->
                <div class="flex items-start">
                    <div class="flex-shrink-0 mr-3 mt-1">
                        <div
                            class="h-8 w-8 rounded-full bg-green-100 dark:bg-green-900/30 flex items-center justify-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-600 dark:text-green-400"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 13l4 4L19 7" />
                            </svg>
                        </div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            {{ session('lang') == 'en' ? 'New order #1234 completed' : 'تم إكمال طلب جديد #1234' }}
                        </p>
                        <p class="text-sm text-gray-500 dark:text-gray-400">
                            {{ session('lang') == 'en' ? 'Customer: Ahmed Mohammed - Total: د.ع 125,000' : 'العميل: أحمد محمد - الإجمالي: د.ع 125,000' }}
                        </p>
                        <p class="text-xs text-gray-400 dark:text-gray-500 mt-1">
                            2 hours ago
                        </p>
                    </div>
                </div>

                <!-- Activity Item 2 -->
                <div class="flex items-start">
                    <div class="flex-shrink-0 mr-3 mt-1">
                        <div
                            class="h-8 w-8 rounded-full bg-blue-100 dark:bg-blue-900/30 flex items-center justify-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-600 dark:text-blue-400"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            {{ session('lang') == 'en' ? 'Payment received for order #1233' : 'تم استلام الدفع للطلب #1233' }}
                        </p>
                        <p class="text-sm text-gray-500 dark:text-gray-400">
                            {{ session('lang') == 'en' ? 'Amount: د.ع 85,000 - Method: Cash on delivery' : 'المبلغ: د.ع 85,000 - الطريقة: الدفع عند الاستلام' }}
                        </p>
                        <p class="text-xs text-gray-400 dark:text-gray-500 mt-1">
                            5 hours ago
                        </p>
                    </div>
                </div>

                <!-- Activity Item 3 -->
                <div class="flex items-start">
                    <div class="flex-shrink-0 mr-3 mt-1">
                        <div
                            class="h-8 w-8 rounded-full bg-yellow-100 dark:bg-yellow-900/30 flex items-center justify-center">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                class="h-5 w-5 text-yellow-600 dark:text-yellow-400" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                        </div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            {{ session('lang') == 'en' ? 'New message from customer' : 'رسالة جديدة من عميل' }}
                        </p>
                        <p class="text-sm text-gray-500 dark:text-gray-400">
                            {{ session('lang') == 'en' ? 'Noor Ali: "When will my order be delivered?"' : 'نور علي: "متى سيتم تسليم طلبي؟"' }}
                        </p>
                        <p class="text-xs text-gray-400 dark:text-gray-500 mt-1">
                            1 day ago
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
        }

        /* Smooth transitions for dark mode */
        .transition-colors {
            transition-property: background-color, border-color, color, fill, stroke;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms;
        }
    </style>
</x-app-layout>
