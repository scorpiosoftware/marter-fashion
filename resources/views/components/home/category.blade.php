<div class="w-full h-full bg-[#fce4ec] text-white text-nowrap mx-auto px-4 md:pt-3 py-3 wowDiv hidden md:block"
    data-wow-delay = "0.1" id="wowDiv" data-animation="animate__fadeInDown" data-delay="1000">
    <div class="flex justify-center items-center space-x-6 ">
        @foreach ($categories as $item)
        <form action="{{ route('filter.products') }}" method="POST" data-animation="animate__fadeInDown" data-delay="2000" class="wowDiv">
            @csrf
            @method('POST')
            <input type="text" class="hidden" value="{{ $item->id }}" name="categories[]" id="">
            <button type="submit" class="transition-all delay-75  text-sm hover:scale-105 bg-[#ec5793]  border-2 p-1 "
                href="">
                @if (session('lang') == 'en')
                {!! $item->name_en !!}
                @else
                {!! $item->name_ar !!}
                @endif
               
            </button>
        </form>
        @endforeach
    </div>
</div>
