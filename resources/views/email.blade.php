<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <title>{{ config('app.name', 'Akustyk PWSZ') }}</title>
</head>
<body>
<div>
    <h3>{{ __('You got message from') }} : {{ $name }} </h3>
    <p>{{ __('Email') }} : {{ $email }}</p>
    <p>{{ __('Message') }} : {{ $text }}</p>
</div>
</body>
