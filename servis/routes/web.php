<?php
use App\Http\Controllers\Administrator\HomeController;
use App\Http\Controllers\Administrator\HomeDokterController;
use App\Http\Controllers\UtilityController;
use App\Http\Controllers\PasienController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\PendaftaranController;

use App\Http\Controllers\LaporanTransaksi;
use App\Http\Controllers\RekamController;
use App\Http\Controllers\UserAdminController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/register', function () {
    return view('register');
});


Route::post('utility/postregister', [UtilityController::class, 'postregister'])->name('utility.postregister');
Route::get('/access', [App\Http\Controllers\HomeController::class, 'access'])->name('access');
// Roles Administrator

Route::group(['middleware' => ['web', 'auth', 'roles']], function () {
    Route::group(['roles' => ['administrator', 'dokter', 'pasien']], function () {
        Route::get('utility/gantipassword', [UtilityController::class, 'gantipassword'])->name('utility.gantipassword');
        Route::post('utility/userpasswordupdate', [UtilityController::class, 'userpasswordupdate'])->name('utility.userpasswordupdate');

       
    });
    Route::group(['roles' => ['administrator','dokter']], function () {
        Route::get('administrator/dokter', [HomeDokterController::class, 'index'])->name('administrator.dokter.index');
        Route::group(['prefix' => 'pendaftaran'], function () {
            Route::get('getpendaftar/{id}', [PendaftaranController::class, 'getpendaftar'])->name('pendaftaran.getpendaftar');
            Route::get('create/{id}', [PendaftaranController::class, 'create'])->name('pendaftaran.create');
            Route::post('destroy', [PendaftaranController::class, 'destroy'])->name('pendaftaran.destroy');
            Route::post('store', [PendaftaranController::class, 'store'])->name('pendaftaran.store');
        });
        Route::group(['prefix' => 'jadwal'], function () {
            Route::get('/jadwaldokter', [JadwalController::class, 'jadwaldokter'])->name('jadwal.jadwaldokter');

        });  
        Route::get('getpasien', [PasienController::class, 'getpasien'])->name('pasien.getpasien');
        Route::get('create', [RekamController::class, 'create'])->name('rekam.create');
        Route::get('rekam', [RekamController::class, 'index'])->name('rekam.index');
        Route::post('rekam/store', [RekamController::class, 'store'])->name('rekam.store');
    });

    Route::group(['roles' => ['administrator']], function () {
        Route::get('administrator/home', [HomeController::class, 'index'])->name('administrator.home.index');

        
        Route::group(['prefix' => 'pasien'], function () {
            Route::get('/', [PasienController::class, 'index'])->name('pasien.index');
            Route::get('create', [PasienController::class, 'create'])->name('pasien.create');
            Route::post('store', [PasienController::class, 'store'])->name('pasien.store');
            Route::get('show/{id}', [PasienController::class, 'show'])->name('pasien.show');
            Route::get('edit/{id}', [PasienController::class, 'edit'])->name('pasien.edit');

            Route::post('destroy', [PasienController::class, 'destroy'])->name('pasien.destroy');
            Route::post('update', [PasienController::class, 'update'])->name('pasien.update');

        });     
        Route::group(['prefix' => 'dokter'], function () {
            Route::get('/', [DokterController::class, 'index'])->name('dokter.index');
            Route::get('create', [DokterController::class, 'create'])->name('dokter.create');
            Route::post('store', [DokterController::class, 'store'])->name('dokter.store');
            Route::get('show/{id}', [DokterController::class, 'show'])->name('dokter.show');
            Route::get('edit/{id}', [DokterController::class, 'edit'])->name('dokter.edit');
            Route::get('getdokter', [DokterController::class, 'getinfocenter'])->name('dokter.getdokter');
            Route::post('destroy', [DokterController::class, 'destroy'])->name('dokter.destroy');
            Route::post('update', [DokterController::class, 'update'])->name('dokter.update');

        });   
        Route::group(['prefix' => 'jadwal'], function () {
            Route::get('/', [JadwalController::class, 'index'])->name('jadwal.index');
            Route::get('create', [JadwalController::class, 'create'])->name('jadwal.create');
            Route::post('store', [JadwalController::class, 'store'])->name('jadwal.store');
            Route::get('show/{id}', [JadwalController::class, 'show'])->name('jadwal.show');
            Route::get('edit/{id}', [JadwalController::class, 'edit'])->name('jadwal.edit');
            Route::post('destroy', [JadwalController::class, 'destroy'])->name('jadwal.destroy');
            Route::post('update', [JadwalController::class, 'update'])->name('jadwal.update');

        });  
        Route::group(['prefix' => 'rekam'], function () {
            Route::get('show/{id}', [RekamController::class, 'show'])->name('rekam.show');
            Route::get('edit/{id}', [RekamController::class, 'edit'])->name('rekam.edit');
            Route::post('destroy', [RekamController::class, 'destroy'])->name('rekam.destroy');
            Route::post('update', [RekamController::class, 'update'])->name('rekam.update');

        });  
        Route::group(['prefix' => 'admin'], function () {
            //Route::get('/', [UserAdminController::class, 'index'])->name('administrator.home.index');
            Route::get('getadmin', [UserAdminController::class, 'getinfocenter'])->name('admin.getadmin');
            Route::get('create', [UserAdminController::class, 'create'])->name('admin.create');
            Route::post('store', [UserAdminController::class, 'store'])->name('admin.store');


        });  
       

        Route::get('utility/userpassword', [UtilityController::class, 'userpassword'])->name('utility.userpassword');
        Route::get('utility/register', [UtilityController::class, 'register'])->name('utility.register');
       
        Route::delete('utility/userdelete/{id}', [UtilityController::class, 'userdelete'])->name('userdelete');

        Route::group(['prefix' => 'laporan'], function () {
            Route::get('rpttransaction', [LaporanTransaksi::class, 'rpttransaction'])->name('laporan.rpttransaction');
            Route::post('laporantransaction', [laporanTransaksi::class, 'laporantransaction'])->name('laporan.laporantransaction');
            Route::get('viewlaporantransaction', [laporanTransaksi::class, 'viewlaporantransaction'])->name('laporan.viewlaporantransaction');

            Route::get('exporttransaction', [LaporanTransaksi::class, 'exporttransaction'])->name('laporan.exporttransaction');
            Route::post('laporanexporttransaction', [laporanTransaksi::class, 'laporanexporttransaction'])->name('laporan.laporanexporttransaction');


        }); 

        

    });
});

Auth::routes(
    [
        'register' => false, // Register Routes...
    ]
);

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
