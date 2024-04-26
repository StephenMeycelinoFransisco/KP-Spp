<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class WaliNotificationController extends Controller
{
    public function update(Request $request, $id)
    {
        auth()->user()->unreadNotification->where('id',$id)->first()?->markAsRead();
        flash('Data sudah dihapus');
        return back();
    }
}
