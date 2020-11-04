@extends('layouts.main')

@section('content')
    <div class="container">
        <div class="row">
            @if ($message = Session::get('success'))

                <div class="alert alert-success alert-block">

                    <button type="button" class="close" data-dismiss="alert">×</button>

                    <strong>{{ $message }}</strong>

                </div>

            @endif

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Whoops!</strong>{{__('There were some problems with your input.')}}<br><br>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
        <div class="row justify-content-center">

            <div class="profile-header-container">
                <div class="profile-header-img">
                    <img class="rounded-circle"
                         src="{{$user->provider == 'laravel' ? Voyager::image($user->avatar) : $user->avatar}}"/>
                    <div class="rank-label-container">
                        <span class="label label-default rank-label">{{$user->name}}</span>
                    </div>
                </div>
            </div>

        </div>
        <div class="row justify-content-center">
            <form action="/profile" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <input type="file" class="form-control-file" name="avatar" id="avatarFile"
                           aria-describedby="fileHelp">
                    <small id="fileHelp"
                           class="form-text text-muted">{{__('Please upload a valid image file. Size of image should not be more than 2MB.')}}</small>
                </div>
                <div class="form-group">
                    <label for="text">{{__('Username')}}</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="{{__('Username')}}">
                </div>
                    @if($user->provider == 'laravel')
                    <div class="form-group">
                        <label for="text">{{__('Password')}}</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="{{__('Password')}}">
                    </div>
                @endif
                <button type="submit" class="btn btn-danger">{{__('Submit')}}</button>
            </form>
        </div>
    </div>
@endsection
