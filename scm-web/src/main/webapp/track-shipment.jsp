<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shipment Tracking - Global SCM</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .font-display { font-family: 'Space Grotesk', sans-serif; }
        .font-mono { font-family: 'JetBrains Mono', monospace; }
    </style>
</head>
<body class="bg-[#FCFBF9] min-h-screen text-slate-800 flex flex-col justify-between">

<!-- Navbar -->
<nav class="bg-[#0B1220] border-b border-white/10 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
        <div>
            <p class="font-display text-white text-xl font-semibold">Global</p>
            <p class="font-mono text-[10px] text-[#B4652F] tracking-[0.2em] uppercase">Supply Chain Management</p>
        </div>
        <a href="index.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Home</a>
    </div>
</nav>

<!-- Main Tracking Content -->
<main class="py-16 px-6 flex-grow flex justify-center">
    <div class="max-w-xl w-full">
        <div class="bg-white p-8 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
            <div class="absolute top-0 left-0 right-0 h-1.5 bg-[#B4652F]"></div>

            <h1 class="font-display text-2xl font-bold text-slate-900 mb-2">Shipment Tracking</h1>
            <p class="text-slate-600 text-sm mb-6">Real-time status updates for Order ID: <span class="font-mono font-bold text-[#B4652F]">#${tracking.order.id}</span></p>

            <c:if test="${not empty errorMessage}">
                <div class="bg-red-50 text-red-600 p-4 rounded-xl text-center text-sm font-medium mb-4">
                        ${errorMessage}
                </div>
            </c:if>

            <!-- Status Badge -->
            <div class="bg-[#FCFBF9] p-4 rounded-xl border border-slate-200 mb-6 flex justify-between items-center">
                <div>
                    <span class="text-xs font-mono text-slate-500 uppercase tracking-wider block">Current Status</span>
                    <span class="font-display font-bold text-lg text-slate-900">${tracking.status}</span>
                </div>
                <div class="text-end">
                    <span class="text-xs font-mono text-slate-500 uppercase tracking-wider block">Location Hub</span>
                    <span class="text-sm font-semibold text-[#B4652F]">${tracking.currentLocation}</span>
                </div>
            </div>

            <!-- Timeline visualization -->
            <div class="space-y-4 border-l-2 border-[#B4652F]/30 pl-4 ml-2 mb-8">
                <div>
                    <span class="text-xs font-mono text-slate-400 block">Step 1</span>
                    <p class="text-sm font-semibold text-slate-800">Order Placed & Confirmed</p>
                </div>
                <div>
                    <span class="text-xs font-mono text-slate-400 block">Step 2</span>
                    <p class="text-sm font-semibold text-slate-800">Dispatched from Warehouse</p>
                </div>
                <div>
                    <span class="text-xs font-mono text-slate-400 block">Step 3</span>
                    <p class="text-sm font-semibold text-slate-800">In-Transit / Customs Clearance</p>
                </div>
                <div>
                    <span class="text-xs font-mono text-slate-400 block">Step 4</span>
                    <p class="text-sm font-semibold text-slate-800">Delivered to Final Destination</p>
                </div>
            </div>

            <a href="index.jsp" class="block w-full bg-[#B4652F] hover:bg-[#9c5527] text-white font-semibold text-sm py-3 rounded-lg text-center transition-colors">
                Back to Dashboard
            </a>
        </div>
    </div>
</main>

<footer class="bg-[#0B1220] border-t border-white/10 py-6 text-center">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">&copy; 2026 Global SCM</p>
</footer>
</body>
</html>