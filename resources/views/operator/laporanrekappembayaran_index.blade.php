    @extends('layouts.app_sneat_blank')
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"></h5>
            <div class="card-body">
                @include('operator.laporan_header')
                <h4 class="mt-4">Laporan Rekap</h4>
                Laporan Berdasarkan: {{ $title }}
                <div class="table-responsive mt-3">
                    <table class="{{ config('app.table_style') }}">
                        <thead class="{{ config('app.thead_style') }}">
                            <tr>
                                <th width="1%" class="text-white">No</th>
                                <th class="text-white">Nama Siswa</th>
                                @foreach ($header as $bulan)
                                <th class="text-white">{{ ubahNamaBulan($bulan) }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataRekap as $item)
                            <tr class="text-center">
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $item['siswa']['nama'] }}</td>
                                @foreach ($item['dataTagihan'] as $itemTagihan)
                                <td>
                                    @if ($itemTagihan['tanggal_lunas'] != "-")
                                    {{ optional($itemTagihan['tanggal_lunas'])->format('d') }}/
                                    {{ optional($itemTagihan['tanggal_lunas'])->format('m') }}
                                    <div>
                                        {{ optional($itemTagihan['tanggal_lunas'])->format('Y') }}

                                    </div>
                                    @else
                                    -
                                    @endif
                                </td>
                                @endforeach
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
