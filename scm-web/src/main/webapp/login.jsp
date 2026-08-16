<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Supply Chain Management - Home</title>
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
            <a href="index.jsp" class="text-sm font-medium text-white hover:text-[#B4652F] transition-colors">Home</a>
            <a href="place_order.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Place Order</a>
            <a href="login.jsp" class="text-sm font-medium text-[#9AA5BD] hover:text-white transition-colors">Sign in</a>
            <a href="register" class="bg-[#B4652F] hover:bg-[#9c5527] text-white text-sm font-semibold px-4 py-2.5 rounded-lg transition-colors">
                Get Started
            </a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<header class="relative bg-[#0B1220] overflow-hidden py-24 lg:py-32 flex-grow flex items-center">
    <!-- Geometric Accents mimicking the login page -->
    <div class="absolute -top-24 -right-28 w-96 h-96 rounded-[3rem] bg-[#B4652F] opacity-90 rotate-[24deg] pointer-events-none"></div>
    <div class="absolute -top-10 -right-40 w-96 h-96 rounded-[3rem] bg-[#0B1220] opacity-100 rotate-[24deg] pointer-events-none"></div>

    <div class="max-w-7xl mx-auto px-6 lg:px-12 relative z-10 w-full">
        <div class="max-w-2xl">
            <div class="inline-flex items-center gap-2 bg-white/5 border border-white/10 px-3.5 py-1.5 rounded-full mb-6">
                <span class="w-2 h-2 rounded-full bg-[#B4652F]"></span>
                <span class="font-mono text-xs text-[#9AA5BD] uppercase tracking-wider">Trusted in 50+ Countries</span>
            </div>
            <h1 class="font-display text-white text-4xl sm:text-6xl font-bold tracking-tight leading-[1.08]">
                Total visibility, from dock to delivery.
            </h1>
            <p class="text-[#9AA5BD] text-lg mt-6 leading-relaxed">
                One platform to plan, track, and reconcile every shipment your company moves across the global supply chain network.
            </p>
            <div class="mt-10 flex flex-col sm:flex-row gap-4">
                <a href="place_order.jsp" class="bg-[#B4652F] hover:bg-[#9c5527] text-white font-semibold text-sm px-7 py-3.5 rounded-lg text-center transition-colors shadow-lg">
                    Start Shipping Now
                </a>
                <a href="login.jsp" class="bg-white/10 hover:bg-white/15 text-white font-semibold text-sm px-7 py-3.5 rounded-lg text-center transition-colors border border-white/10">
                    Sign In to Dashboard
                </a>
            </div>
        </div>
    </div>
</header>

<!-- Features / Highlights Section -->
<section class="py-20 bg-[#FCFBF9]">
    <div class="max-w-7xl mx-auto px-6 lg:px-12">
        <div class="text-center max-w-xl mx-auto mb-16">
            <p class="font-mono text-xs text-[#B4652F] tracking-[0.2em] uppercase">Core Capabilities</p>
            <h2 class="font-display text-3xl font-bold text-slate-900 mt-2">Engineered for global logistics</h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="bg-white p-8 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-6"></div>
                <h3 class="font-display text-lg font-semibold text-slate-900">Real-time tracking</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">See every container, truck, and vessel update the moment it happens through automated timer services.</p>
            </div>

            <!-- Feature 2 -->
            <div class="bg-white p-8 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-6"></div>
                <h3 class="font-display text-lg font-semibold text-slate-900">Automated customs docs</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Manifests and clearance paperwork generated seamlessly for you, eliminating manual bottlenecks.</p>
            </div>

            <!-- Feature 3 -->
            <div class="bg-white p-8 rounded-2xl border border-slate-200/80 shadow-sm relative overflow-hidden">
                <div class="w-1 h-8 rounded-full bg-[#B4652F] mb-6"></div>
                <h3 class="font-display text-lg font-semibold text-slate-900">Unified vendor network</h3>
                <p class="text-slate-600 text-sm mt-2 leading-relaxed">Coordinate securely with carriers and partners across 50+ countries without leaving the platform.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-[#0B1220] border-t border-white/10 py-8 text-center">
    <p class="font-mono text-xs text-[#5B6B85] tracking-[0.15em] uppercase">
        &copy; 2026 Global Supply Chain Management. All rights reserved.
    </p>
</footer>

</body>
</html>