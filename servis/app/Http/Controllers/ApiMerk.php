<?php

namespace App\Http\Controllers;

use App\Models\Merk;
use App\Models\User;
use App\Models\Motor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ApiMerk extends Controller
{

    public function store(Request $request)
    {
        $validator_unique = Validator::make($request->all(), [
            'jenismerk' => 'required|unique:merk|jenismerk',
        ]);
        if ($validator_unique->fails()) {
            return $data = [
                'status' => false,
                'message' => 'Merk sudah terdaftar',
            ];
        }
        $motor = new Motor();      
        $motor->jenismerk = $request->jenismerk;
        $motor->save();
        $id = $motor->id;

        return $data = [
            'status' => true,
            'id' => $id,
        ];

    }
    
    public function listmerk($id)
    {
        $motor = Merk::where('iduser', $id)->get();      
        return Response::json($motor);
    }
    public function show($id){
        $motor = Merk::where('idmotor',$id)->get();
        return Response::json($motor);
    }
    public function delete($id){
        $motor = Merk::where('idmotor',$id)->delete();
        return Response::json($motor);
    }

}
