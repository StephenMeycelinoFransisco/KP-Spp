@extends('layouts.app_sneat_wali')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">DATA TAGIHAN SPP</h5>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td>No</td>
                                <td>Nama</td>
                                <td>Jurusan</td>
                                <td>Kelas</td>
                                <td>Tanggal Tagihan</td>
                                <td>Tanggal Pembayaran</td>
                                <td>Status Pembayaran</td>
                                <td>Aksi</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($tagihan as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->siswa->nama }}</td>
                                <td>{{ $item->siswa->jurusan }}</td>
                                <td>{{ $item->kelas }}</td>
                                <td>{{ $item->tanggal_tagihan->translatedFormat('F Y') }}</td>
                                <td>
                                    @if ($item->pembayaran->count() >= 1)
                                    <a href="{{ route('wali.pembayaran.show', $item->pembayaran->first()->id) }}"
                                        class="btn btn-success btn-sm">
                                        {{ $item->pembayaran->first()->tanggal_konfirmasi == null ? 'Belum dikonfirmasi'
                                        : 'Sudah dibayar'}}
                                    </a>
                                    @else
                                    {{ $item->getStatusTagihanWali() }}
                                    @endif
                                </td>
                                <td>
                                    @if ($item->status == 'baru' || $item->status == 'angsur')
                                    <a href="{{ route('wali.tagihan.show', $item->id) }}"
                                        class="btn btn-primary btn-sm">Lakukan Pembayaran</a>
                                    @else
                                    <a href="" class="btn btn-success btn-sm">Pembayaran Sudah Lunas</a>
                                    @endif
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td coldspan="4">Data tidak ada</td>
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
