@extends('layouts.audio-layout')
@section('content')
    @include('layouts.partials.header')
    @include('flash::message')
    <div class="container">
        <div class="flex-container">
            @foreach($audio as $audios)
                <table class="table">
                    @if($audios->visible)
                        <tr>
                            <td>  {!!html_entity_decode( $audios->embed)!!}</td>
                            <p class="badge badge-primary text-wrap badge-font-size">{{$audios->name}}</p>
                            <p class=" md-textarea">{{$audios->description}}</p></tr>
                    @endif
                </table>
            @endforeach
            {{ $audio->links() }}
        </div>
    </div>

@endsection
