<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Supply Chain Management - Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700;800&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .font-display { font-family: 'Space Grotesk', sans-serif; }
        .font-mono { font-family: 'JetBrains Mono', monospace; }
    </style>
</head>
<body class="bg-[#FCFBF9] min-h-screen antialiased">

<div class="min-h-screen flex">

    <!-- Left brand panel -->
    <div class="hidden lg:flex lg:w-[46%] relative bg-[#0B1220] overflow-hidden flex-col justify-between px-14 py-14">

        <!-- Bold geometric accent, bleeding off the top-right corner -->
        <div class="absolute -top-24 -right-28 w-96 h-96 rounded-[3rem] bg-[#B4652F] opacity-90 rotate-[24deg]"></div>
        <div class="absolute -top-10 -right-40 w-96 h-96 rounded-[3rem] bg-[#0B1220] opacity-100 rotate-[24deg]"></div>
        <div class="absolute -top-24 -right-28 w-96 h-96 rounded-[3rem] border border-white/10 rotate-[24deg]"></div>

        <!-- Logo -->
        <div class="relative">
            <p class="font-display text-white text-2xl font-semibold tracking-tight">Global</p>
            <p class="font-mono text-[11px] text-[#B4652F] tracking-[0.2em] uppercase mt-1">Supply Chain Management</p>
        </div>

        <!-- Headline + features -->
        <div class="relative max-w-md">
            <h1 class="font-display text-white text-[2.65rem] leading-[1.08] font-bold tracking-tight">
                Total visibility, from dock to delivery.
            </h1>
            <p class="text-[#9AA5BD] text-base mt-5 leading-relaxed">
                One platform to plan, track, and reconcile every shipment your company moves.
            </p>

            <div class="mt-11 space-y-6">
                <div class="flex gap-4">
                    <div class="w-1 shrink-0 rounded-full bg-[#B4652F]"></div>
                    <div>
                        <p class="text-white font-semibold text-[15px]">Real-time tracking</p>
                        <p class="text-[#8B96AC] text-sm mt-0.5">See every container, truck, and vessel update the moment it happens.</p>
                    </div>
                </div>
                <div class="flex gap-4">
                    <div class="w-1 shrink-0 rounded-full bg-[#B4652F]"></div>
                    <div>
                        <p class="text-white font-semibold text-[15px]">Automated customs docs</p>
                        <p class="text-[#8B96AC] text-sm mt-0.5">Manifests and clearance paperwork generated for you, automatically.</p>
                    </div>
                </div>
                <div class="flex gap-4">
                    <div class="w-1 shrink-0 rounded-full bg-[#B4652F]"></div>
                    <div>
                        <p class="text-white font-semibold text-[15px]">Unified vendor network</p>
                        <p class="text-[#8B96AC] text-sm mt-0.5">Coordinate with carriers and partners without leaving the platform.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Trust line -->
        <p class="relative font-mono text-[11px] text-[#5B6B85] tracking-[0.15em] uppercase">
            Trusted by logistics teams in 40+ countries
        </p>
    </div>

    <!-- Right form panel -->
    <div class="flex-1 flex flex-col justify-center px-6 sm:px-12 lg:px-20 py-12">
        <div class="w-full max-w-sm mx-auto">

            <div class="lg:hidden mb-10">
                <p class="font-display text-slate-900 text-2xl font-semibold tracking-tight">Global</p>
                <p class="font-mono text-[11px] text-[#B4652F] tracking-[0.2em] uppercase mt-1">Supply Chain Management</p>
            </div>

            <h2 class="font-display text-2xl font-semibold text-slate-900">Sign in to your account</h2>
            <p class="text-sm text-slate-500 mt-1.5">Track shipments, manage orders, and view your manifests.</p>

            <!-- Custom Exception Error Message Display -->
            <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mt-6 flex items-center gap-3 text-sm font-medium shadow-sm animate-fade-in">
                <i class="fa-solid fa-circle-exclamation text-red-500 text-base"></i>
                <span><%= request.getAttribute("errorMessage") %></span>
            </div>
            <% } %>

            <form class="mt-5 space-y-5" action="login" method="POST">
                <div>
                    <label for="email" class="block text-sm font-medium text-slate-700">Email address</label>
                    <div class="mt-1.5">
                        <input id="email" name="email" type="email" required placeholder="you@company.com"
                               class="block w-full px-3.5 py-2.5 border border-slate-300 rounded-lg shadow-sm placeholder-slate-400 text-sm text-slate-900
                                      focus:outline-none focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F] transition-colors">
                    </div>
                </div>

                <div>
                    <div class="flex items-center justify-between">
                        <label for="password" class="block text-sm font-medium text-slate-700">Password</label>
                        <a href="#" class="text-xs font-medium text-[#B4652F] hover:text-[#9c5527]">Forgot password?</a>
                    </div>
                    <div class="mt-1.5">
                        <input id="password" name="password" type="password" required placeholder="••••••••"
                               class="block w-full px-3.5 py-2.5 border border-slate-300 rounded-lg shadow-sm placeholder-slate-400 text-sm text-slate-900
                                      focus:outline-none focus:ring-2 focus:ring-[#B4652F]/30 focus:border-[#B4652F] transition-colors">
                    </div>
                </div>

                <div class="flex items-center">
                    <input id="remember" name="remember" type="checkbox"
                           class="h-4 w-4 rounded border-slate-300 text-[#B4652F] focus:ring-[#B4652F]/30">
                    <label for="remember" class="ml-2 text-sm text-slate-600">Keep me signed in</label>
                </div>

                <button type="submit"
                        class="w-full flex justify-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220]
                               hover:bg-[#151f33] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#0B1220] transition-colors">
                    Sign in
                </button>
            </form>

            <p class="mt-8 text-center text-sm text-slate-500">
                Don't have an account?
                <a href="register" class="font-semibold text-[#B4652F] hover:text-[#9c5527]">Create one</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>
