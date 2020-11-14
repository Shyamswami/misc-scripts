set pages 0
set lines 300
set verify off
spool /tmp/xxx.sql
select 'alter table '||table_name||' &enable_disable constraint '||constraint_name||';'
from user_constraints
where constraint_type = 'R';
spool off
@/tmp/xxx.sql
