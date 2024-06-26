<?php

namespace App\Http\Controllers;

use App\Charts\SiswaKelasChart;
use App\Http\Requests\StoreSiswaRequest;
use App\Http\Requests\UpdateSiswaRequest;
use App\Models\Biaya;
use Illuminate\Http\Request;
use \App\Models\Siswa as Model;
use App\Models\User;
use Auth;
use Storage;

class SiswaController extends Controller
{
    private $viewIndex = 'siswa_index';
    private $viewCreate = 'siswa_form';
    private $viewEdit = 'siswa_form';
    private $viewShow = 'siswa_show';
    private $routePrefix = 'siswa';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, SiswaKelasChart $siswaKelasChart)
    {
        $models = Model::with('wali', 'user')->latest();
        if ($request->filled('q')) {
            $models = $models->search($request->q);
        }

        return view('operator.' . $this->viewIndex, [
            'models' => $models->paginate(settings()->get('app_pagination', '50')),
            'routePrefix' => $this->routePrefix,
            'title' => 'Data Siswa',
            'siswaKelasChart' => $siswaKelasChart->build()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'listBiaya' => Biaya::has('children')->whereNull('parent_id')->pluck('nama', 'id'),
            'model' => new Model(),
            'method' => 'POST',
            'route' => $this->routePrefix . '.store',
            'button' => 'SIMPAN',
            'title' => 'FORM DATA SISWA',
            'wali' => User::where('akses', 'wali')->pluck('name', 'id')
        ];
        return view('operator.' . $this->viewCreate, $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSiswaRequest $request)
    {
        $requestData = $request->validated();

        if ($request->hasFile('foto')) {
            $requestData['foto'] = $request->file('foto')->store('public');
        }

        if ($request->filled('wali_id')) {
            $requestData['wali_status'] = 'ok';
        }

        Model::create($requestData);
        flash('Data berhasil disimpan');
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('operator.' . $this->viewShow, [
            'model' => Model::findOrFail($id),
            'title' => 'Detail Siswa'
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = [
            'listBiaya' => Biaya::has('children')->whereNull('parent_id')->pluck('nama', 'id'),
            'model' => Model::findOrFail($id),
            'method' => 'PUT',
            'route' => [$this->routePrefix . '.update', $id],
            'button' => 'UPDATE',
            'title' => 'FORM DATA SISWA',
            'wali' => User::where('akses', 'wali')->pluck('name', 'id')
        ];
        return view('operator.' . $this->viewEdit, $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSiswaRequest $request, $id)
    {
        $requestData = $request->validated();
        $model = Model::findOrFail($id);

        if ($request->hasFile('foto')) {
            if ($model->foto != null && Storage::exists($model->foto)) {
                Storage::delete($model->foto);
            }
        }
        $requestData['foto'] = $request->file('foto')->store('public');

        if ($request->filled('wali_id')) {
            $requestData['wali_status'] = 'ok';
        }

        $model->fill($requestData);
        $model->save();
        flash('Data berhasil diubah');
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $siswa = Model::findOrFail($id);
        if ($siswa->tagihan->count() >= 1) {
            flash('Data tidak bisa dihapus karena masih memiliki tagihan')->error();
            return back();
        }
        $siswa->delete();
        flash('Data berhasil dihapus');
        return back();
    }
}
