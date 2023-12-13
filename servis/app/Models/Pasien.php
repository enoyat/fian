<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pasien extends Model
{
    use HasFactory;
    protected $table = 'pasien';
    protected $primaryKey = 'id';
    protected $guarded = [];
    function getusers(){
        return $this->belongsTo(User::class,'userid','id');
    }
    function getidentitas(){
        return $this->belongsTo(Identitas::class,'idkartu','id');
    }
 
}
