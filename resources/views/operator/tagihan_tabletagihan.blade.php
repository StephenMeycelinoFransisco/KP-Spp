<div class="card">
    <h5 class="card-header pb-0">Data Tagihan {{ $periode }}</h5>
    <div class="card-body">
        <div class="mt-2 mb-2">
            <a href="{{ route('invoice.show', $tagihan->id) }}" target="_blank">
                <i class="fa fa-file-pdf"></i>Download Invoice</a>
        </div>
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th class="text-white" width="1%">No</th>
                <th class="text-white">Nama Tagihan</th>
                    <th class="text-white text-end">Jumlah Tagihan</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($tagihan->tagihanDetails as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $item->nama_biaya }}</td>
                    <td class="text-end">{{ formatRupiah($item->jumlah_biaya) }}</td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">Total Tagihan</td>
                    <td class="text-end">{{ formatRupiah($tagihan->total_tagihan) }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
