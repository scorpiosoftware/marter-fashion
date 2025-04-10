<div>
    <div class="flex justify-center items-center space-x-2">
           <button wire:click='setArabic' class="rounded-full px-3 py-2 text-center border bg-white font-bold transition-all delay-0 hover:scale-90">{{session('lang') == 'en' ? 'Arabic' : 'العربية'}}</button>
           <button wire:click='setEnglish' class="rounded-full px-3 py-2 text-center border bg-white font-bold transition-all delay-0 hover:scale-90">{{session('lang') == 'en' ? 'English' : 'الانجليزية'}}</button>
    </div>
</div>
