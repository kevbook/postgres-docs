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

<img width="400" src="https://user-images.githubusercontent.com/926720/210604408-1be0780a-d35d-48f2-9bd5-b03d886bf9ac.png">
