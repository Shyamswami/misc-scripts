col name format a40
col value format a30
select name, value
from v$parameter
where  name like nvl('&name',name)||'%'
order by 1;

