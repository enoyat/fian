<?php

use App\Http\Controllers\ApiMerk;
use App\Http\Controllers\ApiMotor;
use App\Http\Controllers\ApiPelayanan;
use App\Http\Controllers\ApiReservasi;
use Illuminate\Support\Facades\Route;

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
Route::group(['middleware' => 'check-token'], function () {
});
Route::get('/kirimemail', 'App\Http\Controllers\BerandaEmailController@index');
Route::post('gantipassword', 'App\Http\Controllers\ApiAuthController@gantipassword');

Route::post('store', [ApiMotor::class, 'store']);
Route::get('listmotor', [ApiMotor::class, 'listmotor']);
Route::get('show/{id}', [ApiMotor::class, 'show']);
Route::delete('delete/{id}', [ApiMotor::class, 'delete']);

Route::post('merk/store', [ApiMerk::class, 'store']);
Route::get('merk/listmerk', [ApiMerk::class, 'listmerk']);
Route::get('merk/show/{id}', [ApiMerk::class, 'show']);
Route::delete('merk/delete/{id}', [ApiMerk::class, 'delete']);

Route::post('reservasi/store', [ApiReservasi::class, 'store']);
Route::get('reservasi/listreservasi/{id}', [ApiReservasi::class, 'listreservasi']);
Route::get('reservasi/show/{id}', [ApiReservasi::class, 'show']);
Route::delete('reservasi/delete/{id}', [ApiReservasi::class, 'delete']);

Route::post('pelayanan/store', [ApiPelayanan::class, 'store']);
Route::get('pelayanan/listpelayanan/{id}', [ApiPelayanan::class, 'listpelayanan']);
Route::get('pelayanan/show/{id}', [ApiPelayanan::class, 'show']);
Route::delete('pelayanan/delete/{id}', [ApiPelayanan::class, 'delete']);

Route::post('register', 'App\Http\Controllers\ApiAuthController@register');
Route::post('apimedia', 'App\Http\Controllers\ApiMedia@store');
Route::post('login', 'App\Http\Controllers\ApiAuthController@login');
