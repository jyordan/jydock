SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET GLOBAL general_log = 1;
SET GLOBAL general_log_file = "/var/log/mysql/general-log.log";
FLUSH GENERAL LOGS;

DROP USER IF EXISTS 'readonly'@'%';
DROP USER IF EXISTS 'crud'@'%';

-- Create a read-only user
CREATE USER 'readonly'@'%' IDENTIFIED BY 'password';

-- Grant SELECT privileges on all tables in the database to the read-only user
GRANT SELECT ON *.* TO 'readonly'@'%';

-- Create a new user
CREATE USER 'crud'@'%' IDENTIFIED BY 'password';

-- Grant all privileges on all tables in the database to the new user
GRANT ALL PRIVILEGES ON *.* TO 'crud'@'%';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;
