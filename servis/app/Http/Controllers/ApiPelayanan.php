<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
use App\Models\Pelayanan;
use App\Models\Rekam;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;


class ApiPelayanan extends Controller
{

    public function listpelayanan($id)
    {
        $dokumen = Pelayanan::join('reservasi','pelayanan.idpelayanan','=','reservasi.idpelayanan')
        ->join('users','pelayanan.iduser','=','users.id')
        ->where('pelayanan.iduser',$id)
        ->where('pendaftaran.status','aktif')
        ->select('pendaftaran.*','jadwal.*', 'dokter.namadokter')
        ->get();
        return Response::json($dokumen);
    }
    public function listhistory($id)
    {
        $dokumen = Pelayanan::join('dokter','rekam.iddokter','=','dokter.id')
        ->where('rekam.idpasien',$id)
        ->select('rekam.*','dokter.namadokter')
        ->orderby('tanggal','desc')
        ->get();
        return Response::json($dokumen);
    }
    public function show($id){
        $dokumen = Pelayanan::where('idpelayanan',$id)->get();
        return Response::json($dokumen);
    }


}
