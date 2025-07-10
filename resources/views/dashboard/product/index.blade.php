<x-app-layout>

    <div class="py-6 group">
        <h1
            class="text-3xl md:text-3xl font-extrabold bg-clip-text text-black bg-gradient-to-r from-blue-500 to-purple-600 inline-block transition-all duration-300 transform group-hover:scale-105 group-hover:translate-y-[-2px]">
            {{session('lang') == 'en' ? 'Products' : 'المنتجات'}}
        </h1>
    </div>

<livewire:admin-panel.product.product-table>

</x-app-layout>
