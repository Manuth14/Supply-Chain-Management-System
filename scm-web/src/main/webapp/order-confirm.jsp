<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Global Supply Chain Management</title>
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
            <p class="font-display text-white text-xl font-semibold tracking-tight">Global</p>
            <p class="font-mono text-[10px] text-[#B4652F] tracking-[0.2em] uppercase">Supply Chain Management</p>
        </div>
        <div class="hidden md:flex items-center space-x-8">
            <a href="index.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Home</a>
            <a href="products" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Products</a>
            <a href="place-order.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Cart & Checkout</a>
            <a href="login.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Sign in</a>
            <a href="register" class="bg-[#B4652F] hover:bg-[#9c5527] text-white text-sm font-semibold px-4 py-2.5 rounded-lg transition-colors">
                Get Started
            </a>
        </div>
    </div>
</nav>

<!-- Main Confirmation Section -->
<main class="py-16 px-6 flex-grow flex items-center justify-center">
    <div class="max-w-2xl w-full">

        <!-- Confirmation Card -->
        <div class="bg-white p-8 sm:p-10 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <!-- Decorative Accent Bar -->
            <div class="absolute top-0 left-0 right-0 h-1.5 bg-[#B4652F]"></div>

            <div class="text-center mb-8">
                <div class="w-14 h-14 bg-emerald-50 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-4 border border-emerald-100">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
                <span class="font-mono text-xs text-[#B4652F] tracking-[0.2em] uppercase">Success</span>
                <h1 class="font-display text-2xl sm:text-3xl font-bold text-slate-900 mt-1">Order Placed Successfully</h1>
                <p class="text-slate-600 text-sm mt-2">Your shipment has been logged and is currently being processed in the network.</p>
            </div>

            <!-- Order Meta Information Box -->
            <div class="bg-[#FCFBF9] p-5 rounded-xl border border-slate-200/60 mb-8">
                <div class="grid grid-cols-2 gap-4 text-sm">
                    <div>
                        <span class="block text-slate-500 font-mono text-xs uppercase tracking-wider">Order ID</span>
                        <span class="font-display font-bold text-slate-900 mt-0.5 block">#${order.id}</span>
                    </div>
                    <div>
                        <span class="block text-slate-500 font-mono text-xs uppercase tracking-wider">Order Date</span>
                        <span class="font-medium text-slate-800 mt-0.5 block">${order.orderDate}</span>
                    </div>
                    <div>
                        <span class="block text-slate-500 font-mono text-xs uppercase tracking-wider">Status</span>
                        <span class="inline-flex items-center gap-1.5 mt-0.5 px-2.5 py-0.5 rounded-full text-xs font-semibold bg-amber-50 text-amber-700 border border-amber-200/60">
                            <span class="w-1.5 h-1.5 rounded-full bg-amber-500"></span>
                            ${order.status}
                        </span>
                    </div>
                    <div>
                        <span class="block text-slate-500 font-mono text-xs uppercase tracking-wider">Total Amount</span>
                        <span class="font-display font-bold text-[#B4652F] mt-0.5 block">LKR ${order.totalAmount}</span>
                    </div>
                </div>
            </div>

            <!-- Ordered Items Table -->
            <div class="mb-8">
                <h3 class="font-display text-sm font-semibold text-slate-900 uppercase tracking-wider mb-3">Manifest Summary</h3>
                <div class="border border-slate-200/80 rounded-xl overflow-hidden">
                    <table class="w-full text-left border-collapse">
                        <thead>
                        <tr class="bg-slate-50 border-b border-slate-200/80 text-xs font-mono text-slate-500 uppercase tracking-wider">
                            <th class="py-3 px-4">Product</th>
                            <th class="py-3 px-4">Weight</th>
                            <th class="py-3 px-4 text-right">Price</th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 text-sm">
                        <c:forEach var="item" items="${order.orderItems}">
                            <tr class="hover:bg-slate-50/50">
                                <td class="py-3 px-4 font-medium text-slate-800">${item.product.name}</td>
                                <td class="py-3 px-4 text-slate-600 font-mono text-xs">${item.weight} kg</td>
                                <td class="py-3 px-4 text-right font-mono text-xs text-slate-800">LKR ${item.price}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex flex-col sm:flex-row gap-3">
                <a href="index.jsp" class="flex-1 bg-white hover:bg-slate-50 text-slate-800 font-semibold text-sm py-3 px-6 rounded-lg text-center transition-colors border border-slate-200 shadow-sm">
                    Return to Home
                </a>
                <a href="products" class="flex-1 bg-[#B4652F] hover:bg-[#9c5527] text-white font-semibold text-sm py-3 px-6 rounded-lg text-center transition-colors shadow-sm">
                    Continue Shipping
                </a>
            </div>

        </div>

    </div>
</main>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-8 text-center">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>