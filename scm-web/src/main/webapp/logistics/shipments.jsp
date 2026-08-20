<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Shipments | Logistics Portal</title>
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

    <!-- Main Content Container -->
    <main class="flex-grow w-full overflow-hidden">

        <!-- Page Header Banner / Navigation breadcrumbs -->
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
            <div>
                <div class="flex items-center gap-2 text-xs font-mono text-slate-500 uppercase tracking-wider mb-1">
                    <a href="dashboard" class="hover:text-[#B4652F]">Dashboard</a>
                    <span>/</span>
                    <span class="text-[#B4652F]">Shipment Management</span>
                </div>
                <h1 class="font-display text-slate-900 text-3xl font-bold tracking-tight">Shipment Lifecycle Directory</h1>
            </div>
            <button onclick="openCreateModal()" class="bg-[#0B1220] hover:bg-slate-800 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-all shadow-sm flex items-center gap-2 self-start sm:self-auto">
                <i class="fa-solid fa-plus text-xs text-[#B4652F]"></i>
                <span>Create New Dispatch</span>
            </button>
        </div>

        <!-- Filter & Search Bar -->
        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm mb-6 flex flex-col sm:flex-row items-center justify-between gap-4">
            <div class="relative w-full sm:w-80">
                <span class="absolute inset-y-0 left-0 flex items-center pl-4 pointer-events-none text-slate-400">
                    <i class="fa-solid fa-magnifying-glass text-xs"></i>
                </span>
                <input type="text" placeholder="Search by Tracking ID, Hub, or Carrier..." class="w-full bg-slate-50 border border-slate-200 text-sm rounded-xl pl-10 pr-4 py-2.5 focus:outline-none focus:border-[#B4652F] transition-colors">
            </div>
            <div class="flex items-center gap-3 w-full sm:w-auto">
                <select class="bg-slate-50 border border-slate-200 text-xs font-medium text-slate-600 rounded-xl px-4 py-2.5 focus:outline-none focus:border-[#B4652F]">
                    <option value="">Filter by Status</option>
                    <option value="ORDER_PLACED">Order Placed</option>
                    <option value="DISPATCHED">Dispatched</option>
                    <option value="IN_TRANSIT">In Transit</option>
                    <option value="DELIVERED">Delivered</option>
                </select>
            </div>
        </div>

        <!-- Shipments Main Table Section -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr class="bg-slate-50/70 font-mono text-xs text-slate-500 uppercase border-b border-slate-100">
                        <th class="px-6 py-4">Tracking ID</th>
                        <th class="px-6 py-4">Current Location / Hub</th>
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
                                                class="text-xs font-semibold text-[#B4652F] hover:bg-[#B4652F]/20 bg-[#B4652F]/10 px-3.5 py-2 rounded-lg transition-colors">
                                            <i class="fa-solid fa-pen-to-square mr-1"></i> Update Status
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

            <!-- Table Pagination Footer -->
            <div class="px-6 py-4 border-t border-slate-100 bg-slate-50/50 flex items-center justify-between text-xs text-slate-500">
                <span>Showing dynamic results from database</span>
            </div>
        </div>

    </main>

</div>

<!-- Status Update Modal (Hidden by Default) -->
<div id="statusModal" class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-xl border border-slate-200">
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-display text-lg font-semibold text-slate-900">Update Shipment Status</h3>
            <button type="button" onclick="closeUpdateModal()" class="text-slate-400 hover:text-slate-600">
                <i class="fa-solid fa-xmark text-lg"></i>
            </button>
        </div>
        <p class="text-xs text-slate-500 mb-4">Modifying tracking milestone for item ID: <span id="modalDisplayId" class="font-mono font-bold text-slate-800"></span></p>

        <form action="${pageContext.request.contextPath}/logistics/update-shipment" method="POST" class="space-y-4">
            <!-- Hidden Input for Shipment ID -->
            <input type="hidden" id="modalShipmentId" name="shipmentId">

            <div>
                <label class="block text-xs font-mono uppercase tracking-wider text-slate-600 mb-2">New Milestone Status</label>
                <select name="status" id="statusSelect" class="w-full bg-slate-50 border border-slate-200 text-sm rounded-xl px-4 py-3 focus:outline-none focus:border-[#B4652F]">
                    <option value="ORDER_PLACED">ORDER_PLACED</option>
                    <option value="DISPATCHED">DISPATCHED</option>
                    <option value="IN_TRANSIT">IN_TRANSIT</option>
                    <option value="DELIVERED">DELIVERED</option>
                </select>
            </div>

            <div>
                <label class="block text-xs font-mono uppercase tracking-wider text-slate-600 mb-2">Current Location / Hub</label>
                <input type="text" id="modalLocation" name="currentLocation" required
                       class="w-full bg-slate-50 border border-slate-200 text-sm rounded-xl px-4 py-3 focus:outline-none focus:border-[#B4652F]"
                       placeholder="e.g. Colombo 03 Central Hub">
            </div>

            <div class="flex justify-end gap-3 mt-6">
                <button type="button" onclick="closeUpdateModal()" class="px-4 py-2 rounded-xl border border-slate-200 text-xs font-semibold text-slate-600 hover:bg-slate-50">Cancel</button>
                <button type="submit" class="px-5 py-2 rounded-xl bg-[#0B1220] hover:bg-slate-800 text-xs font-semibold text-white">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-8 text-center mt-12">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

<!-- Interactive Modal Scripts -->
<script>
    function openUpdateModal(id, currentStatus, currentLocation) {
        document.getElementById('modalShipmentId').value = id;
        document.getElementById('modalDisplayId').innerText = '#TRK-' + id;
        document.getElementById('statusSelect').value = currentStatus;
        document.getElementById('modalLocation').value = (currentLocation !== 'null' && currentLocation !== '') ? currentLocation : '';
        document.getElementById('statusModal').classList.remove('hidden');
    }

    function closeUpdateModal() {
        document.getElementById('statusModal').classList.add('hidden');
    }

    function openCreateModal() {
        alert("Redirect to Create Dispatch form or open creation modal.");
    }
</script>

</body>
</html>