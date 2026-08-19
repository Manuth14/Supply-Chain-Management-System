<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.jiat.scm.entities.entity.User" %>
<%@ page import="lk.jiat.scm.entities.entity.Cart" %>
<%@ page import="lk.jiat.scm.entities.entity.CartItem" %>
<%@ page import="lk.jiat.scm.core.service.CartBeanService" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.math.BigDecimal" %>

<%
    User user = (User) session.getAttribute("user");
    Cart userCart = null;
    try {
        InitialContext ctx = new InitialContext();
        CartBeanService cartService = (CartBeanService) ctx.lookup("java:global/scm-ear/lk.jiat.bcd-scm-ejb-1.0/CartBean");
        if (cartService != null && user != null) {
            userCart = cartService.getCartByUser(user);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Shipment Cart - Global Supply Chain Management</title>
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
            <a href="products" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Products</a>
            <a href="place-order.jsp" class="text-sm font-medium text-white hover:text-[#B4652F] transition-colors">Cart & Checkout</a>
            <a href="login.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Sign in</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="py-16 px-6 lg:px-12 max-w-6xl mx-auto flex-grow w-full">
    <div class="mb-10">
        <p class="font-mono text-xs text-[#B4652F] tracking-[0.2em] uppercase">Shipment Cart</p>
        <h1 class="font-display text-3xl font-bold text-slate-900 mt-1">Review Your Cart & Checkout</h1>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- Left Cart Table Section -->
        <div class="lg:col-span-2 space-y-6">
            <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm">
                <h2 class="font-display text-lg font-semibold text-slate-900 mb-4">Cart Items</h2>
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-sm text-slate-700">
                        <thead class="bg-slate-50 border-b border-slate-200 text-xs uppercase font-mono text-slate-500">
                        <tr>
                            <th class="py-2.5 px-3">Item Name</th>
                            <th class="py-2.5 px-3">Rate/kg</th>
                            <th class="py-2.5 px-3">Weight (kg)</th>
                            <th class="py-2.5 px-3">Total</th>
                            <th class="py-2.5 px-3 text-center">Action</th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                        <%
                            BigDecimal grandTotal = BigDecimal.ZERO;
                            boolean hasItems = false;

                            if (userCart != null && userCart.getCartItems() != null && !userCart.getCartItems().isEmpty()) {
                                hasItems = true;
                                for (CartItem item : userCart.getCartItems()) {
                                    BigDecimal itemRate = item.getProduct().getPrice();
                                    BigDecimal itemWeight = item.getWeight();
                                    BigDecimal itemTotal = itemRate.multiply(itemWeight);
                                    grandTotal = grandTotal.add(itemTotal);
                        %>
                        <tr class="hover:bg-slate-50 transition-colors" data-item-id="<%= item.getId() %>" data-rate="<%= itemRate %>">
                            <td class="py-3 px-3 font-medium text-slate-950"><%= item.getProduct().getName() %></td>
                            <td class="py-3 px-3 font-mono text-xs">Rs. <span class="rate-val"><%= itemRate %></span></td>
                            <td class="py-3 px-3">
                                <label>
                                    <input type="number" step="1" min="1" value="<%= item.getWeight() %>"
                                           oninput="updateCartWeight(<%= item.getId() %>, this)"
                                           class="weight-input w-24 px-2 py-1 border border-slate-300 rounded text-xs font-mono focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F]">
                                </label>
                            </td>
                            <td class="py-3 px-3 font-mono text-xs font-semibold text-[#B4652F]">Rs .<span class="item-total"><%= itemTotal %></span></td>
                            <td class="py-3 px-3 text-center">
                                <button type="button" onclick="removeCartItem(<%= item.getId() %>, this.closest('tr'))"
                                        class="text-red-500 hover:text-red-700 text-xs font-semibold">Remove</button>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr id="emptyRow">
                            <td colspan="5" class="py-8 text-center text-slate-400 text-sm">No items found in your cart. <a href="products" class="text-[#B4652F] underline font-medium">Browse products</a></td>
                        </tr>
                        <% } %>
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
                    <input type="email" id="customerEmail" name="customerEmail" disabled
                           value="<%= (user != null) ? user.getEmail() : "" %>" required placeholder="you@company.com"
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
                    <span id="grandTotalDisplay" class="font-display text-xl font-bold text-[#B4652F]">Rs. <%= grandTotal %></span>
                </div>

                <input type="hidden" id="totalPriceInput" name="totalPrice" value="<%= grandTotal %>">
                <input type="hidden" id="updatedCartJson" name="updatedCartJson" value="">

                <button type="submit" onclick="prepareCheckout(event)" <% if (!hasItems) { %>disabled<% } %>
                        class="w-full py-3 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors shadow-md <% if (!hasItems) { %>opacity-55 cursor-not-allowed<% } %>">
                    Submit Complete Order
                </button>
            </form>
        </div>

    </div>
</main>

<!-- JavaScript for Live Weight Update & Total Calculation -->
<script>
    function updateCartWeight(cartItemId, inputElem) {
        const row = inputElem.closest('tr');
        const rate = parseFloat(row.getAttribute('data-rate')) || 0;
        const weight = parseFloat(inputElem.value) || 0;

        // 1. Live UI calculation
        const itemTotal = rate * weight;
        row.querySelector('.item-total').innerText = itemTotal.toFixed(2);
        recalculateGrandTotal();

        // 2. Background AJAX request to update DB via JAX-RS
        fetch('api/cart/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ cartItemId: cartItemId, weight: weight })
        })
            .then(response => response.json())
            .then(data => {
                if(data.status !== 'success') {
                    console.error('Failed to sync weight with database');
                }
            })
            .catch(error => console.error('Error:', error));
    }

    function removeCartItem(cartItemId, rowElem) {
        // 1. Background AJAX request to remove from DB via JAX-RS
        fetch('api/cart/remove/' + cartItemId, {
            method: 'DELETE'
        })
            .then(response => response.json())
            .then(data => {
                if(data.status === 'success') {
                    // 2. Remove row from UI table
                    rowElem.remove();
                    recalculateGrandTotal();

                    // If cart is empty, show empty message
                    const tbody = document.querySelector('tbody');
                    if (tbody.querySelectorAll('tr[data-item-id]').length === 0) {
                        tbody.innerHTML = `<tr id="emptyRow"><td colspan="5" class="py-8 text-center text-slate-400 text-sm">No items found in your cart. <a href="products" class="text-[#B4652F] underline font-medium">Browse products</a></td></tr>`;
                        const submitBtn = document.querySelector('button[type="submit"]');
                        if(submitBtn) {
                            submitBtn.setAttribute('disabled', 'true');
                            submitBtn.classList.add('opacity-55', 'cursor-not-allowed');
                        }
                    }
                }
            })
            .catch(error => console.error('Error:', error));
    }

    function recalculateGrandTotal() {
        let grandTotal = 0;
        document.querySelectorAll('.item-total').forEach(span => {
            grandTotal += parseFloat(span.innerText) || 0;
        });

        document.getElementById('grandTotalDisplay').innerText = '$' + grandTotal.toFixed(2);
        document.getElementById('totalPriceInput').value = grandTotal.toFixed(2);
    }

    function prepareCheckout(e) {
        let itemsData = [];
        document.querySelectorAll('tr[data-item-id]').forEach(row => {
            const cartItemId = row.getAttribute('data-item-id');
            const weight = row.querySelector('.weight-input').value;
            itemsData.push({ cartItemId: cartItemId, weight: weight });
        });

        document.getElementById('updatedCartJson').value = JSON.stringify(itemsData);
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