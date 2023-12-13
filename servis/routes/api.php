<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiTransaction;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['middleware' => 'check-token'], function(){
});
Route::get('/kirimemail','App\Http\Controllers\BerandaEmailController@index');
Route::post('gantipassword', 'App\Http\Controllers\ApiAuthController@gantipassword');
Route::group(['prefix' => 'transaction'], function () {
    Route::get('/', [ApiTransaction::class, 'index'])->name('transaction.index');
    Route::get('show/{id}', [ApiTransaction::class, 'show'])->name('transaction.show');
    Route::get('edit/{id}', [ApiTransaction::class, 'edit'])->name('transaction.edit');
    Route::post('destroy', [ApiTransaction::class, 'destroy'])->name('transaction.destroy');
    Route::post('update', [ApiTransaction::class, 'update'])->name('transaction.update');
    Route::post('store', [ApiTransaction::class, 'store'])->name('transaction.store');
    Route::get('getaccount', [ApiTransaction::class, 'getaccount'])->name('transaction.getaccount');
    Route::get('listtransaction', [ApiTransaction::class, 'listtransaction'])->name('transaction.listtransaction');
    Route::get('listdonetransaction', [ApiTransaction::class, 'listdonetransaction'])->name('transaction.listdonetransaction');


});  
Route::resource('jadwal', 'App\Http\Controllers\ApiJadwal');
Route::get('listpendaftaran/{id}', 'App\Http\Controllers\ApiPasien@listpendaftaran');
Route::get('listrekam/{id}', 'App\Http\Controllers\ApiPasien@listrekam');

Route::post('register', 'App\Http\Controllers\ApiAuthController@register');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
Route::post('login', 'App\Http\Controllers\ApiAuthController@login');



Route::prefix('pasien')->group(function () {
    Route::get('show/{id}', 'App\Http\Controllers\Apipasien@show');
    Route::post('update', 'App\Http\Controllers\Apipasien@update');
    Route::get('getprofil', 'App\Http\Controllers\Apipasien@getprofil');
});
