<div class="card">
    <h5 class="card-header m-0">Kartu SPP</h5>
    <div class="card-body">
        <div class="mb-2">
            <a href="{{ route('kartuspp.index',[
                'siswa_id' => $siswa->id,
                'tahun' => request('tahun'),
            ]) }}" target="blank"><i class="fa fa-print"></i> Cetak Kartu
                Tagihan
                {{
                request('tahun') }}</a>
        </div>
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr style="height: 50px">
                    <th width="1%" style="text-align: center" class="text-white">No</th>
                    <th style="text-align: start" class="text-white">Bulan</th>
                    <th style="text-align: center" class="text-white">Jumlah Tagihan</th>
                    <th style="text-align: center" class="text-white">Tanggal Bayar</th>
                    <th class="text-white">Paraf</th>
                </tr>
            </thead>
            @foreach ($kartuSpp as $item)
            <tr class="item">
                <td style="text-align: center">{{ $loop->iteration }}</td>
                <td style="text-align: start">{{ $item['bulan'] . ' ' . $item['tahun'] }}</td>
                <td style="text-align: end">{{ formatRupiah($item['total_tagihan']) }}</td>
                <td style="text-align: end">{{ $item['tanggal_bayar']}}</td>
                <td>&nbsp;</td>
            </tr>
            @endforeach
        </table>
    </div>
</div>