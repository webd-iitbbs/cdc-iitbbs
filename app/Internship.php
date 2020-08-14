<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class Internship extends Model
{
    public $table = 'internships';
    public $fillable = ['company_name', 'profile'];

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($data) {
            $newColumnName = $data->company_name; 
            Schema::table('thirdyear', function($table)use ($data)
            {
                $table->string($data->company_name)->default('0');
            });
        });

        static::deleting(function ($data) {
            Schema::table('thirdyear', function($table) use ($data) {
                $table->dropColumn($data->company_name);
            });
        });
    }
}
