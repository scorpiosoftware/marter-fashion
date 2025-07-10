<?php

namespace App\Http\Controllers;

use App\Actions\Category\ListCategory;
use App\Models\Carousel;
use App\Models\Option;
use App\Models\Order;
use App\Models\OrderItem;
use App\Services\WhatsappSevice;
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
            $records = $records->where('auto_nb', 'LIKE', "%{$inputs['search']}%");
        }

        if (!empty($inputs['status'])) {
            $records =  $records->where('status', $inputs['status']);
        } else {
            $inputs['status'] = 'delivered';
            $records =  $records->where('status', $inputs['status']);
        }
        $records = $records->orderBy('id', 'desc')->paginate(10);
        return view("dashboard.invoice.index", compact("records", 'inputs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ListCategory::execute();
        $carousel = Carousel::with('images')->first();
        return view('shipping.index', compact('categories', 'carousel'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $inputs = $request->all();
        $order = new Order();
        $option = Option::first();

        // Language detection
        $isArabic = session('lang') == 'ar';

        if ($option) {
            $option->starter_number++;
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
        $order->customer_email = !empty($inputs['email']) ? $inputs['email'] : "none email";
        $order->phone = $inputs['phone'];
        $order->street = $inputs['street'];
        $order->apartment = $inputs['apartment'];
        $order->country = $inputs['country'];
        $order->city = $inputs['city'];
        $order->status = 'pending';
        $order->save();

        if ($cart) {
            foreach (session('cart') as $id => $details) {
                $item = new OrderItem();
                $item->product_id = $details['product_id'];
                $item->order_id = $order->id;
                $item->quantity = $details['quantity'];
                $item->subtotal = $details['price'];
                $item->save();
            }
        }

        // Multilingual message creation
        if ($isArabic) {
            $message = "📦 طلبات جديدة:\n\n";
            $message .= "👤 اسم العميل: {$inputs['full_name']}\n";
            $message .= "📞 الهاتف: {$inputs['phone']}\n";
            $message .= "🏠 الشارع: {$inputs['street']}\n";
            $message .= "🗺️ المحافظة: {$inputs['apartment']}\n";

            $message .= "🌍 البلد: {$inputs['country']}\n";
            $message .= "🏙️ المدينة: {$inputs['city']}\n";
            $message .= "📦 رقم الطلب: {$order->auto_nb}\n";
            $message .= "💰 المبلغ الإجمالي: {$order->total_amount}\n";
            $message .= "📦 عناصر الطلب:\n";

            foreach (session('cart') as $id => $details) {
                $message .= "🛍️ اسم المنتج: {$details['name']}\n";
                $message .= "🔢 الكمية: {$details['quantity']}\n";

                // Add size if available
                if (isset($details['size']) && !empty($details['size'])) {
                    $message .= "📏 المقاس: {$details['size']['name']}\n";
                }

                // Add color if available
                if (isset($details['color']) && !empty($details['color'])) {
                    $message .= "🎨 اللون: {$details['color']['name']}\n";
                }

                $message .= "💵 المجموع الفرعي: {$details['price']}\n";
                $message .= "━━━━━━━━━━━━━━━━━━━━━━━━\n";
            }
        } else {
            $message = "📦 New Orders:\n\n";
            $message .= "👤 Customer Name: {$inputs['full_name']}\n";
            $message .= "📞 Phone: {$inputs['phone']}\n";
            $message .= "🏠 Street: {$inputs['street']}\n";
            $message .= "🗺️ Province: {$inputs['apartment']}\n";
            $message .= "🌍 Country: {$inputs['country']}\n";
            $message .= "🏙️ City: {$inputs['city']}\n";
            $message .= "📦 Order Number: {$order->auto_nb}\n";
            $message .= "💰 Total Amount: {$order->total_amount}\n";
            $message .= "📦 Order Items:\n";

            foreach (session('cart') as $id => $details) {
                $message .= "🛍️ Product name: {$details['name']}\n";
                $message .= "🔢 Quantity: {$details['quantity']}\n";

                // Add size if available
                if (isset($details['size']) && !empty($details['size'])) {
                    $message .= "📏 Size: {$details['size']['name']}\n";
                }

                // Add color if available
                if (isset($details['color']) && !empty($details['color'])) {
                    $message .= "🎨 Color: {$details['color']['name']}\n";
                }

                $message .= "💵 Subtotal: {$details['price']}\n";
                $message .= "━━━━━━━━━━━━━━━━━━━━━━━━\n";
            }
        }

        session()->forget('cart');

        // URL-encode the message
        $encodedMessage = urlencode($message);

        // Your WhatsApp number in international format (no + or 00)
        $whatsappNumber = "+96171036488";

        // Build WhatsApp redirect URL
        $whatsappURL = "https://wa.me/{$whatsappNumber}?text={$encodedMessage}";

        // Return with multilingual success message
        $successMessage = $isArabic ? 'رائع!' : 'nice!';

        return redirect()->to($whatsappURL)->with('success', $successMessage);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $record = Order::find($id);

        $items = OrderItem::where('order_id', $id)->get();
        return view('dashboard.invoice.show', compact('items', 'record'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $record = Order::find($id);
        $record->status = 'delivered';
        $record->save();
        return redirect()->back()->with('success', 'Order Confirmed');
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
        return redirect()->back()->with('success', 'Order Canceled');
    }
}
