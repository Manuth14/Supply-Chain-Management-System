<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <option value="PENDING">Pending</option>
                    <option value="IN_TRANSIT">In Transit</option>
                    <option value="OUT_FOR_DELIVERY">Out for Delivery</option>
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
                        <th class="px-6 py-4">Destination / Route</th>
                        <th class="px-6 py-4">Carrier / Staff</th>
                        <th class="px-6 py-4">Current Status</th>
                        <th class="px-6 py-4 text-right">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-sm text-slate-600">

                    <!-- Row 1 -->
                    <tr class="hover:bg-slate-50/50 transition-colors">
                        <td class="px-6 py-4 font-mono font-medium text-slate-900">#TRK-4081</td>
                        <td class="px-6 py-4 font-medium">Colombo 03 Hub</td>
                        <td class="px-6 py-4 text-slate-500">Saman Kumara (DHL)</td>
                        <td class="px-6 py-4">
                            <span class="px-3 py-1 font-mono text-xs font-semibold text-blue-700 bg-blue-50 rounded-full border border-blue-200">Out for Delivery</span>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <button onclick="openUpdateModal('#TRK-4081', 'OUT_FOR_DELIVERY')" class="text-xs font-semibold text-[#B4652F] hover:bg-[#B4652F]/20 bg-[#B4652F]/10 px-3.5 py-2 rounded-lg transition-colors">
                                <i class="fa-solid fa-pen-to-square mr-1"></i> Update Status
                            </button>
                        </td>
                    </tr>

                    <!-- Row 2 -->
                    <tr class="hover:bg-slate-50/50 transition-colors">
                        <td class="px-6 py-4 font-mono font-medium text-slate-900">#TRK-4080</td>
                        <td class="px-6 py-4 font-medium">Gampaha Distribution Center</td>
                        <td class="px-6 py-4 text-slate-500">Chathura Perera (FedEx)</td>
                        <td class="px-6 py-4">
                            <span class="px-3 py-1 font-mono text-xs font-semibold text-amber-700 bg-amber-50 rounded-full border border-amber-200">In Transit</span>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <button onclick="openUpdateModal('#TRK-4080', 'IN_TRANSIT')" class="text-xs font-semibold text-[#B4652F] hover:bg-[#B4652F]/20 bg-[#B4652F]/10 px-3.5 py-2 rounded-lg transition-colors">
                                <i class="fa-solid fa-pen-to-square mr-1"></i> Update Status
                            </button>
                        </td>
                    </tr>

                    <!-- Row 3 -->
                    <tr class="hover:bg-slate-50/50 transition-colors">
                        <td class="px-6 py-4 font-mono font-medium text-slate-900">#TRK-4079</td>
                        <td class="px-6 py-4 font-medium">Kandy Central Warehouse</td>
                        <td class="px-6 py-4 text-slate-500">Nuwan Silva (Local Fleet)</td>
                        <td class="px-6 py-4">
                            <span class="px-3 py-1 font-mono text-xs font-semibold text-slate-600 bg-slate-100 rounded-full border border-slate-200">Pending</span>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <button onclick="openUpdateModal('#TRK-4079', 'PENDING')" class="text-xs font-semibold text-[#B4652F] hover:bg-[#B4652F]/20 bg-[#B4652F]/10 px-3.5 py-2 rounded-lg transition-colors">
                                <i class="fa-solid fa-pen-to-square mr-1"></i> Update Status
                            </button>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <!-- Table Pagination Footer -->
            <div class="px-6 py-4 border-t border-slate-100 bg-slate-50/50 flex items-center justify-between text-xs text-slate-500">
                <span>Showing <strong class="text-slate-700">3</strong> of <strong class="text-slate-700">42</strong> total shipments</span>
                <div class="flex items-center gap-2">
                    <button class="px-3 py-1.5 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 text-slate-600 font-medium">Previous</button>
                    <button class="px-3 py-1.5 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 text-slate-600 font-medium">Next</button>
                </div>
            </div>
        </div>

    </main>

</div>

<!-- Status Update Modal (Hidden by Default) -->
<div id="statusModal" class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-xl border border-slate-200">
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-display text-lg font-semibold text-slate-900">Update Shipment Status</h3>
            <button onclick="closeUpdateModal()" class="text-slate-400 hover:text-slate-600">
                <i class="fa-solid fa-xmark text-lg"></i>
            </button>
        </div>
        <p class="text-xs text-slate-500 mb-4">Modifying tracking milestone for item: <span id="modalTrackingId" class="font-mono font-bold text-slate-800"></span></p>

        <form action="#" method="POST">
            <div class="mb-4">
                <label class="block text-xs font-mono uppercase tracking-wider text-slate-600 mb-2">New Milestone Status</label>
                <select id="statusSelect" class="w-full bg-slate-50 border border-slate-200 text-sm rounded-xl px-4 py-3 focus:outline-none focus:border-[#B4652F]">
                    <option value="PENDING">PENDING</option>
                    <option value="IN_TRANSIT">IN_TRANSIT</option>
                    <option value="OUT_FOR_DELIVERY">OUT_FOR_DELIVERY</option>
                    <option value="DELIVERED">DELIVERED</option>
                </select>
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
    function openUpdateModal(trackingId, currentStatus) {
        document.getElementById('modalTrackingId').innerText = trackingId;
        document.getElementById('statusSelect').value = currentStatus;
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