begin
dbms_scheduler.create_job(
job_name => 'RMAN_INC_BACKUP',
job_type => 'EXECUTABLE',
job_action => 'C:\Program Files\Git\git-bash.exe',
number_of_arguments => 1,
start_date => SYSTIMESTAMP,
credential_name=>'cred',
auto_drop => FALSE,
enabled => FALSE);
end;

begin
dbms_scheduler.set_job_argument_value(
job_name => 'RMAN_INC_BACKUP',
argument_position => 1,
argument_value => 'c:\script\daily.sh');
end;

begin
dbms_scheduler.set_attribute(
name => 'RMAN_INC_BACKUP',
attribute => 'start_date',
value => trunc(sysdate)+23/24);
end;

begin
dbms_scheduler.run_job('RMAN_INC_BACKUP');
end;

SELECT credential_name,
       username,
       windows_domain
FROM   user_scheduler_credentials
ORDER BY credential_name;

BEGIN
  dbms_scheduler.drop_job(job_name => 'RMAN_INC_BACKUP');
END;

exec dbms_scheduler.create_credential('cred','linkh','ironalucard');

select SESSION_KEY, INPUT_TYPE, STATUS,
to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
to_char(END_TIME,'mm/dd/yy hh24:mi') end_time,
elapsed_seconds/3600 hrs
from V$RMAN_BACKUP_JOB_DETAILS
order by session_key;

select * from dba_scheduler_job_run_details where CREDENTIAL_NAME like 'cred%';

select job_name,enabled,owner, state from dba_scheduler_jobs where job_name in ('RMAN_INC_BACKUP');

select * from user_scheduler_job_run_details;


begin
dbms_scheduler.set_attribute(
name => 'RMAN_INC_BACKUP',
attribute => 'repeat_interval',
value => 'freq=daily;byday=mon,tue,wed,thu,fri,sat;byhour=23');
dbms_scheduler.enable( 'RMAN_INC_BACKUP' );
end;