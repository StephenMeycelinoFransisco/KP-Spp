<?php

namespace App\Http\Controllers;

use App\Models\Siswa;
use Illuminate\Http\Request;

class WaliSiswaController extends Controller
{


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'wali_id' => 'required|exists:users,id',
            'siswa_id' => 'required'
        ]);
        $siswa = \App\Models\Siswa::find($request->siswa_id);
        $siswa->wali_id = $request->wali_id;
        $siswa->wali_status = 'OK';
        $siswa->save();
        flash('Data Sudah Ditambahkan') ;
        return back();
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $siswa = \App\Models\Siswa::findOrFail($id);
        $siswa->wali_id = null;
        $siswa->wali_status = null;
        $siswa->save();
        flash('Data Sudah Dihapus')->success();
        return back();
    }
}
