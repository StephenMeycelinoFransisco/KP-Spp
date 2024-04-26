@extends('layouts.app_sneat')
@section('js')
<script>
    $(document).ready(function () {
            $("#loading-spinner").hide();
            $("#form-ajax").submit(function (e) {
                $.ajax({
                    type: $(this).attr('method'),
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",
                    beforeSend : function (){
                        $("#loading-spinner").show();
                        $("#loading-overlay").removeClass('d-none');
                    },
                    success: function (response) {
                        $("#alert-message").removeClass('d-none');
                        $("#alert-message").html(response.message);
                        $("#loading-overlay").addClass('d-none');
                        $("#loading-spinner").hide();
                    }
                });
                e.preventDefault();

            });
        });
</script>
@endsection
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header">{{ $title }}</h5>
            <div class="card-body">
                {!! Form::model($model, [
                'route' => $route,
                'method' => $method,
                'id' => 'form-ajax',
                ]) !!}
                <div class="form-group">
                    <label for="tanggal_tagihan">Tanggal Tagihan</label>
                    {!! Form::date('tanggal_tagihan', $model->tanggal_tagihan ?? date('Y-m-').'01',
                    ['class'=>'form-control']) !!}
                    <span class="text-danger"> {{ $errors->first('tanggal_tagihan') }} </span>
                </div>
                <div class="form-group mt-3">
                    <label for="tanggal_jatuh_tempo">Tanggal Jatuh Tempo</label>
                    {!! Form::date('tanggal_jatuh_tempo', $model->tanggal_jatuh_tempo ?? date('Y-m-').'10',
                    ['class'=>'form-control']) !!}
                    <span class="text-danger"> {{ $errors->first('tanggal_jatuh_tempo') }} </span>
                </div>
                <div class="form-group mt-3">
                    <label for="keterangan">Keterangan</label>
                    {!! Form::textarea('keterangan', null, ['class' => 'form-control', 'rows' => 3]) !!}
                    <span class="text-danger"> {{ $errors->first('keterangan') }} </span>
                </div>
                <button class="btn btn-primary mt-3" type="submit">
                    <span id="loading-spinner" class="spinner-border spinner-border-sm" role="status"
                        aria-hidden="true"></span>
                    {{ $button }}
                </button>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
</div>
@endsection
