col username format a16
col default_tablespace format a16
col temporary_tablespace format a16
set lines 200
set verify off
undefine username
alter user &username default tablespace users temporary tablespace temp;
