@extends('layouts.app_sneat_wali')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">DATA SISWA</h5>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td width="1%">No</td>
                                <td>Nama Siswa</td>
                                <td>Jurusan</td>
                                <td>Kelas</td>
                                <td>Angkatan</td>
                                <td>Kartu SPP</td>
                                <td>Biaya Sekolah</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($models as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>
                                    <div>{{ $item->nama }}</div>
                                    <div>{{ $item->nisn }}</div>
                                </td>
                                <td>{{ $item->jurusan }}</td>
                                <td>{{ $item->kelas }}</td>
                                <td>{{ $item->angkatan }}</td>
                                <td>
                                    <a href="{{ route('kartuspp.index',[
                                        'siswa_id' => $item->id,
                                        'tahun' => request('tahun'),
                                        ]) }}" target="blank"><i class="fa fa-print"></i> Download
                                        {{
                                        request('tahun') }}
                                    </a>
                                </td>
                                <td class="text-end">
                                    <a href="{{ route('wali.siswa.show', $item->id) }}">
                                        {{ formatRupiah($item->biaya->total_tagihan) }}
                                        <i class="fa fa-arrow-alt-circle-right"></i>
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
                </div>
            </div>
        </div>
    </div>
</div>
@endsection