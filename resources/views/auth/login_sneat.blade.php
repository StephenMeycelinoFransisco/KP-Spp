@extends('auth.app_auth_sneat')

@section('content')
<div class="container-xxl">
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
            <!-- Register -->
            <div class="card">
                <div class="card-body">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                        <img src="{{ Storage::url(settings()->get('app_logo')) }}" width="70" alt="">
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">Selamat Datang Ayah Bunda,</h4>
                    <p class="mb-4">Silahkan login untuk melihat informasi pembayaran anak anda.</p>

                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" id="email" name="email"
                                placeholder="Silahkan ketik email" autofocus />
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">Password</label>
                                <a href="https://wa.me/+{{ settings()->get('no_wa_operator') }}">
                                    <small>Lupa Password?</small>
                                </a>
                            </div>
                            <div class="input-group input-group-merge">
                                <input type="password" id="password" class="form-control" name="password"
                                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                    aria-describedby="password" />
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="remember-me" name="remember" />
                                <label class="form-check-label" for="remember-me"> Ingat akun saya </label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary d-grid w-100" type="submit">Login</button>
                        </div>
                    </form>

                    <p class="text-center">
                        <span>Jika ayah bunda belum memiliki akun, silahkan hubungi bendahara sekolah.</span>
                        <br>
                        <a href="https://wa.me/+{{ settings()->get('no_wa_operator') }}" target="blank">
                            <span>Melalui Nomor Whatsapp Berikut.</span>
                        </a>
                    </p>
                </div>
            </div>
            <!-- /Register -->
        </div>
    </div>
</div>

@endsection