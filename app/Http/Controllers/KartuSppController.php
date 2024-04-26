<?php

namespace App\Http\Controllers;

use App\Models\Tagihan;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Auth;
use App\Models\Siswa;

class KartuSppController extends Controller
{
    public function index(Request $request)
    {
        if (Auth::user()->akses == 'wali') {
            $siswa = Siswa::where('wali_id', Auth::user()->id)
                ->where('id', $request->siswa_id)
                ->firstOrFail();
        } else {
            $siswa = Siswa::with('tagihan')->findOrFail($request->siswa_id);
        }
        
        $tahun = $request->tahun;
        $arrayData = [];
        foreach (bulanSPP() as $bulan) {
            if ($bulan == 1) {
                $tahun = $tahun + 1;
            }

            //Mencari tagihan berdasarkan siswa, tahun dan bulan.
            $tagihan = $siswa->tagihan->filter(function ($value) use ($bulan, $tahun) {
                return $value->tanggal_tagihan->year == $tahun && $value->tanggal_tagihan->month == $bulan;
            })->first();

            //Kondisi dimana tagihan memiliki nilai dan tagihannya tidak dengan status baru dan pembayarannya akan dihutung lebih dari 0.
            //Mengambil data tanggal bayara dari pembayaran.
            $tanggalBayar = '';
            if ($tagihan != null && $tagihan->status != 'baru') {
                $tanggalBayar = $tagihan->pembayaran->first()->tanggal_bayar->format('d/m/y');
            }

            //Mendeskripsikan data yang ingin diambil.
            $arrayData[] = [
                'bulan' => ubahNamaBulan($bulan),
                'tahun' => $tahun,
                'total_tagihan' => $tagihan->total_tagihan ?? 0,
                'status_tagihan' => ($tagihan == null) ? false : true,
                'status_pembayaran' => ($tagihan == null) ? 'Belum Bayar' : $tagihan->status,
                'tanggal_bayar' => $tanggalBayar,
            ];
        }

        //Print Pdf
        if ($request->output == 'pdf') {
            $pdf = Pdf::loadView('kartuspp_index',  [
                'kartuSpp' => collect($arrayData),
                'siswa' => $siswa
            ]);
            $namaFile = 'Kartu SPP ' . $siswa->nama . ' Tahun ' . $request->tahun . '.pdf';
            return $pdf->download($namaFile);
        }

        //Menampilkan tampilan kartu spp
        return view('kartuspp_index', [
            'kartuSpp' => collect($arrayData),
            'siswa' => $siswa
        ]);
    }
}
