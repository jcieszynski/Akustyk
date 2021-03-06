@extends('layouts.main')
@section('content')
    @include('layouts.partials.header')
    @include('flash::message')
    <div class="container">
        @if(Session::has('success'))
            <div class="alert alert-success">
                {{Session::get('success')}}
            </div>
        @endif

        {!! Form::open(['route' =>'contactForm.store']) !!}

        <div class="form-group {{$errors->has('name') ? 'has-error' : ''}}">
            {!! Form::label(trans('parameters.name')) !!}
            @if (Auth::check())
                {!! Form::text('user', @Auth::user()->name,['class' => 'form-control','placeholder' =>trans('parameters.enter_name'),'readonly']) !!}
            @else
                {!! Form::text('user',old('user'),['class' => 'form-control','placeholder' =>trans('parameters.enter_name')]) !!}
                <span class="text-danger">{{ $errors->first('user') }}</span>
            @endif
        </div>
        <div class="form-group {{$errors->has('email') ? 'has-error' : ''}}">
            {!! Form::label(trans('parameters.email')) !!}
            @if (Auth::check())
                {!! Form::text('email',@Auth::user()->email,['class' => 'form-control','placeholder'=> trans('parameters.enter_email'),'readonly']) !!}
            @else
                {!! Form::text('email',old('email'),['class' => 'form-control','placeholder'=> trans('parameters.enter_email')]) !!}
                <span class="text-danger">{{ $errors->first('email') }}</span>
            @endif
        </div>
        <div class="form-group {{$errors->has('message') ? 'has-error' : ''}}">
            {!! Form::label(trans('parameters.message')) !!}
            {!! Form::textarea('message',old('message'),['class' => 'form-control','placeholder' =>trans('parameters.enter_message')]) !!}
            <span class="text-danger">{{ $errors->first('message') }}</span>
        </div>
        <div class="form-group">
            <button class="btn btn-success">{{ __('Confirm') }}</button>
        </div>
        <div>
            {!! NoCaptcha::display(['data-theme' => 'light']) !!}
            @if ($errors->has('g-recaptcha-response'))
                <span class="text-danger">
                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                </span>
            @endif
        </div>
        {!! Form::close() !!}
    </div>
@endsection
