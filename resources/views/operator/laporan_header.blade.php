<div class="row">
    <table>
        <tr>
            <td width="85">
                @if (request('output') == 'pdf')
                <img src="{{ public_path() . '/images/FFP.png' }}" alt="" width="70">
                @else
                <img src="{{ asset('/images/FFP.png') }}" alt="" width="70">
                @endif
            </td>
            <td style="text-align:left;vertical-align: middle;">
                <div style="font-size: 20px;font-weight:bold">
                    {{ settings()->get('app_name' , 'SMP XAVERIUS 1') }}
                </div>
                <div>
                    {{ settings()->get('app_address') }}
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td class="text-end" align="bottom">
                <span class="mx-3">
                    Email: {{ settings()->get('app_email') }}
                </span>
                <span>
                    Telp: {{ settings()->get('app_phone') }}
                </span>
                &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
</div>
<hr class="p-0 m-0">
