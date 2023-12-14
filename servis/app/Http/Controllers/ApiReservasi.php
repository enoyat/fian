<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
use App\Models\Pendaftaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;


class ApiReservasi extends Controller
{

    public function index()
    {
        $dokumen = Jadwal::join('dokter','jadwal.iddokter','=','dokter.id')->select('jadwal.*','dokter.namadokter')->get();
        return Response::json($dokumen);
    }
    public function show($id){
        $dokumen = Jadwal::where('id',$id)->get();
        return Response::json($dokumen);
    }
    public function store(Request $request){
        $Pendaftaran = new Pendaftaran();
        $Pendaftaran->idjadwal = $request->idjadwal;
        $Pendaftaran->idpasien = $request->idpasien;
        $Pendaftaran->mediadaftar = 'online';
        $Pendaftaran->status = 'aktif';
        $Pendaftaran->save();
        $id=$Pendaftaran->id;
        $xnoantrian=Jadwal::where('id',$request->idjadwal)->first();
        $noantrian=$xnoantrian->jmlpendaftar;
        Pendaftaran::where('id',$id)->update(['noantrian'=>$noantrian]);
        return Response::json($Pendaftaran);
    }

}
