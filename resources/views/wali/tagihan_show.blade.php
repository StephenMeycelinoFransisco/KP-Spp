@extends('layouts.app_sneat_wali')
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">TAGIHAN SPP {{ strtoupper($siswa->nama) }}</h5>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <table class="table table-sm table-borderless">
                                <tr>
                                    <td rowspan="8" width="100" class="align-top">
                                        <img src="{{ \Storage::url($siswa->foto) }}" alt="{{ $siswa->nama }}"
                                            width="100">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50">NISN</td>
                                    <td>: {{ $siswa->nisn }}</td>
                                </tr>
                                <tr>
                                    <td>Nama</td>
                                    <td>: {{ $siswa->nama }}</td>
                                </tr>
                                <tr>
                                    <td>Jurusan</td>
                                    <td>: {{ $siswa->jurusan }}</td>
                                </tr>
                                <tr>
                                    <td>Angkatan</td>
                                    <td>: {{ $siswa->angkatan }}</td>
                                </tr>
                                <tr>
                                    <td>Kelas</td>
                                    <td>: {{ $siswa->kelas }}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <table>
                                <tr>
                                    <td>No. Tagihan</td>
                                    <td>: #SDN5{{ $tagihan->id }}</td>
                                </tr>
                                <tr>
                                    <td>Tgl. Tagihan</td>
                                    <td>: {{ $tagihan->tanggal_tagihan->format('d F Y') }}</td>
                                </tr>
                                <tr>
                                    <td>Tgl. Jatuh Tempo</td>
                                    <td>: {{ $tagihan->tanggal_jatuh_tempo->format('d F Y') }}</td>
                                </tr>
                                <tr>
                                    <td>Status Pembayaran</td>
                                    <td>: {{ $tagihan->getStatusTagihanWali() }}</td>
                                </tr>
                                <tr>

                                    <td colspan="2">
                                        <a href="{{ route('invoice.show', $tagihan->id) }}" target="blank"><i
                                                class="fa fa-file-pdf"></i>
                                            Cetak Invoice Tagihan
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <table class="table table-sm table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <td width="1%">No</td>
                                <td>Nama Tagihan</td>
                                <td class="text-end">Jumlah Tagihan</td>
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
                                <td colspan="2" class="text-center fw-bold">Total Pembayaran</td>
                                <td class="text-end">{{ formatRupiah($tagihan->tagihanDetails->sum('jumlah_biaya')) }}
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="alert alert-secondary mt-4" role="alert" style="color: black">
                        Pembayaran bisa dilakukan dengan cara langsung ke Operator sekolah atau di Transfer melalui
                        Rekening milik sekolah dibawah ini:
                        <br>
                        <u><i>Jangan melakukan transfer ke Rekening selain dari Rekening dibawah ini.</i></u>
                        <br>
                        Silahkan lihat tata cara melakukan pembayaran melalui <a
                            href="{{ route('panduan.pembayaran', 'atm') }}" target="blank">ATM</a> atau <a
                            href="{{ route('panduan.pembayaran', 'internet-banking') }}" target="blank">Internet
                            Banking</a>.
                        <br>
                        Setelah melakukan pembayaran silahkan upload bukti pembayaran melalui tombol konfirmasi yang ada
                        dibawah ini:
                    </div>
                    <ul>
                        <li><a href="{{ route('panduan.pembayaran', 'atm') }}" target="blank">Lihat Cara Pembayaran
                                melalui ATM</a>
                        </li>
                        <li><a href="{{ route('panduan.pembayaran', 'internet-banking') }}" target="blank">Lihat Cara
                                Pembayaran
                                melalui Internet Banking</a></li>
                    </ul>
                    <div class="row">
                        @foreach ($banksekolah as $itemBank)
                        <div class="col-md-6">
                            <div class="alert alert-primary" role="alert">
                                <table width="100%">
                                    <tbody>
                                        <tr>
                                            <td width="30%">Bank Tujuan</td>
                                            <td>: {{ $itemBank->nama_bank}}</td>
                                        </tr>
                                        <tr>
                                            <td>Nomor Rekening</td>
                                            <td>: {{ $itemBank->nomor_rekening }}</td>
                                        </tr>
                                        <tr>
                                            <td>Atas Nama</td>
                                            <td>: {{ $itemBank->nama_rekening }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="{{ route('wali.pembayaran.create', [
                                            'tagihan_id' => $tagihan->id,
                                            'bank_sekolah_id' => $itemBank->id,
                                        ]) }}" class="btn btn-primary mt-3">Konfirmasi Pembayaran</a>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
