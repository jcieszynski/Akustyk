<section class="jumbotron text-center">
    <div class="container">
        @foreach(\App\Http\Controllers\HeaderTextController::headerText() as $headers)
            @if(request()->is($headers->view))
                <h1 class="jumbotron-heading">{{$headers->header}}</h1>
                {!! $headers->text !!}
            @endif
        @endforeach
    </div>
</section>
