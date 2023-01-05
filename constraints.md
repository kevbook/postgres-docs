# Constraints

```sql
WITH CTE AS (
  SELECT
    conrelid::regclass AS "table",
    conname AS "name",
    pg_get_constraintdef(oid) AS "definition"
  FROM pg_constraint
)

SELECT * FROM CTE
WHERE "table"::text !~ '^(pg_|rds|supabase|storage|pgsodium|auth|audit)'
ORDER BY 1, 2;
```

<img alt="image" src="https://user-images.githubusercontent.com/926720/210879346-208bd633-d422-44c1-b2cf-ad79237a2dcc.png">
