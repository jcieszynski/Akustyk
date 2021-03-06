@extends('layouts.audio-layout')
@section('content')
    @include('layouts.partials.header')
    <div class="container">
        @foreach($music as $musics)
            <div class="audio-player-sep">
        <?php $file = (json_decode($musics->path))[0]->download_link;?>
            @if($musics->visible)
                <p class="lead">{{$musics->name}}</p>
                <audio controls class="js-player">
                    {{__('Your browser does not support the video tag.')}}
                    <source src="{{ Storage::disk(config('voyager.storage.disk'))->url($file)}}"/>
                </audio>
            @if($musics->download)
                <div class="download-button-sep">
                <a class="btn btn-primary" download
                   href="{{\App\Http\Controllers\AudioFilesController::getDownload($file)}}">{{__('Download')}}</a>
                </div>
            @endif
            @endif
            </div>
        @endforeach
        {{$music->links()}}
    </div>
    <script>
        const players = Array.from(document.querySelectorAll('.js-player')).map(player => new Plyr(player));
        players.forEach(function (instance, index) {
            instance.on('play', function () {
                players.forEach(function (instance1, index1) {
                    if (instance != instance1) {
                        instance1.pause();
                    }
                });
            });
        });
    </script>
@endsection
