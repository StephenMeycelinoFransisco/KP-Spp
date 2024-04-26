<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Siswa;
use App\Models\Tagihan;
use Illuminate\Http\Request;

class LaporanRekapPembayaran extends Controller
{
    public function index(Request $request)
    {
        $siswa = Siswa::with('tagihan')->orderBy('nama', 'asc');
        if ($request->filled('kelas_id')) {
            $siswa->where('kelas_id', $request->kelas_id);
        }
        $siswa = $siswa->get();
        // $dataRekap = [];   
        //Perulangan data siswa
        foreach ($siswa as $itemSiswa) {
            $dataTagihan = [];
            $tahun = $request->tahun;
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

                //Masukkan data ke Array
                $dataTagihan[] = [
                    'bulan' => ubahNamaBulan($bulan),
                    'tahun' => $tahun,
                    'tanggal_lunas' => $tagihan->tanggal_lunas ?? '-',
                ];
            }
            $dataRekap[] = [
                'siswa' => $itemSiswa,
                'dataTagihan' => $dataTagihan,
            ];
        }

        $data['header'] = bulanSPP();
        $data['dataRekap'] = $dataRekap;
        $data['title'] = "Rekap Tagihan";

        return view('operator.laporanrekappembayaran_index', $data);
    }
}
