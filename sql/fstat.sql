-------------------------------------------------------------------------------
--
-- PLEASE NOTE
-- 
-- No warranty, no liability, no support.
--
-- This script is 100% at your own risk to use.
--
-------------------------------------------------------------------------------
col name format a40
set lines 120
set trimspool on
select d.name, f.phyrds, f.phywrts, f.PHYBLKRD, f.PHYBLKWRT, f.MAXIORTM, f.MAXIOWTM
from v$datafile d, v$filestat f
where d.file# = f.file#
order by f.phyrds+f.phywrts;
