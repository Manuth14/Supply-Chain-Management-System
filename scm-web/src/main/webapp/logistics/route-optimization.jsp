<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Route Optimization | Logistics Portal</title>
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
            <p class="font-display text-white text-xl font-semibold tracking-tight">Logistics Portal</p>
            <p class="font-mono text-[10px] text-[#B4652F] tracking-[0.2em] uppercase">Supply Chain Network</p>
        </div>

        <div class="flex items-center space-x-6">
            <!-- User Profile Badge -->
            <div class="hidden sm:flex flex-col text-right">
                <p class="text-xs font-semibold text-white">${sessionScope.user.email}</p>
                <p class="font-mono text-[10px] text-[#B4652F] uppercase">Logistics Personnel</p>
            </div>
            <div class="w-10 h-10 rounded-xl bg-[#B4652F]/10 border border-[#B4652F]/30 text-[#B4652F] font-display font-bold flex items-center justify-center">
                L
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="bg-white/10 hover:bg-red-600/20 hover:text-red-400 text-white text-sm font-semibold px-4 py-2 rounded-lg transition-colors border border-white/10 flex items-center gap-2">
                <i class="fa-solid fa-arrow-right-from-bracket text-xs"></i>
                <span class="hidden sm:inline">Logout</span>
            </a>
        </div>
    </div>
</nav>

<!-- Main Wrapper with Sidebar and Content -->
<div class="max-w-7xl mx-auto px-6 lg:px-12 py-10 flex-grow w-full flex flex-col lg:flex-row gap-8 items-start">

    <!-- Sidebar Navigation -->
    <aside class="w-full lg:w-72 bg-white rounded-2xl border border-slate-200/80 shadow-sm p-6 shrink-0 sticky top-28">
        <p class="font-mono text-[11px] text-slate-400 uppercase tracking-widest mb-4">Core Modules</p>
        <nav class="space-y-1.5">
            <a href="${pageContext.request.contextPath}/logistics/dashboard" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-chart-pie w-5 text-slate-400"></i>
                <span>Overview Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/shipments" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-boxes-stacked w-5 text-slate-400"></i>
                <span>Manage Shipments</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/customs-compliance" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-file-shield w-5 text-slate-400"></i>
                <span>Customs & Compliance</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/route-optimization" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-semibold bg-[#0B1220] text-white shadow-sm transition-colors">
                <i class="fa-solid fa-route w-5 text-[#B4652F]"></i>
                <span>Route Optimization</span>
            </a>
        </nav>

        <div class="mt-8 pt-6 border-t border-slate-100">
            <div class="bg-[#FCFBF9] p-4 rounded-xl border border-slate-200/60">
                <p class="font-mono text-xs text-slate-700 font-bold mb-1">AI Routing Engine</p>
                <div class="flex items-center gap-2 text-xs text-emerald-600 font-medium">
                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                    <span>Optimized Active (v2.4)</span>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content Container -->
    <main class="flex-grow w-full overflow-hidden">

        <!-- Welcome Banner -->
        <div class="relative bg-[#0B1220] rounded-2xl overflow-hidden p-8 sm:p-10 mb-10 shadow-lg">
            <div class="absolute -top-16 -right-16 w-64 h-64 rounded-3xl bg-[#B4652F] opacity-90 rotate-[24deg] pointer-events-none"></div>
            <div class="relative z-10 max-w-xl">
                <div class="inline-flex items-center gap-2 bg-white/5 border border-white/10 px-3 py-1 rounded-full mb-4">
                    <span class="w-2 h-2 rounded-full bg-[#B4652F]"></span>
                    <span class="font-mono text-xs text-[#9AA5BD] uppercase tracking-wider">Fleet Intelligence & Pathfinding</span>
                </div>
                <h1 class="font-display text-white text-2xl sm:text-3xl font-bold tracking-tight">
                    AI Route Optimization.
                </h1>
                <p class="text-[#9AA5BD] text-xs sm:text-sm mt-2">
                    Analyze real-time traffic conditions, minimize fuel burn, and compute fastest multi-hub delivery pathways.
                </p>
            </div>
        </div>

        <!-- Metrics Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-5 mb-8">
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Avg. Fuel Saved</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">18.4%</h3>
            </div>
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Active Fleet Units</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">32</h3>
            </div>
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Traffic Congestion Index</p>
                <h3 class="font-display text-2xl font-bold text-emerald-600 mt-1">Low (Stage 1)</h3>
            </div>
        </div>

        <!-- Route Paths Table Section -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
            <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                <div>
                    <h3 class="font-display text-base font-semibold text-slate-900">Calculated Dispatch Routes</h3>
                    <p class="text-xs text-slate-500 mt-0.5">Automated corridor analysis for regional freight trucks</p>
                </div>
                <button class="bg-[#0B1220] hover:bg-slate-800 text-white text-xs font-semibold px-4 py-2 rounded-lg transition-colors flex items-center gap-2">
                    <i class="fa-solid fa-rotate text-[10px] text-[#B4652F]"></i>
                    <span>Re-calculate All</span>
                </button>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr class="bg-slate-50 font-mono text-xs text-slate-500 uppercase border-b border-slate-100">
                        <th class="px-6 py-4">Route Code</th>
                        <th class="px-6 py-4">Origin Hub</th>
                        <th class="px-6 py-4">Target Destination</th>
                        <th class="px-6 py-4">Estimated ETA</th>
                        <th class="px-6 py-4 text-right">Optimization Status</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-sm text-slate-600">
                    <c:choose>
                        <c:when test="${not empty routeList}">
                            <c:forEach var="route" items="${routeList}">
                                <tr class="hover:bg-slate-50/50 transition-colors">
                                    <td class="px-6 py-4 font-mono font-medium text-slate-900">${route.routeCode}</td>
                                    <td class="px-6 py-4 font-medium">${route.originHub}</td>
                                    <td class="px-6 py-4 text-slate-500">${route.destinationHub}</td>
                                    <td class="px-6 py-4 font-mono text-xs font-semibold text-slate-700">${route.distanceKm} km</td>
                                    <td class="px-6 py-4 text-right">
                    <span class="px-3 py-1 font-mono text-xs font-semibold text-emerald-700 bg-emerald-50 rounded-full border border-emerald-200">
                            ${route.status}
                    </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="px-6 py-4 text-center text-slate-400 py-8">
                                    No route optimization records found in the database.
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

    </main>

</div>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-8 text-center mt-12">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>