@extends('layouts.main')
@section('content')
    @include('layouts.partials.header')
    <div class="container-fluid">
        <div class="row container-row">
                @foreach($gallery as $galleries)
                    <div class="col-lg-3 col-md-3 col-xs-6 thumb">
                        <a class="thumbnail" href="#" data-image-id="" data-toggle="modal"
                           data-title="{{$galleries->name}}"
                           data-image="{{ asset("storage/$galleries->image")}}"
                           data-target="#image-gallery">
                            <img class="img-thumbnail"
                                 src="{{ asset("storage/$galleries->image")}}"
                                 alt="{{$galleries->name}}">
                        </a>
                    </div>
                @endforeach

            <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="image-gallery-title"></h4>
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">×</span><span class="sr-only">Close</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img id="image-gallery-image" class="img-responsive col-md-12" src="">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary float-left" id="show-previous-image"><i
                                    class="fa fa-arrow-left"></i>
                            </button>
                            <button type="button" id="show-next-image" class="btn btn-secondary float-right"><i
                                    class="fa fa-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
