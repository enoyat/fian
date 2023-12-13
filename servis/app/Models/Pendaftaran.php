<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pendaftaran extends Model
{
    use HasFactory;
    protected $table = 'pendaftaran';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $guarded = [];
    function getjadwal(){
        return $this->belongsTo(Jadwal::class,'idjadwal','id');
    }
    function getpasien(){
        return $this->belongsTo(Pasien::class,'idpasien','id');
    }

    
}
