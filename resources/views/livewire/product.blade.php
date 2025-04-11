<div class="product-grid md:w-[250px] w-[250px] flex-shrink-0 transition-all delay-75 hover:scale-90 wowDiv" data-animation="animate__backInUp" data-min-delay='300' data-delay="1500">
    <!-- Include jQuery if not already loaded globally -->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    
    <div class="product-image">
        <a name="{{ $item->id }}" href="{{ route('shop.show', $item->id) }}" class="image block">
            <div class="box-border">
                {{-- <div class="skeleton-loader min-h-32"></div> --}}
                <img src="{{ URL::to('storage/' . $item->main_image_url) }}" class="w-full max-h-80 p-3 object-cover">
            </div>
     
        </a>
        @if (!empty($item->offer_price))
            <span class="product-hot-label bg-[#ec5793] text-white font-serif  absolute">
                {{ session('lang') == 'en' ? 'Sale' : 'تخفيضات' }}
            </span>
        @endif
        <ul class="product-links flex space-x-2 items-center justify-center">
            <!-- Add to Cart -->
            <li>
                <a id="p-item-{{$item->id}}" wire:click="addToCart({{ $item->id }})" 
                   class="custom-toast.success-toast" data-tip="Add to Cart">
                    <i class="fa fa-shopping-bag"></i>
                </a>
            </li>
            <script>
                $("#p-item-{{$item->id}}").click(function(){
                    $('#cart-message').show(500);
                });
            </script>
            
            <!-- Wishlist -->
            <li>
                <a id="whishlist-{{ $item->id }}" data-tip="Add to Wishlist">
                    <i id="ico-{{ $item->id }}" class="fa fa-heart 
                        @if (session('wishlist'))
                            @foreach (session('wishlist') as $id => $details)
                                @if ($details['name'] == $item->name_en)
                                    text-red-600
                                    @break
                                @endif
                            @endforeach
                        @endif"></i>
                </a>
                <script>
                    $(document).ready(function() {
                        $("#whishlist-{{ $item->id }}").click(function() {
                            $.ajax({
                                url: "{{ route('wishlist.add', $item->id) }}",
                                type: "GET",
                                success: function(response) {
                                    setTimeout(function() {
                                        $("#ico-{{ $item->id }}").addClass("text-red-600");
                                        $('#toast-cart').show();
                                    }, 0);
                                }
                            });
                        });
                    });
                </script>
            </li>
            
            <!-- Quick View -->
            <li>
                <a href="{{ route('shop.show', $item->id) }}" data-tip="Quick View">
                    <i class="fa fa-search"></i>
                </a>
            </li>
        </ul>
    </div>
    
    <div class="product-content flex flex-col">
        <a href="#" class="line-clamp-2 text-sm text-center">
            @if (session('lang') == 'en') 
                {{ $item->name_en }}
            @else
                {{ $item->name_ar }}
            @endif
        </a>
    <!-- Price Section -->
    <div class="md:flex justify-center items-center space-x-2">
        <span class="@if (!empty($item->offer_price)) line-through text-sm text-red-500 @else price @endif">
            {{session('lang') == 'en' ? 'IQD' : 'د.ع'}} {{ $item->price }}
        </span>
        @if (!empty($item->offer_price))
            <div class="text-black bg-slate-200 p-1 rounded-lg font-bold text-sm">
                {{session('lang') == 'en' ? 'IQD' : 'د.ع'}} {{ $item->offer_price }}
            </div>
        @endif
    </div>
</div>
</div>
