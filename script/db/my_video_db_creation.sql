-- This script create the user and database according to the k8s ConfigMap. 
-- This setup cannot be done bay any way unless script running
CREATE ROLE my_video NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'password';
GRANT ALL ON SCHEMA public TO my_video;


create database my_video with owner my_video;
GRANT ALL ON DATABASE my_video TO my_video;
