set lines 160
select owner, name, substr(text,1,80) txt
from dba_source
where owner in ('IMS','IMSWAPS','GENERIC')
and lower(text) like '%'||lower('&text')||'%';
