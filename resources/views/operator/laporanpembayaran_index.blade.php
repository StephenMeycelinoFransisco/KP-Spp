@extends('layouts.app_sneat_blank')
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"></h5>
            <div class="card-body">
                @include('operator.laporan_header')
                <h4 class="mt-4">Laporan Pembayaran</h4>
                Laporan Berdasarkan: {{ $title }}
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td width="1%">No</td>
                                <td>NISN</td>
                                <td>Nama</td>
                                <td>Angkatan</td>
                                <td>Tanggal Bayar</td>
                                <td>Metode Bayar</td>
                                <td>Status Konfirmasi</td>
                                <td>Tanggal Konfirmasi</td>
                                <td>Jumlah Bayar</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($pembayaran as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->tagihan->siswa->nisn }}</td>
                                <td>{{ $item->tagihan->siswa->nama }}</td>
                                <td>{{ $item->tagihan->siswa->angkatan }}</td>
                                <td>{{ $item->tanggal_bayar->translatedFormat(config('app.format_tanggal'))}}</td>
                                <td>{{ $item->metode_pembayaran }}</td>
                                <td>{{ $item->status_konfirmasi }}</td>
                                <td>{{ optional($item->tanggal_konfirmasi)->translatedFormat(config('app.format_tanggal'))}}</td>
                                <td>{{ formatRupiah($item->jumlah_dibayar) }}</td>
                            </tr>
                            @empty
                            <tr>
                                <td coldspan="9" class="text-center">Data tidak ada</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
