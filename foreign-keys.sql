# Foreign Keys

```sql
SELECT
  conrelid::regclass AS "table",
  conname AS foreign_key,
  pg_get_constraintdef(oid)

FROM pg_constraint

WHERE
  contype = 'f'
  AND connamespace NOT IN ('auth'::regnamespace, 'storage'::regnamespace)

ORDER BY
  conrelid::regclass::text,
  contype DESC;
```

<img width="400" src="">


