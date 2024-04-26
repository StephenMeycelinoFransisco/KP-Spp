@extends('layouts.app_sneat')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">DATA PEMBAYARAN</h5>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        {!! Form::open(['route' => 'pembayaran.index', 'method' => 'GET']) !!}
                        <div class="row gx-2">
                            <div class="col-md-3 col-sm-12">
                                {!! Form::text('q', request('q'), ['class' => 'form-control', 'placeholder' =>
                                'Pencarian Data Siswa...']) !!}
                            </div>
                            <div class="col-md-2 col-sm-12">
                                {!! Form::select('status', [
                                '' => 'Pilih Status..',
                                'sudah-konfirmasi' => 'Sudah Dikonfirmasi',
                                'belum-konfirmasi' => 'Belum Dikonfirmasi',
                                ], request('status'), ['class' => 'form-control']) !!}
                            </div>
                            <div class="col-md-2 col-sm-12">
                                {!! Form::selectMonth('bulan', request('bulan'), ['class' => 'form-control',
                                'placeholder' => 'Pilih Bulan...']) !!}
                            </div>
                            <div class="col-md-2 col-sm-12">
                                {!! Form::selectRange('tahun', 2022, date('Y')+1, request('tahun'), ['class' =>
                                'form-control']) !!}
                            </div>
                            <div class="col-md-3 col-sm-12">
                                <button class="btn btn-primary" type="submit">Tampil</button>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td width="1%">No</td>
                                <td width="5%">NISN</td>
                                <td width="10%">Nama</td>
                                <td width="5%">Nama Wali</td>
                                <td width="5%">Metode Pembayaran</td>
                                <td>Status Konfirmasi</td>
                                <td>Tanggal Konfirmasi</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($models as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->tagihan->siswa->nisn }}</td>
                                <td>{{ $item->tagihan->siswa->nama }}</td>
                                <td>{{ $item->wali->name }}</td>
                                <td>{{ $item->metode_pembayaran }}</td>
                                <td>{{ $item->status_konfirmasi }}</td>
                                <td>
                                    @if ($item->tanggal_konfirmasi == null)
                                    Belum dikonfirmasi
                                    @else
                                    {{ $item->tanggal_konfirmasi->format('d/m/Y')}}
                                    @endif
                                </td>
                                <td>
                                    {!! Form::open([
                                    'route' => [ 'pembayaran.destroy', $item->id],
                                    'method' => 'DELETE',
                                    'onsubmit' => 'return confirm("Yakin ingin menghapus data ini?")',
                                    ]) !!}
                                    <a href="{{ route('pembayaran.show', $item->id) }}"
                                        class="btn btn-info btn-sm mx-3">
                                        <i class="fa fa-edit"></i> Detail
                                    </a>
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <i class="fa fa-trash"></i>Hapus
                                    </button>
                                    {!! Form::close() !!}
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td coldspan="4">Data tidak ada</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                    <div class="mt-3">
                        {!! $models->links() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
