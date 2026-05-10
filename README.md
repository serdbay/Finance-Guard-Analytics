# FinanceGuard Analytics

Production-grade dbt + Microsoft Fabric CI/CD pipeline for fintech fraud detection.

## 🎯 Project Objective
Fintech şirketi için fraud detection ve regulatory reporting platformu.
Ham finansal veriyi temiz, test edilmiş ve dokümante edilmiş mart tablolarına dönüştürür.

## 🏗️ Data Architecture
raw_customers ──→ stg_customers ──→
raw_accounts  ──→ stg_accounts  ──→  fct_customer_risk
raw_transactions → stg_transactions → fct_customer_transactions
→ fct_transactions_incremental

## 🛠️ Tech Stack
- Microsoft Fabric Lakehouse
- dbt-core 1.11.8 + dbt-fabricspark
- GitHub Actions (CI/CD)
- Azure CLI Authentication

## 📦 Setup
```bash
pip install dbt-core dbt-fabricspark
dbt debug
dbt seed
dbt run
dbt test
```

## ✅ Test
```bash
dbt test
```

