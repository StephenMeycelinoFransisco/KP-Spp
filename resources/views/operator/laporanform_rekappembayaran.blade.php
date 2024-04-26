{!! Form::open(['route' => 'laporanrekappembayaran.index', 'method' => 'GET', 'target' => 'blank'])
!!}
<div class="row gx-2">
    <div class="col-md-2 col-sm-12">
        <label for="kelas">Kelas</label>
        {!! Form::select('kelas', getNamakelas(), null, ['class'=> 'form-control',
        'placeholder' => 'Pilih Kelas...']) !!}
        <span class="text-denger">{{ $errors->first('kelas') }}</span>
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