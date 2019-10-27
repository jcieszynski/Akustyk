<script src="{{ asset('js/app.js') }}" defer="defer"></script>
{!! NoCaptcha::renderJs() !!}
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.js" data-cfasync="false"></script>
@if(!request()->is('/admin') || !request()->is('/admin/*'))
    <script>
        window.cookieconsent.initialise({
            "palette": {
                "popup": {
                    "background": "#252e39"
                },
                "button": {
                    "background": "#14a7d0",
                    "text": "#000000"
                }
            },
            "theme": "edgeless",
            "content": {
                "message": "{{__('This website uses cookies to ensure you get the best experience on our website')}}",
                "dismiss": "ok",
                "link": "{{__('learn more')}}"
            }
        });
    </script>

@endif
