<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Jadwal;
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
        $validator_unique = Validator::make($request->all(), [
            'idpelayanan' => 'required|unique:reservasi|idpelayanan',
        ]);
        if ($validator_unique->fails()) {
            return $data = [
                'status' => false,
                'message' => 'Layanan sudah terdaftar',
            ];
        }
        $motor = new Reservasi();      
        $motor->idpelayanan = $request->idpelayanan;
        $motor->idmekanik = $request->idmekanik;
        $motor->save();
        $id = $motor->id;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function listreservasi($id)
    {
       
        $reservasi = Reservasi::join('pelayanan','reservasi.idpelayanan','=','pelayanan.idpelayanan')->where('iduser', $id)->get();      
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

}
