<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Motor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ApiMotor extends Controller
{

    public function store(Request $request)
    {
        $validator_unique = Validator::make($request->all(), [
            'plat' => 'required|unique:motor|nopolisi',
        ]);
        if ($validator_unique->fails()) {
            return $data = [
                'status' => false,
                'message' => 'NoPol sudah terdaftar',
            ];
        }
        $motor = new Motor();
        $motor->iduser = $request->userid;
        $motor->nopolisi = $request->userid;
        $motor->idmerk = $request->idmerk;
        $motor->jenismerk = $request->jenismerk;
        $motor->save();
        $id = $motor->id;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function listmotor($id)
    {
        $motor = Motor::where('iduser', $id)->get();      
        return Response::json($motor);
    }
    public function show($id){
        $motor = Motor::where('idmotor',$id)->get();
        return Response::json($motor);
    }
    public function delete($id){
        $motor = Motor::where('idmotor',$id)->delete();
        return Response::json($motor);
    }
}
