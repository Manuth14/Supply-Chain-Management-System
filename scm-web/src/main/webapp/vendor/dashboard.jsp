<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Portal | Global Supply Chain Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700;800&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .font-display { font-family: 'Space Grotesk', sans-serif; }
        .font-mono { font-family: 'JetBrains Mono', monospace; }
    </style>
</head>
<body class="bg-[#FCFBF9] min-h-screen text-slate-800 antialiased flex flex-col justify-between">

<!-- Top Navigation Bar -->
<nav class="bg-[#0B1220] border-b border-white/10 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6 lg:px-12 h-20 flex items-center justify-between">
        <div>
            <p class="font-display text-white text-xl font-semibold tracking-tight">Vendor Portal</p>
            <p class="font-mono text-[10px] text-[#B4652F] tracking-[0.2em] uppercase">Supply Chain Network</p>
        </div>

        <div class="flex items-center space-x-6">
            <!-- User Profile Badge -->
            <div class="hidden sm:flex flex-col text-right">
                <p class="text-xs font-semibold text-white">${sessionScope.user.email}</p>
                <p class="font-mono text-[10px] text-[#B4652F] uppercase">Vendor Partner</p>
            </div>
            <div class="w-10 h-10 rounded-xl bg-[#B4652F]/10 border border-[#B4652F]/30 text-[#B4652F] font-display font-bold flex items-center justify-center">
                V
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="bg-white/10 hover:bg-red-600/20 hover:text-red-400 text-white text-sm font-semibold px-4 py-2 rounded-lg transition-colors border border-white/10 flex items-center gap-2">
                <i class="fa-solid fa-arrow-right-from-bracket text-xs"></i>
                <span class="hidden sm:inline">Logout</span>
            </a>
        </div>
    </div>
</nav>

<!-- Main Content Container -->
<main class="max-w-7xl mx-auto px-6 lg:px-12 py-12 flex-grow w-full">

    <!-- Welcome Banner with Homepage Geometric Style -->
    <div class="relative bg-[#0B1220] rounded-2xl overflow-hidden p-8 sm:p-12 mb-10 shadow-lg">
        <div class="absolute -top-16 -right-16 w-64 h-64 rounded-3xl bg-[#B4652F] opacity-90 rotate-[24deg] pointer-events-none"></div>
        <div class="relative z-10 max-w-2xl">
            <div class="inline-flex items-center gap-2 bg-white/5 border border-white/10 px-3 py-1 rounded-full mb-4">
                <span class="w-2 h-2 rounded-full bg-[#B4652F]"></span>
                <span class="font-mono text-xs text-[#9AA5BD] uppercase tracking-wider">Active Vendor Hub</span>
            </div>
            <h1 class="font-display text-white text-3xl sm:text-4xl font-bold tracking-tight">
                Welcome back, Partner.
            </h1>
            <p class="text-[#9AA5BD] text-sm sm:text-base mt-3">
                Manage your active inventory, process pending shipments, and track recent supply chain orders seamlessly.
            </p>
        </div>
    </div>

    <!-- Stats Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
        <!-- Stat 1 -->
        <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
            <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Total Products</p>
            <h3 class="font-display text-3xl font-bold text-slate-900 mt-1">24</h3>
        </div>
        <!-- Stat 2 -->
        <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
            <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">New Orders</p>
            <h3 class="font-display text-3xl font-bold text-slate-900 mt-1">12</h3>
        </div>
        <!-- Stat 3 -->
        <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
            <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Pending Deliveries</p>
            <h3 class="font-display text-3xl font-bold text-slate-900 mt-1">5</h3>
        </div>
        <!-- Stat 4 -->
        <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
            <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Total Earnings</p>
            <h3 class="font-display text-3xl font-bold text-slate-900 mt-1">Rs. 84,500</h3>
        </div>
    </div>

    <!-- Recent Orders Table Section -->
    <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
        <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
            <div>
                <h3 class="font-display text-lg font-semibold text-slate-900">Recent Supply Orders</h3>
                <p class="text-xs text-slate-500 mt-0.5">Live orders assigned to your vendor account</p>
            </div>
            <button class="bg-[#0B1220] hover:bg-slate-800 text-white text-xs font-semibold px-4 py-2 rounded-lg transition-colors">
                View All Orders
            </button>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                <tr class="bg-slate-50 font-mono text-xs text-slate-500 uppercase border-b border-slate-100">
                    <th class="px-6 py-4">Order ID</th>
                    <th class="px-6 py-4">Customer</th>
                    <th class="px-6 py-4">Item & Specifications</th>
                    <th class="px-6 py-4">Amount</th>
                    <th class="px-6 py-4">Status</th>
                </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 text-sm text-slate-600">
                <tr class="hover:bg-slate-50/50 transition-colors">
                    <td class="px-6 py-4 font-mono font-medium text-slate-900">#ORD-9021</td>
                    <td class="px-6 py-4 font-medium">Kasun Perera</td>
                    <td class="px-6 py-4">Steel Pipe Fitting (10pcs)</td>
                    <td class="px-6 py-4 font-semibold text-slate-900">Rs. 12,500</td>
                    <td class="px-6 py-4">
                        <span class="px-3 py-1 font-mono text-xs font-semibold text-amber-700 bg-amber-50 rounded-full border border-amber-200">Pending</span>
                    </td>
                </tr>
                <tr class="hover:bg-slate-50/50 transition-colors">
                    <td class="px-6 py-4 font-mono font-medium text-slate-900">#ORD-9020</td>
                    <td class="px-6 py-4 font-medium">Nuwan Silva</td>
                    <td class="px-6 py-4">Safety Railing Bracket</td>
                    <td class="px-6 py-4 font-semibold text-slate-900">Rs. 8,200</td>
                    <td class="px-6 py-4">
                        <span class="px-3 py-1 font-mono text-xs font-semibold text-emerald-700 bg-emerald-50 rounded-full border border-emerald-200">Completed</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</main>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-8 text-center mt-12">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>