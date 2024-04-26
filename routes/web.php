<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BankSekolahController;
use App\Http\Controllers\BerandaOperatorController;
use App\Http\Controllers\BerandaWaliController;
use App\Http\Controllers\BiayaController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\KartuSppController;
use App\Http\Controllers\KwitansiPembayaranController;
use App\Http\Controllers\LaporanFormController;
use App\Http\Controllers\LaporanPembayaranController;
use App\Http\Controllers\LaporanRekapPembayaran;
use App\Http\Controllers\LaporanTagihanController;
use App\Http\Controllers\PanduanPembayaranController;
use App\Http\Controllers\PembayaranController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\StatusController;
use App\Http\Controllers\TagihanController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WaliController;
use App\Http\Controllers\WaliMuridInvoiceController;
use App\Http\Controllers\WaliMuridPembayaranController;
use App\Http\Controllers\WaliMuridProfilController;
use App\Http\Controllers\WaliMuridSiswaController;
use App\Http\Controllers\WaliMuridTagihanController;
use App\Http\Controllers\WaliNotificationController;
use App\Http\Controllers\WaliSiswaController;
use Illuminate\Routing\RouteRegistrar;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpKernel\EventListener\RouterListener;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', function () {
    return view('landing_page');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('panduan-pembayaran/{id}', [PanduanPembayaranController::class, 'index'])->name('panduan.pembayaran');

Route::prefix('operator')->middleware(['auth', 'auth.operator'])->group(function () {
    //ini route khusus untuk operator
    Route::get('beranda', [BerandaOperatorController::class, 'index'])->name('operator.beranda');
    Route::resource('user', UserController::class);
    Route::resource('banksekolah', BankSekolahController::class);
    Route::resource('wali', WaliController::class);
    Route::resource('siswa', SiswaController::class);
    Route::resource('walisiswa', WaliSiswaController::class);
    Route::resource('biaya', BiayaController::class);
    Route::resource('tagihan', TagihanController::class);
    Route::resource('pembayaran', PembayaranController::class);
    Route::resource('setting', SettingController::class);
    Route::get('delete-biaya-item{id}', [BiayaController::class, 'deleteItem'])->name('delete-biaya.item');
    Route::get('status/update', [StatusController::class, 'update'])->name('status.update');
    Route::get('laporanform/create', [LaporanFormController::class, 'create'])->name('laporanform.create');
    Route::get('laporantagihan', [LaporanTagihanController::class, 'index'])->name('laporantagihan.index');
    Route::get('laporanpembayaran', [LaporanPembayaranController::class, 'index'])->name('laporanpembayaran.index');
    Route::get('laporanrekappembayaran', [LaporanRekapPembayaran::class, 'index'])->name('laporanrekappembayaran.index');
});

Route::get('login-wali', [LoginController::class, 'showLoginFormWali'])->name('login.wali');

Route::prefix('walimurid')->middleware(['auth', 'auth.wali'])->name('wali.')->group(function () {
    //ini route khusus untuk wali-murid
    Route::get('beranda', [BerandaWaliController::class, 'index'])->name('beranda');
    Route::resource('siswa', WaliMuridSiswaController::class);
    Route::resource('tagihan', WaliMuridTagihanController::class);
    Route::resource('pembayaran', WaliMuridPembayaranController::class);
    Route::resource('profil', WaliMuridProfilController::class);
    Route::resource('notifikasi', WaliNotificationController::class);
});

Route::get('kartuspp', [KartuSppController::class, 'index'])->name('kartuspp.index')->middleware('auth');
Route::resource('invoice', InvoiceController::class)->middleware('auth');
Route::get('kwitansi-pembayaran/{id}', [KwitansiPembayaranController::class, 'show'])->name('kwitansipembayaran.show')->middleware('auth');

Route::prefix('admin')->middleware(['auth', 'auth.admin'])->group(function () {
    //ini route khusus untuk admin
});

Route::get('logout', function () {
    Auth::logout();
    return redirect('login');
})->name('logout');
