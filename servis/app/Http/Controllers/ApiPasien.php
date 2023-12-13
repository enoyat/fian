<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
use App\Models\Pendaftaran;
use App\Models\Rekam;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;


class ApiPasien extends Controller
{

    public function listpendaftaran($id)
    {
        $dokumen = Pendaftaran::join('jadwal','pendaftaran.idjadwal','=','jadwal.id')
        ->join('dokter','jadwal.iddokter','=','dokter.id')
        ->where('pendaftaran.idpasien',$id)
        ->where('pendaftaran.status','aktif')
        ->select('pendaftaran.*','jadwal.*', 'dokter.namadokter')
        ->get();
        return Response::json($dokumen);
    }
    public function listrekam($id)
    {
        $dokumen = Rekam::join('dokter','rekam.iddokter','=','dokter.id')
        ->where('rekam.idpasien',$id)
        ->select('rekam.*','dokter.namadokter')
        ->orderby('tanggal','desc')
        ->get();
        return Response::json($dokumen);
    }
    public function show($id){
        $dokumen = Jadwal::where('id',$id)->get();
        return Response::json($dokumen);
    }


}
