<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Business, Service">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>
        {{ @$title != '' ? "$title |" : '' }}
        {{ settings()->get('app_name', 'SMP XAVERIUS 1 JAMBI') }}
    </title>
    <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="img/2.png" type="image/png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('slick') }}/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/animate.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/LineIcons.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/owl.carousel.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/owl.theme.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/magnific-popup.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/nivo-lightbox.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/main.css">
    <link rel="stylesheet" href="{{ asset('slick') }}/css/responsive.css">

</head>

<body>

    <!-- Header Section Start -->
    <header id="home" class="hero-area">
        <div class="overlay">
            <span></span>
            <span></span>
        </div>
        <nav class="navbar navbar-expand-md bg-inverse fixed-top scrolling-navbar">
            <div class="container">
                <a href="#" class="navbar-brand">
                    <img src="{{ Storage::url(settings()->get('app_logo')) }}"
                        width="100" style="background-color: white; border-radius: 3rem">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="lni-menu"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto w-100 justify-content-end">
                        <li class="nav-item">
                            <a class="btn btn-singin" href="{{ route('login') }}">Login Wali Siswa</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row space-100">
                <div class="col-lg-6 col-md-12 col-xs-12">
                    <div class="contents">
                        <h2 class="head-title">{{ strtoupper(settings()->get('app_name')) }}</h2>
                        <p>
                            Buat Akun Sekarang dan Nikmati Kemudahan Tanpa Batas! <br>
                            Bebas Repot, Bayar SPP dengan Cepat: Solusi Praktis bagi Orang Tua yang Peduli Pendidikan.</p>
                        <div class="header-button">
                            <a href="{{ route('login') }}" rel="nofollow" target="_blank"
                                class="btn btn-border-filled">Login Wali Siswa</a>
                            <a href="https://wa.me/+{{ settings()->get('no_wa_operator') }}" rel="nofollow" target="blank"
                                class="btn btn-border page-scroll">Daftar Wali Siswa</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-xs-12 p-0">
                    <div class="intro-img">
                        <img src="{{ asset('slick') }}/img/intro.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Footer Section Start -->
    <footer>
        <!-- Footer Area Start -->
        <section id="footer-Content">
            <!-- Copyright Start  -->
            <div class="copyright">
                <div class="container">
                    <!-- Star Row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="site-info text-center">
                                <p>Copyright © 2023,
                                    <a href="" rel="nofollow">SMA Ferdy Ferry Putra Kota Jambi</a>
                                    <a href="{{ route('login') }}">Login Operator</a>
                                </p>
                            </div>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
            </div>
            <!-- Copyright End -->
        </section>
        <!-- Footer area End -->

    </footer>
    <!-- Footer Section End -->

    <!-- Preloader -->
    <div id="preloader">
        <div class="loader" id="loader-1"></div>
    </div>
    <!-- End Preloader -->

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="{{ asset('slick') }}/js/jquery-min.js"></script>
    <script src="{{ asset('slick') }}/js/popper.min.js"></script>
    <script src="{{ asset('slick') }}/js/bootstrap.min.js"></script>
    <script src="{{ asset('slick') }}/js/owl.carousel.js"></script>
    <script src="{{ asset('slick') }}/js/jquery.nav.js"></script>
    <script src="{{ asset('slick') }}/js/scrolling-nav.js"></script>
    <script src="{{ asset('slick') }}/js/jquery.easing.min.js"></script>
    <script src="{{ asset('slick') }}/js/nivo-lightbox.js"></script>
    <script src="{{ asset('slick') }}/js/jquery.magnific-popup.min.js"></script>
    <script src="{{ asset('slick') }}/js/main.js"></script>

</body>

</html>
