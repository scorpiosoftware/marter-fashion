<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ ENV('APP_NAME') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/tom-select/dist/css/tom-select.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/tom-select/dist/js/tom-select.complete.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-M7Vz+vGx0cNuD5cE44iRTGPKxZMXO3cgxR2RTW0QuU">

    @vite('resources/css/app.css', 'resources/js/app.js')
    @livewireStyles
    @stack('styles')
</head>

<body class="font-sans antialiased">
    {{-- <div data-wow-duration="2s" data-wow-iteration="100" class="wow bounce">bounce</div> --}}
    <livewire:add-item-message>
    <x-home.speed-dial />
    <x-home.navbar :categories="$categories" :carousel="$carousel" />
    <x-home.category :categories="$categories" />
    <main>
        @yield('content')
        <br>
        <br>
        <x-home.footer />
        <x-section.scripts />
        @stack('scripts')
    </main>
    @livewireScripts
</body>

</html>
