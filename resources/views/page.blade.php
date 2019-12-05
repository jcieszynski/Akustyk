@extends('layouts.main')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-4">{{ $page->title }}</h1>
                <img src="{{ Voyager::image( $page->image) }}" class="img-fluid rounded">
                <hr>
                <p class="lead">{!! $page->body !!}</p>
            </div>
        </div>
    </div>
@endsection
