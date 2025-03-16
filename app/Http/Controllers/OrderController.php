<?php

namespace App\Http\Controllers;
use App\Actions\Category\ListCategory;
use App\Models\Carousel;
use App\Models\Option;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $inputs = $request->all();
        $records = new Order();

        if (!empty($inputs['search'])) {
            $records = $records->where('auto_nb','LIKE',"%{$inputs['search']}%");
        }

        if(!empty($inputs['status'])){
            $records =  $records->where('status',$inputs['status']);
        }else{
            $inputs['status'] = 'delivered';
            $records =  $records->where('status',$inputs['status']);
        }
        $records = $records->orderBy('id','desc')->paginate(10);
        return view("dashboard.invoice.index", compact("records",'inputs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ListCategory::execute();
        $carousel = Carousel::with('images')->first();
        return view('shipping.index', compact('categories','carousel'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $inputs = $request->all();
        $order = new Order();
        $option = Option::first();
        if($option){
            $option->starter_number ++;
            $option->save();
            $option = Option::first();
            $order->auto_nb = $option->order_letter . $option->starter_number;
        }
     
        $totale = 0;
        $cart = session()->get('cart');
        if ($cart) {
            foreach (session('cart') as $id => $details) {
                $totale += $details['price'];
            }
        }
        $order->total_amount = $totale;
        $order->customer_name = $inputs['full_name'];
        $order->customer_email = !empty($inputs['email']) ? $inputs['email'] : "none email" ;
        $order->phone = $inputs['phone'];
        $order->street = $inputs['street'];
        $order->apartment = $inputs['apartment'];
        $order->country = $inputs['country'];
        $order->city = $inputs['city'];
        // $order->zip = $inputs['zip'];
        $order->status = 'pending';
        $order->save();

        if ($cart) {
            foreach (session('cart') as $id => $details) {
                $item = new OrderItem();
                $item->product_id = $id;
                $item->order_id = $order->id;
                $item->quantity = $details['quantity'];
                $item->subtotal = $details['price'];
                $item->save();
            }
        }
        session()->forget('cart');
        return redirect()->to('/')->with('success','nice !');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
       $record = Order::find($id);
       
       $items = OrderItem::where('order_id', $id)->get();
       return view('dashboard.invoice.show', compact('items','record'));

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = Order::find($id);
        $record->status = 'delivered';
        $record->save();
        return redirect()->back()->with('success','Order Confirmed');
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
        $record = Order::find($id);
        $record->status = 'canceled';
        $record->save();
        return redirect()->back()->with('success','Order Canceled');
    }
}
