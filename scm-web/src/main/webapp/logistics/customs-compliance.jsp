<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customs & Trade Compliance | SCM Admin</title>
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
                <p class="font-mono text-[10px] text-[#B4652F] uppercase">System Administrator</p>
            </div>
            <div class="w-10 h-10 rounded-xl bg-[#B4652F]/10 border border-[#B4652F]/30 text-[#B4652F] font-display font-bold flex items-center justify-center">
                A
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
            <a href="dashboard" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-chart-pie w-5 text-slate-400"></i>
                <span>Overview Dashboard</span>
            </a>
            <a href="shipments.jsp" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-boxes-stacked w-5 text-slate-400"></i>
                <span>Manage Shipments</span>
            </a>
            <a href="customs-compliance.jsp" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-semibold bg-[#0B1220] text-white shadow-sm transition-colors">
                <i class="fa-solid fa-file-shield w-5 text-[#B4652F]"></i>
                <span>Customs & Compliance</span>
            </a>
            <a href="route-optimization.jsp" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-route w-5 text-slate-400"></i>
                <span>Route Optimization</span>
            </a>
        </nav>

        <div class="mt-8 pt-6 border-t border-slate-100">
            <div class="bg-[#FCFBF9] p-4 rounded-xl border border-slate-200/60">
                <p class="font-mono text-xs text-slate-700 font-bold mb-1">Customs Gateway</p>
                <div class="flex items-center gap-2 text-xs text-emerald-600 font-medium">
                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                    <span>Synchronized (v2.1)</span>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content Container -->
    <main class="flex-grow w-full overflow-hidden">

        <!-- Page Header & Breadcrumbs -->
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
            <div>
                <div class="flex items-center gap-2 text-xs font-mono text-slate-500 uppercase tracking-wider mb-1">
                    <a href="dashboard.jsp" class="hover:text-[#B4652F]">Dashboard</a>
                    <span>/</span>
                    <span class="text-[#B4652F]">Customs & Compliance</span>
                </div>
                <h1 class="font-display text-slate-900 text-3xl font-bold tracking-tight">International Trade & Customs Compliance</h1>
            </div>
            <div class="inline-flex items-center gap-2 bg-emerald-50 border border-emerald-200 px-4 py-2 rounded-xl text-emerald-700 text-xs font-mono font-semibold self-start sm:self-auto">
                <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                <span>Gateway Synchronized</span>
            </div>
        </div>

        <!-- Compliance Table Section -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
            <div class="px-6 py-5 border-b border-slate-100 flex flex-col sm:flex-row sm:items-center justify-between gap-4 bg-slate-50/50">
                <div>
                    <h3 class="font-display text-base font-semibold text-slate-900">Active Trade Declarations</h3>
                    <p class="text-xs text-slate-500 mt-0.5">Monitor HS codes, regional trade agreements, and estimated tariff duties</p>
                </div>
                <div class="relative w-full sm:w-64">
                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-slate-400">
                        <i class="fa-solid fa-magnifying-glass text-xs"></i>
                    </span>
                    <input type="text" placeholder="Search by Order ID or HS Code..." class="w-full bg-white border border-slate-200 text-xs rounded-xl pl-9 pr-4 py-2 focus:outline-none focus:border-[#B4652F] transition-colors">
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr class="bg-slate-50/70 font-mono text-xs text-slate-500 uppercase border-b border-slate-100">
                        <th class="px-6 py-4">Order ID</th>
                        <th class="px-6 py-4">HS Code</th>
                        <th class="px-6 py-4">Trade Agreement</th>
                        <th class="px-6 py-4">Estimated Duty</th>
                        <th class="px-6 py-4">Compliance Status</th>
                        <th class="px-6 py-4 text-right">Declaration</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-sm text-slate-600">
                    <c:choose>
                        <c:when test="${not empty complianceList}">
                            <c:forEach var="doc" items="${complianceList}">
                                <tr class="hover:bg-slate-50/50 transition-colors">
                                    <td class="px-6 py-4 font-mono font-medium text-slate-900">#${doc.order.id}</td>
                                    <td class="px-6 py-4 font-mono">${doc.hsCode}</td>
                                    <td class="px-6 py-4 font-medium">${doc.tradeAgreement}</td>
                                    <td class="px-6 py-4 font-mono font-semibold text-slate-900">$${doc.estimatedDuty}</td>
                                    <td class="px-6 py-4">
                                        <span class="px-3 py-1 font-mono text-xs font-semibold text-emerald-700 bg-emerald-50 rounded-full border border-emerald-200">${doc.complianceStatus}</span>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <span class="px-3 py-1 font-mono text-xs font-semibold text-amber-700 bg-amber-50 rounded-full border border-amber-200">${doc.declarationStatus}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <!-- Fallback sample rows if JSTL list is empty during mock previews -->
                            <tr class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 font-mono font-medium text-slate-900">#ORD-501</td>
                                <td class="px-6 py-4 font-mono text-xs">8471.30.00</td>
                                <td class="px-6 py-4 font-medium">Free Trade Agreement (FTA)</td>
                                <td class="px-6 py-4 font-mono font-semibold text-slate-900">$142.50</td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 font-mono text-xs font-semibold text-emerald-700 bg-emerald-50 rounded-full border border-emerald-200">COMPLIANT</span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <span class="px-3 py-1 font-mono text-xs font-semibold text-amber-700 bg-amber-50 rounded-full border border-amber-200">PENDING_REVIEW</span>
                                </td>
                            </tr>
                            <tr class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 font-mono font-medium text-slate-900">#ORD-502</td>
                                <td class="px-6 py-4 font-mono text-xs">9403.60.90</td>
                                <td class="px-6 py-4 font-medium">Standard Tariff Scheme</td>
                                <td class="px-6 py-4 font-mono font-semibold text-slate-900">$380.00</td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 font-mono text-xs font-semibold text-blue-700 bg-blue-50 rounded-full border border-blue-200">VERIFIED</span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <span class="px-3 py-1 font-mono text-xs font-semibold text-emerald-700 bg-emerald-50 rounded-full border border-emerald-200">CLEARED</span>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- Table Footer Pagination -->
            <div class="px-6 py-4 border-t border-slate-100 bg-slate-50/50 flex items-center justify-between text-xs text-slate-500">
                <span>Enterprise customs trade records active</span>
                <div class="flex items-center gap-2">
                    <button class="px-3 py-1.5 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 text-slate-600 font-medium">Previous</button>
                    <button class="px-3 py-1.5 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 text-slate-600 font-medium">Next</button>
                </div>
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