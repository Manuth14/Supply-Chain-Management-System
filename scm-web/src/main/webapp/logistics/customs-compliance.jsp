<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customs & Trade Compliance - SCM Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-50 p-8">
<div class="max-w-6xl mx-auto bg-white p-6 rounded-xl shadow-sm border border-slate-200">
    <h1 class="text-xl font-bold text-slate-900 mb-4">International Trade & Customs Compliance</h1>

    <table class="w-full text-left border-collapse">
        <thead>
        <tr class="border-b text-xs font-mono text-slate-500 uppercase">
            <th class="py-3 px-4">Order ID</th>
            <th class="py-3 px-4">HS Code</th>
            <th class="py-3 px-4">Trade Agreement</th>
            <th class="py-3 px-4">Estimated Duty</th>
            <th class="py-3 px-4">Compliance Status</th>
            <th class="py-3 px-4">Declaration</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="doc" items="${complianceList}">
            <tr class="border-b text-sm text-slate-700">
                <td class="py-3 px-4 font-mono font-bold">#${doc.order.id}</td>
                <td class="py-3 px-4">${doc.hsCode}</td>
                <td class="py-3 px-4">${doc.tradeAgreement}</td>
                <td class="py-3 px-4">$${doc.estimatedDuty}</td>
                <td class="py-3 px-4">
                    <span class="px-2.5 py-1 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-600">${doc.complianceStatus}</span>
                </td>
                <td class="py-3 px-4">
                    <span class="px-2.5 py-1 rounded-full text-xs font-semibold bg-amber-50 text-amber-600">${doc.declarationStatus}</span>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>