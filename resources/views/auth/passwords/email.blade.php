@extends('auth.app_auth_sneat')

@section('content')
    <div class="container-xxl">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner py-4">
                <!-- Forgot Password -->
                <div class="card">
                    <div class="card-body">
                        <!-- Logo -->
                        @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                        <div class="app-brand justify-content-center">
                            <img src="{{ Storage::url(settings()->get('app_logo')) }}" width="70" alt="">
                        </div>
                        <!-- /Logo -->
                        <h4 class="mb-2">Lupa Password? 🔒</h4>
                        <p class="mb-4">Masukkan email lalu kami akan mengirim langkah-langkah untuk mengubah password melalui email.</p>
                        <div class="alert alert-info" role="alert">
                            Jika ayah bunda kesulitan dalam mengubah password, silahkan hubungi nomor WhatsApp berikut:
                            <a href="https://wa.me/+{{ settings()->get('no_wa_operator') }}" target="blank">
                                <span>Link WhatsApp.</span>
                            </a>
                        </div>
                        <form method="POST" action="{{ route('password.email') }}">
                            @csrf
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                            </div>
                            <button type="submit" class="btn btn-primary d-grid w-100 mb-3">Kirim Link Reset</button>
                        </form>
                        <div class="text-center">
                            <a href="{{ route('login') }}" class="d-flex align-items-center justify-content-center">
                                <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                                Kembali ke halaman login
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /Forgot Password -->
            </div>
        </div>
    </div>
@endsection
