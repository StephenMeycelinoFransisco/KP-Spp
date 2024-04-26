@extends('layouts.app_sneat')
@section('content')

<div class="row">
    <div class="col">
        <div class="card mb-3">
            <div class="card-body ">
                {!! $siswaKelasChart->container() !!}
            </div>
        </div>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">{{ $title }}</h5>

            <div class="card-body">
                <a href="{{ route($routePrefix . '.create') }}" class="btn btn-primary btn-sm">Tambah Data</a>
                {!! Form::open(['route' => $routePrefix . '.index', 'method' => 'GET']) !!}
                <div class="input-group mt-2 mb-2">
                    <input name="q" type="text" class="form-control" placeholder="Cari Nama Siswa"
                        aria-label="Cari Nama" aria-describedby="button-addon2" value="{{ request('q') }}">
                    <button class="btn btn-outline-primary" type="submit" id="button-addon2">
                        <i class="bx bx-search"></i>
                    </button>
                </div>
                {!! Form::close() !!}
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td witdh="1%">No</td>
                                <td width="10%">Nama Wali Murid</td>
                                <td width="10%">Nama Siswa</td>
                                <td>NISN</td>
                                <td width="1%">Jurusan</td>
                                <td width="1%">Kelas</td>
                                <td>Angkatan</td>
                                <td>Biaya SPP</td>
                                <td>Aksi</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($models as $item)
                            <tr>
                                <td witdh="1%">{{ $loop->iteration }}</td>
                                <td>{{ $item->wali->name ?? 'Belum ada'}}</td>
                                <td>{{ $item->nama }}</td>
                                <td>{{ $item->nisn }}</td>
                                <td>{{ $item->jurusan }}</td>
                                <td>{{ $item->kelas }}</td>
                                <td>{{ $item->angkatan }}</td>
                                <td>{{ formatRupiah($item->biaya?->first()->total_tagihan ) }}</td>
                                <td>
                                    {!! Form::open([
                                    'route' => [$routePrefix . '.destroy', $item->id],
                                    'method' => 'DELETE',
                                    'onsubmit' => 'return confirm("Yakin ingin menghapus data ini?")',
                                    ]) !!}
                                    <a href="{{ route($routePrefix . '.show', $item->id) }}"
                                        class="btn btn-info btn-sm">
                                        <i class="fa fa-edit"></i> Detail
                                    </a>
                                    <a href="{{ route($routePrefix . '.edit', $item->id) }}"
                                        class="btn btn-warning btn-sm">
                                        <i class="fa fa-edit"></i> Edit
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
<script src="{{ $siswaKelasChart->cdn() }}"></script>
{{ $siswaKelasChart->script() }}
@endsection
