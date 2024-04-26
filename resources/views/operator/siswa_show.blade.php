@extends('layouts.app_sneat')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">{{ $title }}</h5>
            <div class="card-body">
                <div class="table-responsive">
                    <img src="{{ \Storage::url($model->foto) }}" alt="" width="150">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <td width="15%">Status Siswa</td>
                                <td>: <span
                                        class="badge {{ $model->status == 'aktif' ? 'bg-primary' : 'bg-danger' }}">{{
                                        $model->status }}</span></td>
                            </tr>
                            <tr>
                                <td>Nama</td>
                                <td>: {{ $model->nama }}</td>
                            </tr>
                            <tr>
                                <td>NISN</td>
                                <td>: {{ $model->nisn }}</td>
                            </tr>
                            <tr>
                                <td>Jurusan</td>
                                <td>: {{ $model->jurusan }}</td>
                            </tr>
                            <tr>
                                <td>Kelas</td>
                                <td>: {{ $model->kelas }}</td>
                            </tr>
                            <tr>
                                <td>Angkatan</td>
                                <td>: {{ $model->angkatan }}</td>
                            </tr>
                            <tr>
                                <td>Tanggal Buat</td>
                                <td>: {{ $model->created_at->format('d/m.Y H:i') }}</td>
                            </tr>
                            <tr>
                                <td>Tanggal Ubah</td>
                                <td>: {{ $model->updated_at->format('d/m.Y H:i') }}</td>
                            </tr>
                            <tr>
                                <td>Dibuat Oleh</td>
                                <td>: {{ $model->user->name }}</td>
                            </tr>
                        </thead>
                        <table class="table table-bordered table-sm">
                            <h5 class="mt-3">Total Tagihan</h6>

                                <thead class="table-dark text-white">
                                    <tr>
                                        <th class="text-white">No</th>
                                        <th class="text-white">Item Tagihan</th>
                                        <th class="text-white">Jumlah Tagihan</th>
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
                                    <td colspan="2" class="fw-bold">Total Tagihan</td>
                                    <td class="text-end fw-bold"> {{
                                        formatRupiah($model->biaya->children->sum('jumlah'))
                                        }}
                                    </td>
                                </tfoot>
                        </table>
                        <div class="col-md-12 m-2">
                            <a href="{{ route('status.update', [
                                        'model' => 'siswa',
                                        'id' =>$model->id,
                                        'status' => $model->status == 'aktif' ? 'non-aktif' : 'aktif',
                                    ]) }}" class="btn btn-primary btn-sm mt-3" onclick="return confirm('Anda yakin?')">
                                {{ $model->status == 'aktif' ? 'Non-Aktifkan Siswa Ini' : 'Aktifkan Siswa Ini' }}
                            </a>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
