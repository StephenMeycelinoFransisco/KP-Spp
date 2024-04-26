@extends('layouts.app_sneat_blank')
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"></h5>
            <div class="card-body">
                @include('operator.laporan_header')
                <h4 class="mt-4">Laporan Tagihan</h4>
                Laporan Berdasarkan: {{ $title }}
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td width="1%">No</td>
                                <td>NISN</td>
                                <td>Nama</td>
                                <td>Angkatan</td>
                                <td>Tanggal Tagihan</td>
                                <td>Status</td>
                                <td>Total Tagihan</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($tagihan as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->siswa->nisn }}</td>
                                <td>{{ $item->siswa->nama }}</td>
                                <td>{{ $item->siswa->angkatan }}</td>
                                <td>{{ $item->tanggal_tagihan->translatedFormat(config('app.format_tanggal')) }}</td>
                                <td>{{ $item->status }}</td>
                                <td>{{ formatRupiah($item->tagihanDetails->sum('jumlah_biaya')) }}</td>
                            </tr>
                            @empty
                            <tr>
                                <td coldspan="7">Data tidak ada</td>
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
