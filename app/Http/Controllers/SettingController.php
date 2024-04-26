<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Settings;

class SettingController extends Controller
{
    public function create()
    {
        return view('operator.setting_form');
    }

    public function store(Request $request)
    {
        $dataSetting = $request->except('_token');

        if ($request->hasFile('pj_ttd')) {
            $request->validate([
                'pj_ttd' => 'required|mimes:png,jpg,jpeg|max:5000'
            ]);
            $dataSetting['pj_ttd'] = $request->file('pj_ttd')->store('public');
        }

        if ($request->hasFile('app_logo')) {
            $request->validate([
                'app_logo' => 'required|mimes:png,jpg,jpeg|max:5000'
            ]);
            $dataSetting['app_logo'] = $request->file('app_logo')->store('public');
        }

        settings()->set($dataSetting);
        flash('Data Sudah Disimpan');
        return back();
    }
}
