startup nomount pfile=/u01/app/oracle/product/11.2.0/xe/dbs/initXE.ora

CREATE DATABASE XE
   LOGFILE GROUP 1 ('/u01/app/oracle/oradata/XE/redo01a.log') SIZE 100M BLOCKSIZE 512,
           GROUP 2 ('/u01/app/oracle/oradata/XE/redo02a.log') SIZE 100M BLOCKSIZE 512,
           GROUP 3 ('/u01/app/oracle/oradata/XE/redo03a.log') SIZE 100M BLOCKSIZE 512
   MAXLOGFILES 5
   MAXLOGMEMBERS 5
   MAXLOGHISTORY 1
   MAXDATAFILES 100
   CHARACTER SET JA16SJISTILDE
   NATIONAL CHARACTER SET AL16UTF16
   SET TIME_ZONE = '+09:00'
   EXTENT MANAGEMENT LOCAL
   DATAFILE '/u01/app/oracle/oradata/XE/system01.dbf'
      SIZE 325M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
   SYSAUX DATAFILE '/u01/app/oracle/oradata/XE/sysaux01.dbf'
      SIZE 325M REUSE  AUTOEXTEND ON MAXSIZE UNLIMITED
   DEFAULT TABLESPACE users
      DATAFILE '/u01/app/oracle/oradata/XE/users01.dbf'
      SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
   DEFAULT TEMPORARY TABLESPACE temp
      TEMPFILE '/u01/app/oracle/oradata/XE/temp01.dbf'
      SIZE 20M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
   UNDO TABLESPACE undotbs1
      DATAFILE '/u01/app/oracle/oradata/XE/undo01.dbf'
      SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/catalog.sql
@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/catproc.sql
connect system/manager
@/u01/app/oracle/product/11.2.0/xe/sqlplus/admin/pupbld.sql

quit;
/
