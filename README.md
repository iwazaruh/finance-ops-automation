# Finance Operations & Automation Suite

This repository showcases a collection of tools and scripts designed to optimize financial workflows, improve data integrity, and automate reporting in high-stakes Fintech environments.

## 🚀 Key Projects

### 1. Grafana Payload Generator (JSON Automation)
**Problem:** Platform users struggled daily with manual data retrieval across different databases to find specific wallet details and determine the correct message queue. This process was slow, frustrating for the team, and highly prone to critical errors in transaction processing.

**Solution:** Designed a SQL-driven dashboard in Grafana that queries PostgreSQL to generate standardized JSON payloads.

**Impact:** - Adopted by 16 users (L1, L2, and Managers).
- Accuracy: 100% reduction in manual data entry errors.
- It gives you the payload ready and its proper queue to send it.
- It is not time consuming, just paste the wallet and you have the payload for it.
- Efficiency: Instant results, incidents from clients can be resolved quickly.

### 2. Shift Reporting Automation
**Problem:** Level 1 Analysts (6 users) spent significant manual effort daily to aggregate ticket data from support platforms for shift handovers and weekly management reviews. This led to reporting delays and potential data inconsistencies.

**Solution:** Developed a suite of 3 Linux-based automation scripts that interface with FreshService to automatically extract, process and create a CSV for all tickets data the team has been working on at the end of each shift (Morning, Afternoon, Night). 

**Impact:** - Adopted by 6 users (L1 Team).
- L1 users tend to be exhausted after his/her shift, and it avoids copy, paste and link too many tickets at the end of each shift.
- It reduces errors when they copy and paste.
- You can keep the records clean, formatted in CSV for shift handovers.
- Reduced documentation time by 40% for the Level 1 Analyst team.


## 🛠 Tech Stack
- **Languages:** Bash (Linux), SQL (PostgreSQL).
- **Monitoring:** Grafana.
- **Tools:** Postman (API), JMSTool, FreshService.
