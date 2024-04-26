<?php

namespace App\Http\Controllers;

use App\Charts\TagihanBulananChart;
use App\Models\Pembayaran;
use App\Models\Siswa;
use App\Models\Tagihan;
use Illuminate\Http\Request;

class BerandaOperatorController extends Controller
{
    public function index(TagihanBulananChart $tagihanBulananChart)
    {
        $tahun = date('Y');
        $bulan = date('m');
        $data['siswa'] = Siswa::get();
        $pembayaran = Pembayaran::whereYear('tanggal_bayar', $tahun)->whereMonth('tanggal_bayar', $bulan)->get();

        $data['totalPembayaran'] = $pembayaran->sum('jumlah_dibayar');
        $data['totalSiswaSudahBayar'] = $pembayaran->count();

        $tagihan = Tagihan::with('siswa')->whereYear('tanggal_tagihan', $tahun)->whereMonth('tanggal_tagihan', $bulan)->get();
        $tagihanPerKelas = $tagihan->groupBy('siswa.kelas')->sortKeys();

        $tagihanBelumBayar = $tagihan->where('status', '<>', 'lunas');
        $tagihanSudahBayar = $tagihan->where('status', 'lunas');

        $data['tagihanPerKelas'] = $tagihanPerKelas;
        $data['totalTagihan'] = $tagihan->count();
        $data['tagihanBelumBayar'] = $tagihanBelumBayar;
        $data['tagihanSudahBayar'] = $tagihanSudahBayar;

        $data['tahun'] = $tahun;
        $data['bulan'] = $bulan;
        // $data['bulanTeks'] = ubahNamaBulan($bulan);
        $data['dataPembayaranBelumKonfirmasi']  = Pembayaran::whereNull('tanggal_konfirmasi')->get();

        $data['tagihanChart'] = $tagihanBulananChart->build([
            $tagihanBelumBayar->count(),
            $tagihanSudahBayar->count(),
        ]);

        return view('operator.beranda_index', $data);
    }

}
