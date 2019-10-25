<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    @if ( Config::get('app.locale') == 'en')
        <span class="lang">(EN)</span>
    @else <span class="lang">(PL)</span>
    @endif
    <div class="navbar-header">
        <a class="navbar-brand logo-akustyk" href="{{URL::to('/')}}">Akustyk</a>
    </div>
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-item nav-link {{ (request()->is('music')) ? 'active' : '' }} {{ (request()->is('music/*')) ? 'active' : '' }}" href="{{URL::to('music')}}">{{__('Music')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link {{ (request()->is('audio-files')) ? 'active' : '' }} {{ (request()->is('audio-files/*')) ? 'active' : '' }}" href="{{URL::to('audio-files')}}">{{__('Download')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link {{ (request()->is('gallery')) ? 'active' : '' }}" href="{{URL::to('gallery')}}">{{__('Gallery')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-item nav-link {{ (request()->is('contact-us')) ? 'active' : '' }}" href="{{URL::to('contact-us')}}">{{__('Contact')}}</a>
            </li>
            @if (Auth::check() && (Auth::user()->role_id == 1 || Auth::user()->role_id ==3))
                <li class="nav-item">
                    <a class="nav-item nav-link" href="{{URL::to('admin')}}">{{__('Management panel')}}</a>
                </li>
            @endif
        </ul>
    </div>
    <div class="order-0">
        <a class="navbar-brand mx-auto" href="#"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto nav-position">
            @guest
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                </li>
                @if (Route::has('register'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </li>
                @endif
            @else
                <li class="nav-item dropdown">
                    @if(Auth::user()->provider == 'laravel')
                        {{ Html::image('storage/'. Auth::user()->avatar, __('Avatar of user') . ' ' . Auth::user()->name,array('class' => 'logged-avatar') ) }}
                    @else
                        {{ Html::image(Auth::user()->avatar, __('Avatar of user') . ' ' . Auth::user()->name ,array('class' => 'logged-avatar') ) }}
                    @endif
                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                        {{ Auth::user()->name }} <span class="caret"></span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/profile">
                            {{__('User Profile')}}
                        </a>
                        <a class="dropdown-item" href="{{ route('logout') }}"
                           onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                            {{ __('Logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    </div>
                </li>
            @endguest
        </ul>
    </div>
</nav>
