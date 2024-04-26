<div class="card mt-2">
    <h5 class="card-header pb-3">Data Pembayaran</h5>
    <div class="card-body">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th class="text-white">Tanggal</th>
                    <th class="text-white">Metode</th>
                    <th class="text-white">Jumlah</th>
                    <th class="text-white">#</th>

                </tr>
            </thead>
            <tbody>
                @foreach ($tagihan->pembayaran as $item)
                <tr>

                    <td>{{ $item->tanggal_bayar->translatedFormat('d/m/Y') }}</td>
                    <td>{{ $item->metode_pembayaran }}</td>
                    <td class="text-end">{{ formatRupiah($item->jumlah_dibayar) }}</td>
                    <td>

                        {!! Form::open([
                        'route' => ['pembayaran.destroy', $item->id],
                        'method' => 'DELETE',
                        'onsubmit' => 'return confirm("Yakin ingin menghapus data ini?")',
                        ]) !!}

                        <a href="{{ route('kwitansipembayaran.show', $item->id) }}" target="blank"><i
                                class="fa fa-print"></i>
                        </a>

                        <button type="submit" class="btn">
                            <i class="fa fa-trash"></i>
                        </button>
                        {!! Form::close() !!}
                    </td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">Total Pembayaran</td>
                    <td class="text-end">{{ formatRupiah($tagihan->total_pembayaran )}}</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
        <h5 class="mt-2">Status Pembayaran : {{ strtoupper($tagihan->status) }}</h5>
        <h5 class="card-header">Form Pembayaran</h5>
        <div class="card-body">
            {!! Form::model($model, ['route' => 'pembayaran.store', 'method' => 'POST']) !!}
            {!! Form::hidden('tagihan_id', $tagihan->id, []) !!}
            <div class="form-group">
                <label for="tanggal_bayar">Tanggal Pembayaran</label>
                {!! Form::date('tanggal_bayar', $model->tanggal_bayar ?? \Carbon\Carbon::now(), ['class' =>
                'form-control']) !!}
                <span class="text-danger">{{ $errors->first('tanggal_bayar') }}</span>
            </div>
            <div class="form-group mt-3">
                <label for="jumlah_dibayar">Jumlah Yang Dibayarkan</label>
                {!! Form::text('jumlah_dibayar', $tagihan->total_tagihan, ['class' => 'form-control rupiah'])
                !!}
                <span class="text-denger">{{ $errors->first('jumlah_dibayar') }}</span>
            </div>
            {!! Form::submit('SIMPAN', ['class' => 'btn btn-primary mt-3']) !!}
            {!! Form::close() !!}
        </div>
    </div>
</div>