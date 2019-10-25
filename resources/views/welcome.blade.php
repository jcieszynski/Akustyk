@extends('layouts.main')
@section('content')
    @include('flash::message')
    @include('layouts.partials.header')
    <div class="container">
        <div class="row">
            @foreach($posts as $post)
                @if($post->status == 'PUBLISHED')
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <div class="card card-margin">
                            <img class="card-img" src="{{ Voyager::image( $post->image ) }}" alt="{{$post->title}}">
                            <div class="card-body">
                                <h4 class="card-title">{{$post->title}}</h4>
                                <p class="card-text">{{$post->excerpt}}</p>
                                <a href="/post/{{ $post->slug }}" class="btn btn-primary button-post">Czytaj
                                    &rarr;</a>
                            </div>
                            <div
                                class="card-footer text-muted d-flex justify-content-between bg-transparent border-top-0">
                                {{__('Posted on')}} {{\Carbon\Carbon::parse($post->created_at)->format('M d Y')}} {{__('by')}}
                                <span>{{ $post->authorId()->first()->name }}</span>
                            </div>
                        </div>
                    </div>
                @endif
            @endforeach
        </div>
    </div>
@endsection
