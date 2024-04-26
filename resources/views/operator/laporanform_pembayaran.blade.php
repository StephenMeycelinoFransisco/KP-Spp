{!! Form::open(['route' => 'laporanpembayaran.index', 'method' => 'GET', 'target' => 'blank'])
!!}
<div class="row gx-2">
    <div class="col-md-2 col-sm-12">
        <label for="kelas">Kelas</label>
        {!! Form::select('kelas', getNamakelas(), null, ['class'=> 'form-control',
        'placeholder' => 'Pilih Kelas...']) !!}
        <span class="text-denger">{{ $errors->first('kelas') }}</span>
    </div>
    <div class="col-md-2 col-sm-12">
        <label for="angkatan">Angkatan</label>
        {!! Form::selectRange('angkatan', 2022, date('Y')+1, null, ['class'=>'form-control',
        'placeholder' => 'Pilih Angkatan...']) !!}
        <span class="text-denger">{{ $errors->first('angkatan') }}</span>
    </div>
    <div class="col-md-2 col-sm-12">
        <label for="bulan">Status Pembayaran</label>
        {!! Form::select('status', [
        '' => 'Pilih Status..',
        'sudah-konfirmasi' => 'Sudah Dikonfirmasi',
        'belum-konfirmasi' => 'Belum Dikonfirmasi',
        ], request('status'), ['class' => 'form-control']) !!}
    </div>
    <div class="col-md-2 col-sm-12">
        <label for="bulan">Bulan</label>
        {!! Form::selectMonth('bulan', request('bulan'), ['class' => 'form-control',
        'placeholder' => 'Pilih Bulan...']) !!}
    </div>
    <div class="col-md-2 col-sm-12">
        <label for="bulan">Tahun</label>
        {!! Form::selectRange('tahun', 2022, date('Y')+1, request('tahun'), ['class' =>
        'form-control']) !!}
    </div>
    <div class="col-md-3 col-sm-12">
        <button class="btn btn-primary mt-4" type="submit">Tampil</button>
    </div>
</div>
{!! Form::close() !!}