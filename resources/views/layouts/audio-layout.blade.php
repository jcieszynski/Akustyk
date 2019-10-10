<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    @include('layouts.partials.head')
    <title>{{__('Music - Akustyk PWSZ')}}</title>
</head>
<body>
@include('layouts.partials.nav')
<div class="d-flex" id="wrapper">
    <div class="bg-light border-right" id="sidebar-wrapper">
        <div class="sidebar-heading">{{__('Categories')}}</div>
        <div class="list-group list-group-flush">
            @foreach($category as $categories)
                @if($categories->visible)
                <a href="{{route('music')}}{{'/'. $categories->name}}" class="list-group-item list-group-item-action  {{ (request()->is('music/'. $categories->name)) ? 'active' : '' }}">{{$categories->name}}</a>
          @endif
            @endforeach
        </div>
    </div>
    <div id="page-content-wrapper">

        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <button class="btn btn-primary" id="menu-toggle">{{__('Categories')}}</button>
        </nav>
        <main class="py-4">
            @yield('content')
        </main>
    </div>

</div>
@include('layouts.partials.footer')
@include('layouts.partials.footer-scripts')
<a id="button"></a>
</body>
</html>
