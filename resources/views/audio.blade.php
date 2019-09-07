@extends('layouts.app')
@section('content')
    @include('flash::message')
    <script src="https://w.soundcloud.com/player/api.js" type="text/javascript"></script>
    <div class="flex-container">
            @foreach($audio as $audios)
                @if($audios->visible)
                    {!!html_entity_decode( $audios->embed)!!}
                @endif
            @endforeach
    </div>

@endsection
