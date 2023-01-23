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

---

### Primary, Unique & Check Constraints

```sql
CREATE TABLE "user" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "notification_id" uuid NOT NULL,
  "notification_type" text NOT NULL,
  "name" text NULL,
  "is_deleted" boolean NOT NULL DEFAULT FALSE,

  PRIMARY KEY ("id"),
  CONSTRAINT "fkey_user_notification_id" FOREIGN KEY ("notification_id") REFERENCES "notification" ("id"),
  CONSTRAINT "ukey_user_notification_id_notification_type" UNIQUE ("notification_id", "notification_type"),

  -- When is_deleted is true, then we should not have name
  CONSTRAINT "check_user_is_deleted_name"
    CHECK (NOT ("is_deleted" = 't' AND "name" IS NOT NULL))
);
```
