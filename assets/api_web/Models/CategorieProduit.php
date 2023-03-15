<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategorieProduit extends Model
{
    use HasFactory;

    protected $table            = "categoriedeproduit";
    protected $primaryKey       = "categorie_id";
    public $timestamps          = false;
}
