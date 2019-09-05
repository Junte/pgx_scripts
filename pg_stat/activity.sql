select datname, pid, usename, backend_type, wait_event, query
from pg_stat_activity;