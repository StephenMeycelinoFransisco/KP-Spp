@extends('layouts.app_sneat_wali')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">{{ $title }}</h5>
            <div class="card-body">
                <div class="table-responsive">
                    <img src="{{ \Storage::url($model->foto ?? 'images/no-images.jpeg') }}" alt="" width="150">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <td width="15%">Status Siswa</td>
                                <td>: <span
                                        class="badge {{ $model->status == 'aktif' ? 'bg-primary' : 'bg-danger' }}">{{
                                        $model->status }}</span></td>
                            </tr>
                            <tr>
                                <td>NAMA</td>
                                <td>: {{ $model->nama }}</td>
                            </tr>
                            <tr>
                                <td>NISN</td>
                                <td>: {{ $model->nisn }}</td>
                            </tr>
                            <tr>
                                <td>JURUSAN</td>
                                <td>: {{ $model->jurusan }}</td>
                            </tr>
                            <tr>
                                <td>KELAS</td>
                                <td>: {{ $model->kelas }}</td>
                            </tr>
                            <tr>
                                <td>ANGKATAN</td>
                                <td>: {{ $model->angkatan }}</td>
                            </tr>
                            <tr>
                                <td>TANGGAL BUAT</td>
                                <td>: {{ $model->created_at->format('d/m.Y H:i') }}</td>
                            </tr>
                            <tr>
                                <td>TANGGAL BUAT</td>
                                <td>: {{ $model->updated_at->format('d/m.Y H:i') }}</td>
                            </tr>
                            <tr>
                                <td>DIBUAT OLEH</td>
                                <td>: {{ $model->user->name }}</td>
                            </tr>
                        </thead>
                    </table>
                    <h6 class="mt-3">Tagihan SPP</h6>
                    <div class="row">
                        <div class="col-md-5">
                            <table class="{{ config('app.table_style') }}">
                                <thead class="{{ config('app.thead_style') }}">
                                    <tr>
                                        <th>No</th>
                                        <th>Item Tagihan</th>
                                        <th>Jumlah Tagihan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($model->biaya->children as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->nama }}</td>
                                        <td class="text-end">{{ formatRupiah($item->jumlah) }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <td colspan="2">Total Tagihan</td>
                                    <td class="text-end fa-bold">
                                        {{ formatRupiah($model->biaya->children->sum('jumlah')) }}
                                    </td>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <a href="{{ route('kartuspp.index', [
                        'siswa_id' => $model->id,
                        'tahun' => date('Y'),
                    ]) }}" target="_blank"><i class="fa fa-file-pdf"> Download Kartu SPP</i></a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
