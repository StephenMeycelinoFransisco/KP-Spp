@extends('layouts.app_sneat_wali')

@section('content')
<div class="row">
    <div class="col-lg-10 mb-4 order-0">
        <div class="card">
            <div class="d-flex align-items-end row">
                <div class="col-sm-7">
                    <div class="card-body">
                        <h5 class="card-title text-primary">Selamat Datang, {{ auth()->user()->name }} 🎉</h5>
                        <p class="mb-4">
                            Kamu mendapatkan <span class="fw-bold">{{ auth()->user()->unreadNotifications->count()
                                }}</span> Klik tombol di bawah untuk melihat informasi pembayaran
                        </p>

                        <a href="{{ route('wali.tagihan.index') }}" class="btn btn-sm btn-outline-primary">Lihat Data
                            Pembayaran</a>
                    </div>
                </div>
                <div class="col-sm-5 text-center text-sm-left">
                    <div class="card-body pb-0 px-0 px-md-4">
                        <img src="{{ asset('sneat') }}/assets/img/illustrations/man-with-laptop-light.png" height="140"
                            alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-2 col-md-4 order-1">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                                <img src="{{ asset('sneat') }}/assets/img/icons/unicons/chart-success.png"
                                    alt="chart success" class="rounded" />
                            </div>
                        </div>
                        <span class="fw-semibold d-block mb-1">Total Data</span>
                        <h3 class="card-title mb-2">{{ auth()->user()->siswa->count() }} Siswa</h3>
                        <small class="text-success fw-semibold">Data Siswa</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    @foreach ($dataRekap as $item)
    <!-- Start Kartu SPP -->
    <div class="col-md-6 col-lg-4 order-2 mb-4">
        <div class="card h-100">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="card-title m-0 me-2">KARTU SPP <strong>{{ Str::words(strtoupper($item['siswa']['nama']), 1) }}</strong>
                </h5>
            </div>
            <div class="card-body">
                <a href="{{ route('kartuspp.index',[
                    'siswa_id' => $item['siswa']['id'],
                    'tahun' => date('Y'),
                    ]) }}"
                        target="blank">
                        <i class="fa fa-print"></i>
                    Kartu SPP
                </a>
                <ul class="p-0 m-0">
                    <li class="list-group-item d-flex justify-content-between align-item-center list-group-item-secondary">
                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2 ">
                            <div class="me-2 ">
                                <h6 class="mb-0">Bulan</h6>
                            </div>
                            <span>Status</span>
                        </div>
                    </li>
                    @foreach ($item['dataTagihan'] as $itemTagihan)
                    <li class="list-group-item d-flex justify-content-between align-item-center">
                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                                <h6 class="mb-0">{{ $itemTagihan['bulan'] }}</h6>
                            </div>
                            @if ($itemTagihan['tagihan'] != null)
                                <span class="badge rounded-pill {{ $itemTagihan['status_bayar_teks'] == 'lunas' ? 'bg-primary' : 'bg-danger' }}">
                                    <a class="text-white" href="{{ route('wali.tagihan.show', $itemTagihan['tagihan']->id) }}">
                                        {{ $itemTagihan['status_bayar_teks'] }}
                                    </a>
                                </span>
                            @endif
                        </div>
                    </li>
                    @endforeach

                </ul>
            </div>
        </div>
    </div>
    <!-- End Kartu SPP -->
    @endforeach
</div>

@endsection
