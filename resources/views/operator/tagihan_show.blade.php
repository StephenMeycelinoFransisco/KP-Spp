@extends('layouts.app_sneat')
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        @include('operator.tagihan_datasiswa')
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-5">
        @include('operator.tagihan_tabletagihan')
        @include('operator.tagihan_tablepembayaran')
    </div>
    <div class="col-md-7">
        @include('operator.tagihan_table_kartuspp')
    </div>
</div>
@endsection