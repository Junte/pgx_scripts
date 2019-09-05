select
	C.relname as "relation",
	pg_size_pretty( pg_total_relation_size(C.oid) ) as "total_size",
	S.idx_scan,
	S.idx_tup_read,
	S.idx_tup_fetch
from
	pg_class C
left join pg_namespace N on
	(N.oid = C.relnamespace)
left join pg_stat_all_indexes S on
	(S.indexrelname = C.relname)
where
	nspname not in ( 'pg_catalog', 'information_schema' )
	and C.relkind = 'i'
	and nspname !~ '^pg_toast'
order by
	pg_total_relation_size(C.oid) desc
