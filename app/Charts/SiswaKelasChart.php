<?php

namespace App\Charts;

use App\Models\Siswa;
use ArielMejiaDev\LarapexCharts\LarapexChart;

class SiswaKelasChart
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build(): \ArielMejiaDev\LarapexCharts\PieChart
    {

        $siswaKelas = Siswa::get();
        $data = [
            $siswaKelas->where('kelas', 10)->count(),
            $siswaKelas->where('kelas', 11)->count(),
            $siswaKelas->where('kelas', 12)->count(),

        ];
        $label = [
            'Kelas 10',
            'Kelas 11',
            'Kelas 12',
        ];

        return $this->chart->pieChart()
            ->setTitle('Data Siswa Perkelas')
            ->setSubtitle(date('Y'))
            ->addData($data)
            ->setLabels($label);
    }
}
