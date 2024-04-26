<?php

namespace App\Http\Controllers;

use App\Models\Siswa;
use Illuminate\Http\Request;

class BerandaWaliController extends Controller
{
    public function index()
    {
        $siswa = Siswa::with('tagihan')->where('wali_id', auth()->user()->id)->orderBy('nama', 'asc')->get();
        $dataRekap = [];
        //Perulangan data siswa

        foreach ($siswa as $itemSiswa) {
            $dataTagihan = [];
            $tahun = date('Y');

            //Perulangan berdasarkan bulan Tagihan
            foreach (bulanSPP() as $bulan) {
                //membuat perulangan sebanyak 12 bulan untuk setiap data.
                // Jika bulan 1 maka tahun tambah 1 karena tagihan dari bulan juli sampai juli.
                if ($bulan == 1) {
                    $tahun = $tahun + 1;
                }
                //Mencari tagihan berdasarkan siswa, tahun dan bulan.
                $tagihan = $itemSiswa->tagihan->filter(function ($value) use ($bulan, $tahun) {
                    return $value->tanggal_tagihan->year == $tahun && $value->tanggal_tagihan->month == $bulan;
                })->first();

                if ($tagihan == null) {
                    $statusBayarTeks = "-";
                } else if ($tagihan->status != '') {
                    $statusBayarTeks = $tagihan->status;
                    $pembayaran = $tagihan->pembayaran->whereNull('tanggal_konfirmasi');
                    if($pembayaran->count() >= 1) {
                        $statusBayarTeks = "Belum dikonfirmasi";
                    }
                }

                //Masukkan data ke Array
                $dataTagihan[] = [
                    'bulan' => ubahNamaBulan($bulan),
                    'tahun' => $tahun,
                    'tagihan' => $tagihan,
                    'tanggal_lunas' => $tagihan?->tanggal_lunas ?? '-',
                    'status_bayar' => $tagihan?->status == 'baru' ? false : true,
                    'status_bayar_teks' => $statusBayarTeks
                ];
            }
            $dataRekap[] = [
                'siswa' => $itemSiswa,
                'dataTagihan' => $dataTagihan,
            ];
        }

        $data['header'] = bulanSPP();
        $data['dataRekap'] = $dataRekap;

        return view('wali.beranda_index', $data);
    }
}
