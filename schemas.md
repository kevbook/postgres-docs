# Schemas

```sql
SELECT
  s.nspname as "schema",
  s.oid as schema_id,
  u.usename as "owner"

FROM pg_catalog.pg_namespace s
  JOIN pg_catalog.pg_user u ON u.usesysid = s.nspowner

ORDER BY 1;
```

