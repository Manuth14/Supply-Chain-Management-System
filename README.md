# 🌐 GlobalTrade Logistics Corporation - SCM Platform

A modern, enterprise-scale **Global Supply Chain Management System** built using **Java/Jakarta EE** and a robust **Multi-module Architecture**. Designed to handle multinational logistics operations, automated inventory replenishment, and secure cross-border trade compliance.

---

## 🏗️ Multi-Module Architecture

The project is structured into 6 core independent modules for high maintainability, scalability, and independent updates:

1. **`scm-core`** (`jar`) - Contains shared utilities, custom exceptions, and global error handlers.
2. **`scm-entities`** (`jar`) - Database persistence layer containing JPA Entities and data models.
3. **`scm-security`** (`jar`) - Security management, JWT authentication, and Role-Based Access Control (RBAC) logic.
4. **`scm-ejb`** (`ejb`) - Core business engine utilizing Enterprise JavaBeans (EJBs), ACID transactions, and EJB Timer Services for automated scheduling.
5. **`scm-web`** (`war`) - JAX-RS RESTful web services and API endpoints for customer, vendor, and customs portals.
*(Optional packaging via **`scm-ear`** for enterprise archive deployment).*

---

## 🚀 Key Technical Features
* **Modular Enterprise Design:** Clean separation of concerns with independent module lifecycles.
* **Robust Transaction Management:** Container-managed ACID transactions ensuring zero data discrepancies across inventory and shipments.
* **Automated Schedulers:** Built-in EJB timers for automated shipment tracking, vendor performance evaluation, and stock replenishment.
* **Multi-Layered Security:** Integrated Jakarta Security & RBAC supporting Logistics Staff, Vendors, Customs Officials, and Customer portals.
* **High Availability & Compliance:** Designed for high-uptime enterprise operations and international trade regulation standards.

---

## 🛠️ Technology Stack
* **Platform:** Java / Jakarta EE 10
* **Server:** Payara Server / WildFly
* **Build Tool:** Maven (Multi-module)
* **Persistence:** JPA / Hibernate
* **API:** JAX-RS (RESTful Web Services)
