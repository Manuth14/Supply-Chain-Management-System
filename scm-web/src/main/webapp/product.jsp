<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products & Cargo Catalog - Global Supply Chain Management</title>
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
            <a href="product.jsp" class="text-sm font-medium text-white hover:text-[#B4652F] transition-colors">Products</a>
            <a href="place_order.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Place Order</a>
            <a href="login.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Sign in</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="py-16 px-6 lg:px-12 max-w-7xl mx-auto flex-grow">
    <div class="text-center max-w-2xl mx-auto mb-16">
        <p class="font-mono text-xs text-[#B4652F] tracking-[0.2em] uppercase">Global Logistics Catalog</p>
        <h1 class="font-display text-3xl sm:text-4xl font-bold text-slate-900 mt-2">Available Cargo & Item Categories</h1>
        <p class="text-slate-600 text-sm mt-3">Select a standardized shipping category below to proceed with your order placement and real-time rate estimation.</p>
    </div>

    <!-- Products Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

        <!-- Product Card 1 -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between hover:shadow-md transition-shadow">
            <div class="p-6">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
                <h3 class="font-display text-xl font-semibold text-slate-900">Industrial Machinery</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Heavy-duty factory parts, mechanical components, and industrial equipment handling.</p>
                <div class="mt-6 flex items-center justify-between border-t border-slate-100 pt-4">
                    <span class="text-xs font-mono text-slate-500 uppercase">Rate / kg</span>
                    <span class="font-display text-lg font-bold text-[#B4652F]">$15.00</span>
                </div>
            </div>
            <div class="px-6 pb-6">
                <a href="place_order.jsp?item=industrial_machinery" class="w-full block text-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors">
                    Order This Item
                </a>
            </div>
        </div>

        <!-- Product Card 2 -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between hover:shadow-md transition-shadow">
            <div class="p-6">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
                <h3 class="font-display text-xl font-semibold text-slate-900">Consumer Electronics</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Secure transport for delicate electronics, computing units, and communication hardware.</p>
                <div class="mt-6 flex items-center justify-between border-t border-slate-100 pt-4">
                    <span class="text-xs font-mono text-slate-500 uppercase">Rate / kg</span>
                    <span class="font-display text-lg font-bold text-[#B4652F]">$25.00</span>
                </div>
            </div>
            <div class="px-6 pb-6">
                <a href="place_order.jsp?item=electronics" class="w-full block text-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors">
                    Order This Item
                </a>
            </div>
        </div>

        <!-- Product Card 3 -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between hover:shadow-md transition-shadow">
            <div class="p-6">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
                <h3 class="font-display text-xl font-semibold text-slate-900">Textiles & Garments</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Bulk apparel, fabric rolls, and textile merchandise shipped via optimized freight lanes.</p>
                <div class="mt-6 flex items-center justify-between border-t border-slate-100 pt-4">
                    <span class="text-xs font-mono text-slate-500 uppercase">Rate / kg</span>
                    <span class="font-display text-lg font-bold text-[#B4652F]">$8.00</span>
                </div>
            </div>
            <div class="px-6 pb-6">
                <a href="place_order.jsp?item=textiles" class="w-full block text-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors">
                    Order This Item
                </a>
            </div>
        </div>

        <!-- Product Card 4 -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between hover:shadow-md transition-shadow">
            <div class="p-6">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
                <h3 class="font-display text-xl font-semibold text-slate-900">Pharmaceuticals</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Temperature-controlled medical supplies, vaccines, and pharmaceutical drugs.</p>
                <div class="mt-6 flex items-center justify-between border-t border-slate-100 pt-4">
                    <span class="text-xs font-mono text-slate-500 uppercase">Rate / kg</span>
                    <span class="font-display text-lg font-bold text-[#B4652F]">$30.00</span>
                </div>
            </div>
            <div class="px-6 pb-6">
                <a href="place_order.jsp?item=pharma" class="w-full block text-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors">
                    Order This Item
                </a>
            </div>
        </div>

        <!-- Product Card 5 -->
        <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between hover:shadow-md transition-shadow">
            <div class="p-6">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-4"></div>
                <h3 class="font-display text-xl font-semibold text-slate-900">Raw Materials / Steel</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Structural steel elements, metallic coils, and heavy manufacturing raw resources.</p>
                <div class="mt-6 flex items-center justify-between border-t border-slate-100 pt-4">
                    <span class="text-xs font-mono text-slate-500 uppercase">Rate / kg</span>
                    <span class="font-display text-lg font-bold text-[#B4652F]">$12.00</span>
                </div>
            </div>
            <div class="px-6 pb-6">
                <a href="place_order.jsp?item=raw_materials" class="w-full block text-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220] hover:bg-[#151f33] transition-colors">
                    Order This Item
                </a>
            </div>
        </div>

    </div>
</main>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-6 text-center">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>