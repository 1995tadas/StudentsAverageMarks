<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;

class SQLService
{

    public function runSelect(string $query): array
    {
        $select = DB::select($query);
        if (!$select) {
            return abort(500);
        }

        return $select;
    }
}
