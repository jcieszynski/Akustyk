<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    @include('layouts.partials.head')
    <title>{{ config('app.name', 'Akustyk PWSZ') }}</title>
</head>
<body>
@include('layouts.partials.nav')
<main class="py-4">
    @yield('content')
</main>
@include('layouts.partials.footer')
<a id="button"></a>
@include('layouts.partials.footer-scripts')
</body>
</html>
