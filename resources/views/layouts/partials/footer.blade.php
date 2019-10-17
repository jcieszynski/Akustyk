<footer class="footer-background">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-3 footer-about">
                    <img class="logo-footer" src="{{URL::to('/images/akustyk.png')}}" alt="footer-logo" data-at2x="{{URL::to('/')}}/images/akustyk.png">
                    <p>Akustyk PWSZ jest kołem otwartym zarówno dla studentów z każdego instytutu jak i dla absolwentów uczelni. Zapraszamy 😀</p>
                </div>
                <div class="col-md-4 col-lg-4 offset-lg-1 footer-contact ">
                    <h3>Kontakt</h3>
                    <p><i class="fas fa-map-marker-alt"></i>Ul. Grunwaldzka 1 pokój 010, 82-300 Elbląg</p>
                    <p><i class="fas fa-envelope"></i> Email: <a href="mailto:akustykwsz@gmail.com">akustykpwsz@gmail.com</a></p>
              <p><i class="fab fa-wpforms"></i><a href="{{URL::to('contact-us')}}">Napisz poprzez formularz</a></p><p>
                      <p><i class="fas fa-hourglass-start"></i>Piątek 16:00 - 21:00</p>
                </div>
                <hr>
                <div class="col-md-4 col-lg-3 footer-links">
                    <div class="row">
                        <div class="col">
                            <h3>Przydatne linki</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p><a href="https://pwsz.elblag.pl" target="_blank">Strona PWSZ</a></p>
                            <p><a href="http://netka.pwsz.elblag.pl" target="_blank">Gazetka uczelni</a></p>
                            <p><a href="https://usosweb.pwsz.elblag.pl">USOS</a></p>
                            <p><a href="https://www.facebook.com/groups/1460553314265091/">Grupa na FB</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-6 footer-copyright">
                     &copy; Akustyk PWSZ {{\Carbon\Carbon::now()->format('Y')}} {{ __('Set Language') }}
                    <a class="" href="lang/en" id="en">{{__('English')}}</a>
                    <a class="" href="lang/pl" id="pl">{{__('Polish')}}</a>
                </div>
                <div class="col-md-6 footer-social">
                    <a href="https://facebook.com/pwszelblag" target="_blank"><i class="fab fa-facebook"></i></a>
                    <a href="https://twitter.com/pwszelblag"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/pwsz.elblag" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.youtube.com/channel/UC2Nknvv19ssLL7RY1evfxjQ" target="_blank"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>
