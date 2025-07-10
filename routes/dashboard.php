<?php

use App\Http\Controllers\BranchController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CarouselController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InboxController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductImageController;
use App\Http\Controllers\ProductViewController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SizeController;
use App\Http\Controllers\StoreSectionController;
use Illuminate\Routing\Route as RoutingRoute;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth', 'prefix' => 'dashboard'], function () {
    Route::resource('dashboard', DashboardController::class);
    Route::resource('product', ProductController::class);
    Route::resource('category', CategoryController::class);
    Route::resource('brand', BrandController::class);
    Route::resource('invoice', OrderController::class);
    Route::resource('role', RoleController::class);
    Route::resource('gallery', ProductImageController::class);
    Route::resource('productView', ProductViewController::class);
    Route::resource('carousel', CarouselController::class);
    Route::resource('inbox', InboxController::class);
    Route::resource('storeSections', StoreSectionController::class);
    Route::resource('branch', BranchController::class);
    Route::resource('color', ColorController::class);
    Route::resource('size', SizeController::class);
    Route::post("/branch/section/{id}",[BranchController::class,'createWithSection'])->name('branch.createSelectedSection');
    Route::delete('/branch/{id}/delete', [BranchController::class, 'destroy']);
});