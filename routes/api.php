<?php

use App\Http\Controllers\BranchController;
use Illuminate\Support\Facades\Route;

Route::get('/api/branches/{id}/section', [BranchController::class, 'getBranches'])->name('sections.branches');
Route::get('/api/branches', [BranchController::class, 'getAllBranches'])->name('branches.all');
