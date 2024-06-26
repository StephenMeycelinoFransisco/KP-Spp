<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Siswa>
 */
class SiswaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'wali_id' => fake()->randomElement(User::where('akses','wali')->pluck('id')->toArray()),
            'wali_status' => 'ok',
            'nama' => fake()->name(),
            'nisn' => fake()->numberBetween(1000000000,9999999999),
            'jurusan' => fake()->randomElement(['IPA', 'IPS']),
            'kelas' => fake()->randomElement(['10', '11', '12']),
            'angkatan' =>fake()->randomElement(['2021','2022','2023']),
            'user_id' => 1,
            'biaya_id' => 1
        ];
    }
}
