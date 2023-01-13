# Performance

Identifying poorly performing queries using `pg_stat_statements`

```sql
SELECT
  pg_roles.rolname AS "user",
  "query",
  -- Number of times the query has been called
  calls AS "num_calls",
  -- Total time spent executing the query
  (ROUND(total_exec_time::numeric / 1000, 2) || 's') AS "total_time",
  (ROUND(mean_exec_time::numeric / 1000, 2) || 's') AS "mean_time",
  (ROUND(stddev_exec_time::numeric / 1000, 2) || 's') AS "stddev_time",
  ROUND((100 * total_exec_time / SUM(total_exec_time::numeric) OVER())::numeric, 2) AS "percentage_overall"

FROM extensions.pg_stat_statements
  JOIN pg_roles ON (userid=oid)

WHERE pg_roles.rolname !~ '^(pg_|rds)'
ORDER BY mean_time DESC
LIMIT 25;
```

<img src="https://user-images.githubusercontent.com/926720/212415855-8736310f-649d-4f8d-ab23-ebb172dc24df.png">
