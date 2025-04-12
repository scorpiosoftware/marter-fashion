<div wire:click="addFav({{ $id }})" class="cursor-pointer transition-all duration-300">
    <div id="whishlist" data-tip="Add to Wishlist" class="">
        <i id="ico"
            class="fa fa-heart fa-2x {{ $isFavorited ? 'text-red-500' : 'text-gray-300' }}"></i>
    </div>
</div>
