<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produit extends Model
{
    use HasFactory;

    protected $table            = "produit";
    protected $primaryKey       = "produit_id";
    public $timestamps          = false;
    
    protected $fillable = ['produit_photo_principale'];
    
}
