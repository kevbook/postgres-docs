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

<img src="https://user-images.githubusercontent.com/926720/210864662-ded37c86-27c2-46aa-b4d4-613f94eb4d40.png">
