<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    // Resolve a status code from either the container's error dispatch
    // or a forwarded request attribute, defaulting to 500.
    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    if (statusCode == null) {
        statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
    }
    if (statusCode == null && exception != null) {
        statusCode = 500;
    }
    if (statusCode == null) {
        statusCode = 500;
    }

    String heading;
    String message;
    switch (statusCode) {
        case 404:
            heading = "Page not found";
            message = "The page you're looking for doesn't exist or may have been moved.";
            break;
        case 403:
            heading = "Access denied";
            message = "You don't have permission to view this page. Sign in with an account that has access.";
            break;
        case 401:
            heading = "Session expired";
            message = "Your session has ended. Please sign in again to continue.";
            break;
        default:
            heading = "Something went wrong";
            message = "An unexpected error occurred while processing your request. Please try again.";
    }
    // Note: exception details are intentionally not rendered here.
    // Log exception server-side (e.g. via a logging framework) instead of exposing it to the user.
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Supply Chain Management - <%= heading %></title>
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

    <!-- Left brand panel (matches login.jsp / signup.jsp) -->
    <div class="hidden lg:flex lg:w-[46%] relative bg-[#0B1220] overflow-hidden flex-col justify-between px-14 py-14">

        <div class="absolute -top-24 -right-28 w-96 h-96 rounded-[3rem] bg-[#B4652F] opacity-90 rotate-[24deg]"></div>
        <div class="absolute -top-10 -right-40 w-96 h-96 rounded-[3rem] bg-[#0B1220] opacity-100 rotate-[24deg]"></div>
        <div class="absolute -top-24 -right-28 w-96 h-96 rounded-[3rem] border border-white/10 rotate-[24deg]"></div>

        <div class="relative">
            <p class="font-display text-white text-2xl font-semibold tracking-tight">Global</p>
            <p class="font-mono text-[11px] text-[#B4652F] tracking-[0.2em] uppercase mt-1">Supply Chain Management</p>
        </div>

        <div class="relative max-w-md">
            <h1 class="font-display text-white text-[2.65rem] leading-[1.08] font-bold tracking-tight">
                We're rerouting you.
            </h1>
            <p class="text-[#9AA5BD] text-base mt-5 leading-relaxed">
                Something didn't go as planned, but your data and shipments are safe. Let's get you back on track.
            </p>
        </div>

        <p class="relative font-mono text-[11px] text-[#5B6B85] tracking-[0.15em] uppercase">
            Trusted by logistics teams in 40+ countries
        </p>
    </div>

    <!-- Right error panel -->
    <div class="flex-1 flex flex-col justify-center px-6 sm:px-12 lg:px-20 py-12">
        <div class="w-full max-w-sm mx-auto">

            <div class="lg:hidden mb-10">
                <p class="font-display text-slate-900 text-2xl font-semibold tracking-tight">Global</p>
                <p class="font-mono text-[11px] text-[#B4652F] tracking-[0.2em] uppercase mt-1">Supply Chain Management</p>
            </div>

            <p class="font-mono text-sm text-[#B4652F] tracking-[0.15em]"><%= statusCode %></p>
            <h2 class="font-display text-2xl font-semibold text-slate-900 mt-2"><%= heading %></h2>
            <p class="text-sm text-slate-500 mt-2 leading-relaxed"><%= message %></p>

            <div class="mt-8 space-y-3">
                <a href="${pageContext.request.contextPath}/"
                   class="w-full flex justify-center py-2.5 px-4 rounded-lg text-sm font-semibold text-white bg-[#0B1220]
                          hover:bg-[#151f33] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#0B1220] transition-colors">
                    Back to dashboard
                </a>
                <a href="javascript:history.back()"
                   class="w-full flex justify-center py-2.5 px-4 rounded-lg text-sm font-semibold text-slate-700 bg-white border border-slate-300
                          hover:bg-slate-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-300 transition-colors">
                    Go back
                </a>
            </div>

            <p class="mt-8 text-center text-sm text-slate-500">
                Need help?
                <a href="mailto:support@globalscm.com" class="font-semibold text-[#B4652F] hover:text-[#9c5527]">Contact support</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>
