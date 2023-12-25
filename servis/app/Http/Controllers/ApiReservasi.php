<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
use App\Models\Pelayanan;
use App\Models\Pendaftaran;
use App\Models\Reservasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class ApiReservasi extends Controller
{
    public function store(Request $request)
    {
        
        $motor = new Reservasi();      
        $motor->idpelayanan = $request->idpelayanan;
        $motor->idmekanik = $request->idmekanik;
        $motor->tglreservasi = $request->tglreservasi;
        $motor->jam = $request->jam;
        $motor->statusreservasi = $request->statusreservasi;
        $motor->save();
        $id = $motor->idreservasi;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    public function listreservasiadmin()
    {
       
        $reservasi = Reservasi::join('pelayanan','reservasi.idpelayanan','=','pelayanan.idpelayanan')
        ->join('motor','pelayanan.idmotor','=','motor.idmotor')
        ->join('jenismerk','motor.idjenismerk','=','jenismerk.idjenismerk')
        ->where('statusreservasi', "baru")
        ->get();           
        return Response::json($reservasi);
    }
    public function historyreservasi()
    {
       
        $reservasi = Reservasi::join('pelayanan','reservasi.idpelayanan','=','pelayanan.idpelayanan')
        ->join('motor','pelayanan.idmotor','=','motor.idmotor')
        ->join('jenismerk','motor.idjenismerk','=','jenismerk.idjenismerk')
        ->get();           
        return Response::json($reservasi);
    }
    public function listreservasi($id)
    {
       
        $reservasi = Reservasi::join('pelayanan','reservasi.idpelayanan','=','pelayanan.idpelayanan')->where('iduser', $id)->get();      
        return Response::json($reservasi);
    }
    public function listgetreservasi($id, $status)
    {
       
        $reservasi = Reservasi::join('pelayanan','reservasi.idpelayanan','=','pelayanan.idpelayanan')
        ->join('motor','pelayanan.idmotor','=','motor.idmotor')
        ->join('jenismerk','motor.idjenismerk','=','jenismerk.idjenismerk')
        ->where('statusreservasi', $status)
        ->where('pelayanan.iduser', $id)->get();      
        return Response::json($reservasi);
    }
    public function show($id){
        $reservasi = Reservasi::where('idservasi',$id)->get();
        return Response::json($reservasi);
    }
    public function delete($id){
        $reservasi = Reservasi::where('idservasi',$id)->delete();
        return Response::json($reservasi);
    }
    public function reservasiselesai(Request $request){
        $reservasi = Reservasi::where('idreservasi',$request->idreservasi)->update([
            'statusreservasi' => "finish"]);
            Pelayanan::where('idpelayanan',$request->idpelayanan)->update([
                'statuspelayanan' => "finish"]);
        return Response::json($reservasi);
    }
}
