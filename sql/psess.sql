-------------------------------------------------------------------------------
--
-- PLEASE NOTE
-- 
-- No warranty, no liability, no support.
--
-- This script is 100% at your own risk to use.
--
-------------------------------------------------------------------------------
col status format a16
set verify off
col username format a32
select s.sid, s.serial#, 
          s.username
  || ' ('||s.last_call_et||')' username,
  case when s.lockwait is null then
       case when s.username is null then
          nvl2(j.job_sid,'ACTIVE','INACTIVE')
       else
          s.status
       end     
  else 'BLOCKED-'||blocking_session
  end status, 
  s.sql_id sql_id, 
  case when s.program is not null then s.program
       when s.username is null then ( select p.program
                                      from   v$process p
                                      where  s.PADDR = p.ADDR )
       end || '-' || s.osuser program , 
       terminal
from v$session s, 
          ( select sid job_sid
            from   v$lock
            where  type = 'JQ' ) j
where lower(s.program) like lower('%&prog%')
and s.sid = j.job_sid(+)
order by s.program;


