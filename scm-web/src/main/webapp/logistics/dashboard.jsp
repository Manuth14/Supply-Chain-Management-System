<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logistics Portal | Global Supply Chain Management</title>
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
            <a href="${pageContext.request.contextPath}/logistics/dashboard" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-semibold bg-[#0B1220] text-white shadow-sm transition-colors">
                <i class="fa-solid fa-boxes-stacked w-5 text-[#B4652F]"></i>
                <span>Overview Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/shipments" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-chart-pie w-5 text-slate-400"></i>
                <span>Manage Shipments</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/customs-compliance" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-file-shield w-5 text-slate-400"></i>
                <span>Customs & Compliance</span>
            </a>
            <a href="${pageContext.request.contextPath}/logistics/route-optimization" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-50 hover:text-slate-900 transition-colors">
                <i class="fa-solid fa-route w-5 text-slate-400"></i>
                <span>Route Optimization</span>
            </a>
        </nav>

        <div class="mt-8 pt-6 border-t border-slate-100">
            <div class="bg-[#FCFBF9] p-4 rounded-xl border border-slate-200/60">
                <p class="font-mono text-xs text-slate-700 font-bold mb-1">Network Status</p>
                <div class="flex items-center gap-2 text-xs text-emerald-600 font-medium">
                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                    <span>All Regional Hubs Online</span>
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
                    <span class="font-mono text-xs text-[#9AA5BD] uppercase tracking-wider">Dispatch & Delivery Control</span>
                </div>
                <h1 class="font-display text-white text-2xl sm:text-3xl font-bold tracking-tight">
                    Manage Shipments & Dispatches.
                </h1>
                <p class="text-[#9AA5BD] text-xs sm:text-sm mt-2">
                    Monitor active delivery routes, update transit milestones, and manage regional logistics operations seamlessly.
                </p>
            </div>
        </div>

        <!-- Logistics Stats Grid (Dynamic from DB) -->
        <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-5 mb-8">
            <!-- Stat 1: Total Shipments -->
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Total Shipments</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">${totalShipments}</h3>
            </div>
            <!-- Stat 2: Out for Delivery / In Transit -->
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">In Transit</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">${inTransitCount}</h3>
            </div>
            <!-- Stat 3: Delivered Today -->
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Delivered</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">${deliveredCount}</h3>
            </div>
            <!-- Stat 4: Active Routes -->
            <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-6 rounded-full bg-[#B4652F] mb-3"></div>
                <p class="font-mono text-xs text-slate-500 uppercase tracking-wider">Active Routes</p>
                <h3 class="font-display text-2xl font-bold text-slate-900 mt-1">${activeRoutes}</h3>
            </div>
        </div>

        <!-- Active Dispatches Table Section (Dynamic Loop) -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
            <div class="px-6 py-5 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                <div>
                    <h3 class="font-display text-base font-semibold text-slate-900">Active Delivery Queue</h3>
                    <p class="text-xs text-slate-500 mt-0.5">Track shipment statuses and update transit milestones</p>
                </div>
                <button class="bg-[#0B1220] hover:bg-slate-800 text-white text-xs font-semibold px-4 py-2 rounded-lg transition-colors">
                    Filter Routes
                </button>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr class="bg-slate-50 font-mono text-xs text-slate-500 uppercase border-b border-slate-100">
                        <th class="px-6 py-4">Tracking ID</th>
                        <th class="px-6 py-4">Current Location</th>
                        <th class="px-6 py-4">Order Ref</th>
                        <th class="px-6 py-4">Current Status</th>
                        <th class="px-6 py-4 text-right">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-sm text-slate-600">
                    <c:choose>
                        <c:when test="${not empty activeShipments}">
                            <c:forEach var="shipment" items="${activeShipments}">
                                <tr class="hover:bg-slate-50/50 transition-colors">
                                    <td class="px-6 py-4 font-mono font-medium text-slate-900">#TRK-${shipment.id}</td>
                                    <td class="px-6 py-4 font-medium">${shipment.currentLocation != null ? shipment.currentLocation : 'Hub Processing'}</td>
                                    <td class="px-6 py-4 font-mono text-xs">ORD-${shipment.order.id}</td>
                                    <td class="px-6 py-4">
                                        <span class="px-3 py-1 font-mono text-xs font-semibold text-blue-700 bg-blue-50 rounded-full border border-blue-200">
                                                ${shipment.status}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button type="button"
                                                onclick="openUpdateModal('${shipment.id}', '${shipment.status}', '${shipment.currentLocation}')"
                                                class="text-xs font-semibold text-[#B4652F] hover:underline bg-[#B4652F]/10 px-3 py-1.5 rounded-md">
                                            Update Status
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="px-6 py-4 text-center text-slate-400 py-8">
                                    No shipment records found in the database.
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

<!-- Update Status Modal -->
<div id="updateModal" class="hidden fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
    <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl border border-slate-200">
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-display text-lg font-bold text-slate-900">Update Shipment Status</h3>
            <button onclick="closeUpdateModal()" class="text-slate-400 hover:text-slate-600">
                <i class="fa-solid fa-xmark text-lg"></i>
            </button>
        </div>

        <form action="${pageContext.request.contextPath}/logistics/update-shipment" method="POST" class="space-y-4">
            <!-- Hidden Shipment ID -->
            <input type="hidden" id="modalShipmentId" name="shipmentId">

            <div>
                <label class="block font-mono text-xs text-slate-600 uppercase mb-1">New Status</label>
                <select name="status" id="modalStatus" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm font-medium focus:outline-none focus:border-[#B4652F]">
                    <option value="ORDER_PLACED">ORDER_PLACED</option>
                    <option value="DISPATCHED">DISPATCHED</option>
                    <option value="IN_TRANSIT">IN_TRANSIT</option>
                    <option value="DELIVERED">DELIVERED</option>
                </select>
            </div>

            <div>
                <label class="block font-mono text-xs text-slate-600 uppercase mb-1">Current Location / Hub</label>
                <input type="text" id="modalLocation" name="currentLocation" required
                       class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm font-medium focus:outline-none focus:border-[#B4652F]"
                       placeholder="e.g. Colombo 03 Central Hub">
            </div>

            <div class="flex justify-end gap-3 mt-6">
                <button type="button" onclick="closeUpdateModal()" class="px-4 py-2 rounded-xl text-sm font-semibold bg-slate-100 hover:bg-slate-200 text-slate-600 transition-colors">
                    Cancel
                </button>
                <button type="submit" class="px-4 py-2 rounded-xl text-sm font-semibold bg-[#0B1220] hover:bg-slate-800 text-white transition-colors">
                    Save Changes
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Modal Control Script -->
<script>
    function openUpdateModal(id, currentStatus, currentLocation) {
        document.getElementById('modalShipmentId').value = id;
        document.getElementById('modalStatus').value = currentStatus;
        document.getElementById('modalLocation').value = currentLocation !== 'null' ? currentLocation : '';
        document.getElementById('updateModal').classList.remove('hidden');
    }

    function closeUpdateModal() {
        document.getElementById('updateModal').classList.add('hidden');
    }
</script>

</body>
</html>