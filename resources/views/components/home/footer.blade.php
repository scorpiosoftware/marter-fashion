<footer class="bg-[#ec5793]">
    <div class="mx-auto w-full max-w-screen-xl p-4 py-6 lg:py-8">
        <div class="md:flex md:justify-between">
            <div class="mb-6 md:mb-0 ">
                <a href="" class="flex items-center space-x-2 ">
                    <span class="md:text-2xl text-md text-nowrap font-serif px-4 py-2 bg-white text-[#ec5793] border rounded-full">{{ env('APP_NAME') }}</span>
                </a>
            </div>
            <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
                <div>
                    <h2 class="mb-6 text-sm font-semibold text-white uppercase"> {{session('lang') == 'en' ? 'Support' : 'دعم'}}</h2>
                    <ul class="text-[#ec5793]  font-medium">
                        <li class="mb-4 bg-white px-1 rounded-md">
                            <a href="" class="hover:underline">{{session('lang') == 'en' ? 'About us' : 'ملومات عنا'}}</a>
                        </li>
                        <li class="bg-white px-1 rounded-md">
                            <a href="/contactUs" class="hover:underline">{{session('lang') == 'en' ? 'Contact Us' : 'تواصل معنا'}}</a>
                        </li>
                    </ul>
                </div>
                <div>
                    <h2 class="mb-6 text-sm font-semibold  uppercase text-white">{{session('lang') == 'en' ? 'Follow us' : 'تابعنا'}}</h2>
                    <ul class="text-[#ec5793]  font-medium">
                        <li class="mb-4 bg-white px-1 rounded-md">
                            <a href=""
                                class="hover:underline ">{{session('lang') == 'en' ? 'Instagram' : 'انستغرام'}}</a>
                        </li>
                        <li class="bg-white px-1 rounded-md">
                            <a href=""
                                class="hover:underline">{{session('lang') == 'en' ? 'Facebook' : 'فيسبوك'}}</a>
                        </li>
                    </ul>
                </div>
                <div>
                    <h2 class="mb-6 text-sm font-semibold  uppercase text-white">{{session('lang') == 'en' ? 'Legal' : 'قانوني'}}</h2>
                    <ul class="text-[#ec5793]  font-medium">
                        <li class="mb-4 bg-white px-1 rounded-md">
                            <a href="/privacy-policy" class="hover:underline">{{session('lang') == 'en' ? 'Privacy Policy' : 'سياسة الخصوصية'}}</a>
                        </li>
                        <li class="bg-white px-1 rounded-md">
                            <a href="" class="hover:underline">{{session('lang') == 'en' ? 'Terms & Conditions' : 'الشروط والأحكام'}}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <hr class="my-6 border-gray-200 sm:mx-auto  lg:my-8" />
        <div class="sm:flex sm:items-center sm:justify-between">
            <span class="text-sm text-white sm:text-center ">© 2024 <a href=""
                    class="hover:underline">ScorpioSoftware™</a>. All Rights Reserved.
            </span>
        </div>
    </div>
</footer>
