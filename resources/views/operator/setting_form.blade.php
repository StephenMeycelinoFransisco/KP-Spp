@extends('layouts.app_sneat', ['title'=>'Beranda Pengaturan'])
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-header">Pengaturan Sistem</h5>
                <div class="card-body">
                    {!! Form::open([
                        'route' => 'setting.store',
                        'method' => 'POST',
                        'files' => true,
                    ]) !!}
                        <h6>Pengaturan Sekolah</h6>

                        <div class="form-group mt-3">
                            <label for="app_logo">Logo Instansi(Format: jpg, png, ukuran file maks: 5mb)</label>
                            {!! Form::file("app_logo", ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('app_logo') }}</span>
                            <img src="{{ \Storage::url(settings()->get('app_logo')) }}" width="100">
                        </div>

                        <div class="form-group mt-3">
                            <label for="app_name">Nama Sekolah</label>
                            {!! Form::text('app_name', settings()->get('app_name'), ['class' => 'form-control','autofocus']) !!}
                            <span class="text-denger">{{ $errors->first('app_name') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="app_email">Email Sekolah</label>
                            {!! Form::text('app_email', settings()->get('app_email'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('app_email') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="app_phone">Nomor Telepon Sekolah</label>
                            {!! Form::text('app_phone', settings()->get('app_phone'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('app_phone') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="app_address">Alamat Sekolah</label>
                            {!! Form::textarea('app_address', settings()->get('app_address'), ['class' => 'form-control', 'rows' => 3,]) !!}
                            <span class="text-denger">{{ $errors->first('app_address') }}</span>
                        </div>
                        <hr>

                        <h5>Pengaturan Penanggung Jawab atau Bendahara</h5>
                        <div class="alert alert-info" role="alert">
                            Data penangggung jawab yang diinput di form ini akan tampil di kwitansi, invoice, dan kartu SPP.
                        </div>
                        <div class="form-group mt-3">
                            <label for="pj_nama">Nama Penanggung Jawab (ex:Bendahara)</label>
                            {!! Form::text('pj_nama', settings()->get('pj_nama'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('pj_nama') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="pj_jabatan">Nama Jabatan (ex:Bendahara)</label>
                            {!! Form::text('pj_jabatan', settings()->get('pj_jabatan'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('pj_jabatan') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="pj_ttd">Upload Gambar Tanda Tangan (Format: jpg, png, ukuran file maks: 5mb)</label>
                            {!! Form::file("pj_ttd", ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('pj_ttd') }}</span>
                            <img src="{{ \Storage::url(settings()->get('pj_ttd')) }}" width="200">
                        </div>

                        <hr>
                        <h5>Pengaturan Aplikasi</h5>
                        <div class="form-group mt-3">
                            <label for="app_pagination">Data Per Halaman</label>
                            {!! Form::number('app_pagination', settings()->get('app_pagination'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('app_pagination') }}</span>
                        </div>

                        <div class="form-group mt-3">
                            <label for="no_wa_operator">Nomor WhatsApp Operator / Penanggung Jawab Sistem (contoh: 6282188778221)</label>
                            {!! Form::number('no_wa_operator', settings()->get('no_wa_operator'), ['class' => 'form-control']) !!}
                            <span class="text-denger">{{ $errors->first('no_wa_operator') }}</span>
                        </div>
                    {!! Form::submit('UPDATE', ['class' => 'btn btn-primary mt-3']) !!}
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
