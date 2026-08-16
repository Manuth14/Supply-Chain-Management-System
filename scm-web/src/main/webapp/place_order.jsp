<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multiple Items Cart & Checkout - Global Supply Chain Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700;800&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .font-display { font-family: 'Space Grotesk', sans-serif; }
        .font-mono { font-family: 'JetBrains Mono', monospace; }
    </style>
</head>
<body class="bg-[#FCFBF9] min-h-screen text-slate-800 antialiased flex flex-col justify-between">

<!-- Navigation Bar -->
<nav class="bg-[#0B1220] border-b border-white/10 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6 lg:px-12 h-20 flex items-center justify-between">
        <div>
            <a href="index.jsp" class="block">
                <p class="font-display text-white text-xl font-semibold tracking-tight">Global</p>
                <p class="font-mono text-[10px] text-[#B4652F] tracking-[0.2em] uppercase">Supply Chain Management</p>
            </a>
        </div>
        <div class="hidden md:flex items-center space-x-8">
            <a href="index.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Home</a>
            <a href="product.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Products</a>
            <a href="place_order.jsp" class="text-sm font-medium text-white hover:text-[#B4652F] transition-colors">Cart & Checkout</a>
            <a href="login.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Sign in</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="py-16 px-6 lg:px-12 max-w-6xl mx-auto flex-grow w-full">
    <div class="mb-10">
        <p class="font-mono text-xs text-[#B4652F] tracking-[0.2em] uppercase">Multiple Items Cart</p>
        <h1 class="font-display text-3xl font-bold text-slate-900 mt-1">Build Your Shipment Order</h1>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- Left Form & Cart Table Section -->
        <div class="lg:col-span-2 space-y-6">

            <!-- Add Item Box -->
            <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm">
                <h2 class="font-display text-lg font-semibold text-slate-900 mb-4">1. Add Items to Cart</h2>
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-4">
                    <div class="sm:col-span-1">
                        <label class="block text-xs font-medium text-slate-700 mb-1">Select Item</label>
                        <select id="itemSelect" class="w-full px-3 py-2 border border-slate-300 rounded-lg bg-white text-sm focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                            <option value="industrial_machinery" data-name="Industrial Machinery" data-price="15">Industrial Machinery ($15/kg)</option>
                            <option value="electronics" data-name="Consumer Electronics" data-price="25">Consumer Electronics ($25/kg)</option>
                            <option value="textiles" data-name="Textiles & Garments" data-price="8">Textiles & Garments ($8/kg)</option>
                            <option value="pharma" data-name="Pharmaceuticals" data-price="30">Pharmaceuticals ($30/kg)</option>
                            <option value="raw_materials" data-name="Raw Materials / Steel" data-price="12">Raw Materials / Steel ($12/kg)</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-slate-700 mb-1">Weight (kg)</label>
                        <input type="number" id="itemWeight" step="0.01" placeholder="0.00" value="10" class="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-slate-700 mb-1">Quantity</label>
                        <input type="number" id="itemQty" placeholder="1" value="1" class="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                    </div>
                </div>
                <button type="button" onclick="addItemToCart()" class="w-full py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#B4652F] hover:bg-[#9c5527] transition-colors shadow-sm">
                    + Add Item to Cart
                </button>
            </div>

            <!-- Cart Items List Table -->
            <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm">
                <h2 class="font-display text-lg font-semibold text-slate-900 mb-4">2. Cart Items</h2>
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-sm text-slate-700">
                        <thead class="bg-slate-50 border-b border-slate-200 text-xs uppercase font-mono text-slate-500">
                        <tr>
                            <th class="py-2.5 px-3">Item</th>
                            <th class="py-2.5 px-3">Rate/kg</th>
                            <th class="py-2.5 px-3">Weight</th>
                            <th class="py-2.5 px-3">Qty</th>
                            <th class="py-2.5 px-3">Total</th>
                            <th class="py-2.5 px-3 text-center">Action</th>
                        </tr>
                        </thead>
                        <tbody id="cartTableBody" class="divide-y divide-slate-100">
                        <!-- Dynamic rows will appear here -->
                        <tr id="emptyRow">
                            <td colspan="6" class="py-6 text-center text-slate-400 text-sm">No items added to cart yet.</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Right Checkout Form Sidebar -->
        <div class="lg:col-span-1">
            <form action="OrderServlet" method="POST" class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm sticky top-28 space-y-5">
                <div>
                    <h2 class="font-display text-lg font-semibold text-slate-900">Checkout Summary</h2>
                    <p class="text-xs text-slate-500 mt-0.5">Finalize customer & shipping details</p>
                </div>

                <hr class="border-slate-100">

                <div>
                    <label for="customerEmail" class="block text-xs font-medium text-slate-700 mb-1">Customer Email</label>
                    <input type="email" id="customerEmail" name="customerEmail" required placeholder="you@company.com"
                           class="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                </div>

                <div>
                    <label for="destinationCountry" class="block text-xs font-medium text-slate-700 mb-1">Destination Country</label>
                    <select id="destinationCountry" name="destinationCountry" required
                            class="w-full px-3 py-2 border border-slate-300 rounded-lg bg-white text-sm focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                        <option value="" selected disabled>Select country...</option>
                        <option value="USA">United States</option>
                        <option value="UK">United Kingdom</option>
                        <option value="Germany">Germany</option>
                        <option value="Singapore">Singapore</option>
                        <option value="Australia">Australia</option>
                        <option value="Japan">Japan</option>
                    </select>
                </div>

                <div>
                    <label class="block text-xs font-medium text-slate-700 mb-1">Shipping Method</label>
                    <div class="flex items-center space-x-4 text-xs">
                        <label class="flex items-center space-x-1 cursor-pointer">
                            <input type="radio" name="shippingMethod" value="Air" checked class="text-[#B4652F]">
                            <span>Air (Express)</span>
                        </label>
                        <label class="flex items-center space-x-1 cursor-pointer">
                            <input type="radio" name="shippingMethod" value="Sea" class="text-[#B4652F]">
                            <span>Sea (Standard)</span>
                        </label>
                    </div>
                </div>

                <hr class="border-slate-100">

                <div class="flex justify-between items-center">
                    <span class="font-display font-semibold text-slate-900 text-sm">Grand Total:</span>
                    <span id="grandTotalDisplay" class="font-display text-xl font-bold text-[#B4652F]">$0.00</span>
                </div>

                <!-- Hidden input to pass all cart items JSON data to Servlet -->
                <input type="hidden" id="cartDataJson" name="cartDataJson" value="">
                <input type="hidden" id="totalPrice" name="totalPrice" value="0">

                <button type="submit" onclick="prepareCheckout(event)"
                        class="w-full py-3 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors shadow-md">
                    Submit Complete Order
                </button>
            </form>
        </div>

    </div>
</main>

<!-- Multiple Items Cart JavaScript Logic -->
<script>
    let cartItems = [];

    function addItemToCart() {
        const selectElem = document.getElementById('itemSelect');
        const selectedOption = selectElem.options[selectElem.selectedIndex];

        const itemCode = selectedOption.value;
        const itemName = selectedOption.getAttribute('data-name');
        const ratePerKg = parseFloat(selectedOption.getAttribute('data-price'));

        const weight = parseFloat(document.getElementById('itemWeight').value) || 0;
        const quantity = parseInt(document.getElementById('itemQty').value) || 1;

        if (weight <= 0 || quantity <= 0) {
            alert('Please enter valid weight and quantity.');
            return;
        }

        const itemTotal = ratePerKg * weight * quantity;

        // Add to array
        cartItems.push({
            code: itemCode,
            name: itemName,
            rate: ratePerKg,
            weight: weight,
            qty: quantity,
            total: itemTotal
        });

        renderCart();
    }

    function removeItem(index) {
        cartItems.splice(index, 1);
        renderCart();
    }

    function renderCart() {
        const tbody = document.getElementById('cartTableBody');
        tbody.innerHTML = '';

        if (cartItems.length === 0) {
            tbody.innerHTML = `<tr id="emptyRow"><td colspan="6" class="py-6 text-center text-slate-400 text-sm">No items added to cart yet.</td></tr>`;
            document.getElementById('grandTotalDisplay').innerText = '$0.00';
            document.getElementById('totalPrice').value = '0';
            return;
        }

        let grandTotal = 0;

        cartItems.forEach((item, index) => {
            grandTotal += item.total;
            const row = document.createElement('tr');
            row.className = 'hover:bg-slate-50 transition-colors';
            row.innerHTML = `
                    <td class="py-3 px-3 font-medium text-slate-900">\${item.name}</td>
                    <td class="py-3 px-3 font-mono text-xs">$\${item.rate.toFixed(2)}</td>
                    <td class="py-3 px-3 font-mono text-xs">\${item.weight} kg</td>
                    <td class="py-3 px-3 font-mono text-xs">\${item.qty}</td>
                    <td class="py-3 px-3 font-mono text-xs font-semibold text-[#B4652F]">$\${item.total.toFixed(2)}</td>
                    <td class="py-3 px-3 text-center">
                        <button type="button" onclick="removeItem(\${index})" class="text-red-500 hover:text-red-700 text-xs font-semibold">Remove</button>
                    </td>
                `;
            tbody.appendChild(row);
        });

        document.getElementById('grandTotalDisplay').innerText = '$' + grandTotal.toFixed(2);
        document.getElementById('totalPrice').value = grandTotal.toFixed(2);
    }

    function prepareCheckout(e) {
        if (cartItems.length === 0) {
            e.preventDefault();
            alert('Please add at least one item to your cart before submitting.');
            return;
        }
        // Pack cart items into JSON string for backend Servlet processing
        document.getElementById('cartDataJson').value = JSON.stringify(cartItems);
    }
</script>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-6 text-center mt-12">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>