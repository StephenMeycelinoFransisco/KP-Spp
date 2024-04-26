<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>
        {{ @$title != '' ? "$title |" : '' }}
        {{ settings()->get('app_name', 'SMP XAVERIUS 1 JAMBI') }}
    </title>

    <style>
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }

        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
        }

        .invoice-box table td {
            vertical-align: top;
        }

        .invoice-box table tr td:nth-child(2) {
            text-align: left;
        }

        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.top table td.title {
            font-size: 45px;
            line-height: 45px;
            color: #333;
        }

        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }

        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.item td {
            border-bottom: 1px solid #eee;
        }

        .invoice-box table tr.item.last td {
            border-bottom: none;
        }

        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #eee;
            font-weight: bold;
        }

        @media only screen and (max-width: 600px) {
            .invoice-box table tr.top table td {
                width: 100%;
                display: block;
                text-align: center;
            }

            .invoice-box table tr.information table td {
                width: 100%;
                display: block;
                text-align: center;
            }
        }

        /** RTL **/
        .invoice-box.rtl {
            direction: rtl;
            font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        }

        .invoice-box.rtl table {
            text-align: right;
        }

        .invoice-box.rtl table tr td:nth-child(2) {
            text-align: left;
        }

        table tr td {
            border-bottom: 1px solid black;
        }
    </style>
</head>

<body>
    <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            {{-- <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="https://www.sparksuite.com/images/logo.png"
                                    style="width: 100%; max-width: 300px" />
                            </td>

                            <td>
                                Invoice #: {{ $tagihan->id }}<br />
                                Tanggal Tagihan: {{ $tagihan->tanggal_tagihan->translatedFormat('d F Y') }}<br />
                                Tanggal Jatuh Tempo: {{ $tagihan->tanggal_jatuh_tempo>translatedFormat('d F Y') }}<br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr> --}}
            {{-- <tr>
                <td width="80">
                    @if (request('output') == 'pdf')
                    <img src="{{ public_path() . 'storage/images/xray.png' }}" alt="" width="70">
                    @else
                    <img src="{{ asset('storage/images/xray.png') }}" alt="" width="70">
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
            </tr> --}}
            {{-- <tr>
                <td colspan="3 ">
                    <hr>
                </td>
            </tr>
            <tr class="information">
                <td colspan="3">
                    <table>
                        <tr>
                            <td>
                                Tagihan Untuk: {{ $tagihan->siswa->nama }} ({{ $tagihan->siswa->nisn }})
                                <br />
                                Kelas: {{ $tagihan->siswa->kelas }}
                                <br />
                                Jurusan: {{ $tagihan->siswa->jurusan }}
                            </td>

                            <td>
                                Invoice #: {{ $tagihan->id }}<br />
                                Tanggal Tagihan: {{ $tagihan->tanggal_tagihan->translatedFormat('d F Y') }}<br />
                                Tanggal Jatuh Tempo: {{ $tagihan->tanggal_jatuh_tempo->translatedFormat('d F Y')
                                }}<br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr> --}}

            {{-- <tr class="heading">
                <td>Payment Method</td>

                <td>Check #</td>
            </tr>

            <tr class="details">
                <td>Check</td>

                <td>1000</td>
            </tr> --}}

            <tr>
                <td width="25%">No.</td>
                <td>#{{ $pembayaran->id }}</td>
            </tr>
            <tr>
                <td>Telah terima dari</td>
                <td>: {{ $pembayaran->tagihan->siswa->nama }}</td>
            </tr>
            <tr>
                <td>Uang Sejumlah</td>
                <td>: <i>{{ ucwords(terbilang($pembayaran->jumlah_dibayar )) }} Rupiah</i></td>
            </tr>
            <tr>
                <td>Untuk Pembayara</td>
                <td>: SPP {{ $pembayaran->tagihan->tanggal_tagihan->translatedFormat('F Y') }}</td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            {{-- <tr class="total" style="background: #eee">
                <td colspan="2" style="text-align: center; font-weight: bold;">Total</td>
                <td>{{ formatRupiah($tagihan->total_tagihan) }}</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>
                        Terbilang: <i>{{ ucwords(terbilang($tagihan->total_tagihan)) }}</i>
                    </div>
                    <hr>
                </td>
            </tr> --}}
            <tr>
                <td colspan="2"></td>
                <br> <br>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td colspan="2" style="vertical-align: bottom;width:400">
                                <div style="background: #eee;width:100px;padding:10;font-weight:bold;">
                                    {{ formatRupiah($pembayaran->jumlah_dibayar) }}
                                </div>
                            </td>
                            <td>
                                Jambi, {{ $pembayaran->tanggal_bayar->translatedFormat('d, F Y') }} <br>
                                @include('informasi_pj')
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        <center>
            <a class="btn btn-primary" href="{{ url()->current() . '?output=pdf' }}" media="print">Download PDF</a>
            &nbsp;&nbsp;
            <a href="#" class="btn btn-primary" onclick="window.print()" media="print">Cetak</a>
        </center>
    </div>
    <style>
        @media print {
            [media="print"] {
                display: none !important;
            }
        }


        a {
            text-decoration: none;
        }

        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-primary:focus {
            color: #fff;
            background-color: #0069d9;
            border-color: #0062cc;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
        }

        .btn-primary:active {
            color: #fff;
            background-color: #0062cc;
            border-color: #005cbf;
        }

        .btn-primary:not(:disabled):not(.disabled).active,
        .btn-primary:not(:disabled):not(.disabled):active,
        .show>.btn-primary.dropdown-toggle {
            color: #fff;
            background-color: #0062cc;
            border-color: #005cbf;
        }

        .btn-primary:not(:disabled):not(.disabled).active:focus,
        .btn-primary:not(:disabled):not(.disabled):active:focus,
        .show>.btn-primary.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
        }
    </style>

</body>

</html>
