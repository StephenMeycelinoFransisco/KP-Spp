@extends('layouts.app_sneat')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">{{ $title }}</h5>

            <div class="card-body">
                <a href="{{ route($routePrefix . '.create') }}" class="btn btn-primary btn-sm">Tambah Data</a>
                {!! Form::open(['route' => $routePrefix . '.index', 'method' => 'GET']) !!}
                <div class="input-group mt-2 mb-2">
                    <input name="q" type="text" class="form-control" placeholder="Cari Data" aria-label="Cari Data"
                        aria-describedby="button-addon2" value="{{ request('q') }}">
                    <button class="btn btn-outline-primary" type="submit" id="button-addon2">
                        <i class="bx bx-search"></i>
                    </button>
                </div>
                {!! Form::close() !!}
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <td>No</td>
                                <td>Nama Biaya</td>
                                <td>Total Tagihan</td>
                                <td>Created By</td>
                                <td>Aksi</td>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($models as $item)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item->nama }}</td>
                                <td>{{ formatRupiah($item->total_tagihan) }}</td>
                                <td>{{ $item->user->name }}</td>
                                <td>
                                    {!! Form::open([
                                    'route' => [$routePrefix . '.destroy', $item->id],
                                    'method' => 'DELETE',
                                    'onsubmit' => 'return confirm("Yakin ingin menghapus data ini?")',
                                    ]) !!}
                                    <a href="{{ route($routePrefix . '.create', ['parent_id' =>$item->id]) }}"
                                        class="btn btn-info btn-sm ">
                                        <i class="fa fa-edit"></i> Item
                                    </a>
                                    <a href="{{ route($routePrefix . '.edit', $item->id) }}"
                                        class="btn btn-warning btn-sm mx-2">
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
                    {!! $models->links() !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection