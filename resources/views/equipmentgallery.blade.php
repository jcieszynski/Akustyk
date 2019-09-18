@extends('layouts.app')
@section('content')
    <div>
        @foreach($gallery as $galleries)
            {{ Html::image( asset("storage/$galleries->image"), $galleries->name, array('class' => 'css-class')) }}
            {!! $galleries->description !!}

        @endforeach
    </div>
@endsection
