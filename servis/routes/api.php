<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiMotor;
use App\Http\Controllers\ApiMerk;
use App\Http\Controllers\ApiReservasi;
use App\Http\Controllers\ApiPelayanan;

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
Route::group(['prefix' => 'motor'], function () {
    Route::post('store', [ApiMotor::class, 'store'])->name('motor.store');
    Route::get('listmotor', [ApiMotor::class, 'listmotor'])->name('motor.listmotor');
    Route::get('show/{id}', [ApiMotor::class, 'show'])->name('motor.show');
    Route::delete('delete/{id}', [ApiMotor::class, 'delete'])->name('motor.delete');
});  
Route::group(['prefix' => 'merk'], function () {
    Route::post('store', [ApiMerk::class, 'store'])->name('merk.store');
    Route::get('listmerk', [ApiMerk::class, 'listmerk'])->name('merk.listmerk');
    Route::get('show/{id}', [ApiMerk::class, 'show'])->name('merk.show');
    Route::delete('delete/{id}', [ApiMerk::class, 'delete'])->name('merk.delete');
});  
Route::group(['prefix' => 'reservasi'], function () {
    Route::post('store', [ApiReservasi::class, 'store'])->name('reservasi.store');
    Route::get('listreservasi', [ApiReservasi::class, 'listreservasi'])->name('reservasi.listreservasi');
    Route::get('show/{id}', [ApiReservasi::class, 'show'])->name('reservasi.show');
    Route::delete('delete/{id}', [ApiReservasi::class, 'delete'])->name('reservasi.delete');
});  
Route::group(['prefix' => 'pelayanan'], function () {
    Route::post('store', [ApiPelayanan::class, 'store'])->name('pelayanan.store');
    Route::get('listrepelayanan', [ApiPelayanan::class, 'listrepelayanan'])->name('pelayanan.listrepelayanan');
    Route::get('show/{id}', [ApiPelayanan::class, 'show'])->name('pelayanan.show');
    Route::delete('delete/{id}', [ApiPelayanan::class, 'delete'])->name('pelayanan.delete');
});  


Route::post('register', 'App\Http\Controllers\ApiAuthController@register');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
Route::post('login', 'App\Http\Controllers\ApiAuthController@login');

