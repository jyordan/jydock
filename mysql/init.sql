SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET GLOBAL general_log = 1;
SET GLOBAL general_log_file = "/var/log/mysql/general-log.log";
FLUSH GENERAL LOGS;
