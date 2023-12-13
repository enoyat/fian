<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Trorder;
use App\Models\Transaction;
use App\Models\Pasien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;

class ApiTransaction extends Controller
{
    public function index()
    {
        $transaction = Transaction::get();
        return Response::json($transaction);
    }

    public function store(Request $request)
    {

        $transaction = new Transaction();
        $transaction->pasienid = $request->pasienid;
        $transaction->iddokumen = $request->iddokumen;
        $transaction->datepickup = date('Y-m-d');
        $transaction->catatan= $request->catatan;
        $transaction->status = $request->status;
        $transaction->save();
        $id = $transaction->id;


        $result = Transaction::find($id);
        return  Response::json($result);
    }

    public function uploadgallery(Request $request)
    {
        $file = $request->filefoto;
        $pathUpload = 'assets/inventory';

        $extension = $file->getClientOriginalExtension();
        $filename = time() . "." . $extension;
        $file->move($pathUpload, $filename);
        return redirect()->back();
    }

    public function listtransaction(Request $request)
    {
      
        $transaction = Transaction::join('dokumen','dokumen.id','=','transactions.iddokumen')       
        ->orderby('transactions.id','desc')   
        ->where('pasienid',$request->pasienid)  
        ->where('transactions.status','!=','cancel')
        ->where('transactions.status','!=','done')
        ->select('transactions.*','dokumen.namadokumen')
        ->get();
    
        return Response::json($transaction);
    }
    public function listdonetransaction(Request $request)
    {
      
        $transaction = Transaction::join('dokumen','dokumen.id','=','transactions.iddokumen')       
        ->orderby('transactions.id','desc')   
        ->where('pasienid',$request->pasienid)  
        ->where('transactions.status','!=','cancel')
        ->where('transactions.status','=','done')
        ->select('transactions.*','dokumen.namadokumen')
        ->get();
    
        return Response::json($transaction);
    }
    public function listorder($id)
    {
        $cart = Trorder::where('id', $id)->get();
        return Response::json($cart);
    }
    
    

    public function gettransaction(Request $request)
    {
        $transaction = Transaction::join('pasien','pasien.id','=','transactions.pasienid')
        ->join('users','users.id','=','pasien.userid')
        ->where('transactions.id',$request->id)
        ->select('transactions.*','users.name','users.email','pasien.nohp','pasien.address','pasien.latitude','pasien.longitude')
        ->get();
        return Response::json($transaction);
    }
    public function canceltransaction(Request $request)
    {
        $transaction = Transaction::where('id',$request->id)->update(
            ['status' => 'cancel']
        );
        return Response::json($transaction);
    }
    public function postinvoice(Request $request)
    {

        $invoice = new Invoice();
        $invoice->transactionid = $request->transactionid;
        $invoice->status = $request->status;
        $invoice->image = $request->image;
        $invoice->save();
        $id = $invoice->id;
        $result = Invoice::find($id);
        return  Response::json($result);
    }
    
    public function getaccount(Request $request)
    {
        $account = Pasien::join('users','users.id','=','pasien.userid')               
        ->select ('pasien.*','users.name','users.email')
        ->where('pasien.id',$request->id)->get();
        return Response::json($account);
    }
    
}
