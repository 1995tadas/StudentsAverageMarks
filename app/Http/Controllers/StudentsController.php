<?php

namespace App\Http\Controllers;

use App\Services\SQLService;
use Illuminate\Database\QueryException;

class StudentsController extends Controller
{
    public function getStudentsData(): object
    {
        $sqlService = new SQLService;
        try {
            $data = $sqlService->runSelect('call students_medium()');
        } catch (QueryException $e) {
            return response()->json('Error while loading students from database')->setStatusCode(500);
        }

        return response()->json($data);
    }
}
