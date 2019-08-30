SELECT
  relname,
  seq_scan,
  idx_scan,
  n_live_tup,
  pg_size_pretty(pg_relation_size(relname :: regclass)) AS TableSize
FROM pg_stat_all_tables
WHERE schemaname = 'public'
ORDER BY relname;
