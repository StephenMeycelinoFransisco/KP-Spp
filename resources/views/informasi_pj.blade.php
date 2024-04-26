Mengetahui, <br>
@if (request('output') == 'pdf')
    <img src="{{ storage_path() . '/app/' . settings()->get('pj_ttd') }}" alt="" width="70">
@else
    <img src="{{ Storage::url(settings()->get('pj_ttd')) }}" width="130" alt="" srcset="">
@endif

<div style="width:200px;border-bottom:1px solid black">{{ settings()->get('pj_nama') }}
</div>
<div>
    {{ settings()->get('pj_jabatan') }}
</div>
