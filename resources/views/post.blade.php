@extends('layouts.main')
<title>{{ $post->title }}</title>
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-4">{{ $post->title }}</h1>
                <hr>
                <p class="lead">{{__('Posted by')}} {{ $post->authorId()->first()->name ?? 'moderatora' }}
                    {{\Carbon\Carbon::parse($post->created_at)->format('M d Y')}}</p>
                <hr>
                <img src="{{ Voyager::image( $post->image ) }}" class="img-fluid rounded">
                <hr>
                <p class="lead">{!! $post->body !!}</p>

            </div>
        </div>
        <hr>
        <div class="container"> @comments(['model' => $post])
        </div>
    </div>
@endsection
