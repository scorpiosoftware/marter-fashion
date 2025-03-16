<?php

namespace App\Http\Controllers;

use App\Actions\Dashboard\AppliedOrders;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if(Auth::user()->role_id == 2){
            return redirect('/');
        }
        $inputs = $request->all();
        $date = !empty( $inputs['date'] ) ? $inputs['date'] : '';
        $applied_orders = AppliedOrders::execute();
        $revenue = new  Order();
        $revenue = $applied_orders->sum('total_amount');
        $unpaid = new Order();
        $unpaid = $unpaid->where('status','pending')->sum('total_amount');
        $total = new Order();
        $total = $total->where('status','!=','canceled')->sum('total_amount');
        $totalVisits =  !empty($date) ? visitors()->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->uniqueCount();
        $facebook =  !empty($date) ? visitors()->referrers('https://facebook.com','https://lm.facebook.com/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('https://facebook.com','https://lm.facebook.com/')->uniqueCount();
        $instagram =  !empty($date) ? visitors()->referrers('https://www.instagram.com/','https://l.instagram.com/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('https://www.instagram.com/','https://l.instagram.com/')->uniqueCount();
        $snapchat =  !empty($date) ?  visitors()->referrers('https://www.snapchat.com/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('https://www.snapchat.com/')->uniqueCount();
        $tiktok =  !empty($date) ? visitors()->referrers('https://www.tiktok.com/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('https://www.tiktok.com/')->uniqueCount();
        $whatsapp =  !empty($date) ? visitors()->referrers('https://www.whatsapp.com/','https://l.wl.co/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('https://l.wl.co/')->uniqueCount();
        $google =  !empty($date)  ? visitors()->referrers('/')->whereDate('created_at','<=',$date)->uniqueCount() : visitors()->referrers('/')->uniqueCount();
        return view('dashboard.dashboard',compact('applied_orders','revenue','unpaid','total','totalVisits','facebook','instagram','snapchat','tiktok','google','whatsapp'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
