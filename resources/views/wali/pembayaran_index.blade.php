@extends('layouts.app_sneat_wali')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header">DATA PEMBAYARAN</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            {!! Form::open(['route' => 'wali.pembayaran.index', 'method' => 'GET']) !!}
                            <div class="row">
                                <div class="col">
                                    {!! Form::selectMonth('bulan', request('bulan'), ['class' => 'form-control']) !!}
                                </div>
                                <div class="col">
                                    {!! Form::selectRange('tahun', 2022, date('Y')+1, request('tahun'), ['class' => 'form-control']) !!}    
                                </div>
                                <div class="col">
                                <button class="btn btn-primary" type="submit">Tampil</button>
                                </div>
                            </div>
                        {!! Form::close() !!}
                        </div>
                    </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>NISN</td>
                                <td>Nama</td>
                                <td>Nama Wali</td>
                                <td>Metode Pembayaran</td>
                                <td>Status Konfirmasi</td>
                                <td>Tanggal Konfirmasi</td>
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
                                    <td>{{ $item->tanggal_konfirmasi }}</td>
                                    <td>
                                        <a href="{{ route('wali.pembayaran.show', $item->id) }}"
                                            class="btn btn-info btn-sm mx-3">
                                            <i class="fa fa-edit"></i> Detail
                                        </a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td coldspan="4">Data tidak ada</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                    {!! $models->links() !!}
                </div>
                </div>
            </div>
        </div>
    </div>
@endsection
